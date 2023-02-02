# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Contributor: bradpitcher
# Contributor: mkurz
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=signal-desktop-arm
_pkgname=Signal-Desktop
pkgver=6.3.0
pkgrel=1
pkgdesc="Signal Private Messenger for Linux - ARM (aarch64)"
license=('AGPL3')
conflicts=('signal-desktop' 'signal-desktop-beta' 'signal-desktop-beta-bin')
arch=('aarch64' 'x86_64')
url="https://github.com/signalapp/Signal-Desktop"
depends=('gtk3' 'libvips' 'libxss' 'hicolor-icon-theme' 'alsa-lib' 'openjpeg2')
makedepends=('yarn' 'git' 'git-lfs' 'nodejs' 'npm' 'python' 'libxcrypt-compat' 'fpm')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
  "expire-from-source-date-epoch.patch"
)
sha512sums=('133ab71bc0428496e4cff314ad4b4fbd723e41f34fe4464a3cd36db747bda74f560219d85d3d0cad1fa3dde6b9c87f55e6d55d719d9e63dd0a8bc18183a88b78'
            'ba6887afeb7a135a1042c4708f6f15199840273fcc8a56992cd135ff478c22e3b2bdb7d59cda487ffc6e396d27b843259ffe0ee9597d397ee4362cffb0f6296f'
            '1154859e87d8a2d649bc23210f2dd8aa473f268166559a51a2a64fe6ae094c101121535623b05b711bd87aab1f219627e9274fa542fdb0e5fe6f34b46fd7b7df')
b2sums=('55b72ebb2c5e324ef4a48be5615d222e1031b0441547abe7dd9bec9a38af3e3bbe040af1d4c9c716e9b14098e4507550fbe593a687ecabf1f02b883005da6f52'
        '3cd41a4addcd4b712ee687b6636e1b370ff14479133ceb53eba3db041e20b56fb78ccbc2b24fe6571c5054e5b352b6ac2bf0864c18d004fb1abbcdf34bc09ff4'
        '5a6dba4bfa799403ace721b143c5b54d3bff97ab0c3d30e94d312cf58ede2498886720247b0efcbbeffc0c95611a493625cef1f8bc06d3647b53ef2e44de96be')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # git-lfs hook needs to be installed for one of the dependencies
  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json

  yarn install --ignore-engines
}

build() {
  cd "${_pkgname}-${pkgver}"

  # temporary fix for openssl3
  export NODE_OPTIONS=--openssl-legacy-provider

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
