# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>
# This package is just an adaptation of the signal-desktop package
# that is in the official repos in order to provide a beta version
# of signal that does not use precompiled binaries.
# AUR Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=signal-desktop-beta
_pkgname=Signal-Desktop
pkgver=5.14.0beta3
pkgrel=1
pkgdesc='Signal Private Messenger for Linux - Beta version.'
license=('GPL3')
conflicts=('signal-desktop-beta-bin')
arch=('x86_64')
url="https://signal.org"
depends=('gtk3' 'libvips' 'libxss' 'hicolor-icon-theme')
makedepends=('yarn' 'git' 'nodejs-lts-fermium' 'npm6' 'python' 'git-lfs')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver//beta*}-beta.${pkgver##*beta}.tar.gz"
  "${pkgname}.desktop"
  "expire-from-source-date-epoch.patch"
  "signal-desktop-wrapper.sh"
  )
sha512sums=('194a4d63752111aadd882c4eaaa5e3c1ece4b4f1cd20f66a00c56d7d6d0cbf07b5b9126818e3bacc66b83e1074e873589ce521ab6dbf670a6a0b7edbfa3cbe8a'
            'b8d329605183dde34bb269e07cf27f6a543b3dce07e424ffbdd53c9bed69bc02f44c402aa25e70b20dc7bf7538fbfc00576864b5c6d40acc7c1b6d945b030f13'
            '6673066172d6c367961f3e2d762dd483e51a9f733d52e27d0569b333ad397375fd41d61b8a414b8c9e8dbba560a6c710678b3d105f8d285cb94d70561368d5a2'
            '457c1bd044f4e17810a7f1b284ca38809a0c1f8fed4bdb52184a169e2996e683c4c96c1cc86a013feb7b8833557245397decdcec01dbc82bb2b12b0d80424e25')

prepare() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json
  # Select node-gyp versions with python3 support
  sed 's#"node-gyp": "5.0.3"#"node-gyp": "6.1.0"#' -i package.json
  # https://github.com/sass/node-sass/pull/2841
  # https://github.com/sass/node-sass/issues/2716
  sed -r 's#("resolutions": \{)#"resolutions": {"node-sass/node-gyp": "^6.0.0",#' -i package.json

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
  ## temporarily use a wrapper script
  ## https://bugs.archlinux.org/task/69980
  ## https://github.com/NixOS/nixpkgs/pull/122926
  #ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/"
  install -Dm 755 ../signal-desktop-wrapper.sh \
    "${pkgdir}/usr/bin/signal-desktop-beta"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -Dm 644 "../${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "build/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}

