# Maintainer: Berrit Birkner <aur at bbirkner.de>
# Contributor: m8D2 <omui (at) proton mail (dot) com>
# Contributor: bradpitcher
# Contributor: mkurz
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=signal-desktop-arm
_pkgname=Signal-Desktop
pkgver=6.37.0
pkgrel=1
pkgdesc="Signal Private Messenger for Linux - ARM (aarch64)"
license=('AGPL-3.0-only')
conflicts=('signal-desktop' 'signal-desktop-beta' 'signal-desktop-beta-bin')
arch=('aarch64' 'x86_64')
url="https://signal.org"
depends=(
  'alsa-lib'
  'gtk3'
  'hicolor-icon-theme'
  'libvips'
  'libxss'
  'openjpeg2'
)
makedepends=(
  'git'
  'git-lfs'
  'libxcrypt-compat'
  'nodejs'
  'npm'
  'python'
  'yarn'
  'fpm'
)
optdepends=('xdg-desktop-portal: Screensharing with Wayland')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
)
sha512sums=('60e0e1b74a57fb5884411080e9cf14755a71936a0619f67b061d5f1b979bf770a9960cbadcc5e8017e8d2809aff013afceecad2689683c2694cc60d20d335eac'
            'ba6887afeb7a135a1042c4708f6f15199840273fcc8a56992cd135ff478c22e3b2bdb7d59cda487ffc6e396d27b843259ffe0ee9597d397ee4362cffb0f6296f')
b2sums=('cdf183e16abd5d17f257ba8cf4c49879b10f786f459bfa780ab1f799b6c664d6e760203cbe9e87022dd9c470193b9cbf41fabd9d4ca33a7d471b9961919eeaa9'
        '3cd41a4addcd4b712ee687b6636e1b370ff14479133ceb53eba3db041e20b56fb78ccbc2b24fe6571c5054e5b352b6ac2bf0864c18d004fb1abbcdf34bc09ff4')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # temporary fix for openssl3
  export NODE_OPTIONS=--openssl-legacy-provider

  # git-lfs hook needs to be installed for one of the dependencies
  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json

  yarn install --ignore-engines
}

build() {
  cd "${_pkgname}-${pkgver}"
  yarn generate
  USE_SYSTEM_FPM=true yarn build
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/"{lib,bin}
  cp -a release/linux-*unpacked "${pkgdir}/usr/lib/${pkgname}"
  ln -s "/usr/lib/${pkgname}/signal-desktop" "${pkgdir}/usr/bin/"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -Dm 644 "../${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "build/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}

# vim: ts=2 sw=2 et:
