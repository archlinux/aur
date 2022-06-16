# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>
# This package is just an adaptation of the signal-desktop package
# that is in the official repos in order to provide a beta version
# of signal that does not use precompiled binaries.
# AUR Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=signal-desktop-beta
_pkgname=Signal-Desktop
pkgver=5.47.0beta1
pkgrel=1
pkgdesc='Signal Private Messenger for Linux - Beta version.'
license=('GPL3')
conflicts=('signal-desktop-beta-bin')
arch=('x86_64')
url="https://signal.org"
depends=('gtk3' 'libvips' 'libxss' 'hicolor-icon-theme')
# We need libxcrypt-compat for it to build: https://github.com/electron-userland/electron-builder-binaries/issues/47
makedepends=('yarn' 'git' 'nodejs-lts-gallium' 'npm' 'python' 'git-lfs' 'libxcrypt-compat')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver//beta*}-beta.${pkgver##*beta}.tar.gz"
  "${pkgname}.desktop"
  "expire-from-source-date-epoch.patch"
  "signal-desktop-wrapper.sh"
  )
sha512sums=('ed08672ab9c46a5c409512d567d83b85b5f200f3de0cc1aa867682233d5369fe0c93820abd59b2124c87e9dd765cc4474f312ed5c51c8590f06f7c1c59ef49b3'
            '70b6e5ae8552bfa96ed9a838548c4e5797160cf0f65b3760460c16009a3edae42520b618032307c5d03648178ed7d52bdfcf20083c37d361756c54aa17c76583'
            '1154859e87d8a2d649bc23210f2dd8aa473f268166559a51a2a64fe6ae094c101121535623b05b711bd87aab1f219627e9274fa542fdb0e5fe6f34b46fd7b7df'
            '457c1bd044f4e17810a7f1b284ca38809a0c1f8fed4bdb52184a169e2996e683c4c96c1cc86a013feb7b8833557245397decdcec01dbc82bb2b12b0d80424e25')

prepare() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json

  yarn install --ignore-engines

  # We can't read the release date from git so we use SOURCE_DATE_EPOCH instead
  patch --forward --strip=1 --input="${srcdir}/expire-from-source-date-epoch.patch"
}

build() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  yarn generate
  yarn prepare-beta-build
  yarn build
}

package() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  install -d "${pkgdir}/usr/"{lib,bin}
  cp -a release/linux-unpacked "${pkgdir}/usr/lib/${pkgname}"
  ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -Dm 644 "../${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "build/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}

