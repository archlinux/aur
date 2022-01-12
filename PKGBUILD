# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>
# This package is just an adaptation of the signal-desktop package
# that is in the official repos in order to provide a beta version
# of signal that does not use precompiled binaries.
# AUR Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=signal-desktop-beta
_pkgname=Signal-Desktop
pkgver=5.29.0beta1
pkgrel=1
pkgdesc='Signal Private Messenger for Linux - Beta version.'
license=('GPL3')
conflicts=('signal-desktop-beta-bin')
arch=('x86_64')
url="https://signal.org"
depends=('gtk3' 'libvips' 'libxss' 'hicolor-icon-theme')
makedepends=('yarn' 'git' 'nodejs-lts-gallium' 'npm' 'python' 'git-lfs')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver//beta*}-beta.${pkgver##*beta}.tar.gz"
  "${pkgname}.desktop"
  "expire-from-source-date-epoch.patch"
  "signal-desktop-wrapper.sh"
  )
sha512sums=('3523f2036bec5df6d508ce072210792d797e2a1f0beaf79fb01d49b0776f1f5a88d8465bec9a798ddbe6dd1432867ccce65bb32f3d970019cf0f7b714d040678'
            'b8d329605183dde34bb269e07cf27f6a543b3dce07e424ffbdd53c9bed69bc02f44c402aa25e70b20dc7bf7538fbfc00576864b5c6d40acc7c1b6d945b030f13'
            'aeb695b7fd7d40c316955598ab17f4a3f08f99d7953b7bf4c0ddea478e934865eee5705e20cc0e2bf8061c40a3f6f8ef39b25c649edeb0b340ef7bd660d1bee7'
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

