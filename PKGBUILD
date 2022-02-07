# Maintainer: Jurriaan Pruis <email@jurriaanpruis.nl>

pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgver=2.14.01
pkgrel=3
pkgdesc="A generic ZigBee monitoring and control tool"
url="https://www.dresden-elektronik.de"
license=('custom:"Copyright (c) dresden elektronik ingenieurtechnik GmbH"')
groups=()
depends=('hicolor-icon-theme'
         'libcap'
         'libpng'
         'qt5-base'
         'qt5-serialport'
	 'qt5-declarative'
         'qt5-websockets'
         'sqlite')
makedepends=('xz')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  '69-conbee.rules'
  'deconz.sysusers'
  'deconz.tmpfiles'
)
source_x86_64=($pkgname-$pkgver-x86_64.deb::https://deconz.dresden-elektronik.de/ubuntu/stable/$pkgname-$pkgver-qt5.deb)
source_armv6h=($pkgname-$pkgver-armv6h.deb::https://deconz.dresden-elektronik.de/raspbian/stable/$pkgname-$pkgver-qt5.deb)
source_armv7h=($pkgname-$pkgver-armv7h.deb::https://deconz.dresden-elektronik.de/raspbian/stable/$pkgname-$pkgver-qt5.deb)
source_aarch64=(${pkgname}_${pkgver}-debian-buster-stable_arm64.deb::https://deconz.dresden-elektronik.de/debian/stable/${pkgname}_${pkgver}-debian-buster-stable_arm64.deb)
sha256sums=('568f0ff41fad18d6a26ef96a90181e6fac6b1dd6abd69d202de849d1caf76354'
            '4f4554238a3ee2ecd7af3510a3e4ff5a62259082f9b1672904da29c933c5e065'
            '5cb6ea540da8cfb4343b97792886952ee244fa272b3c00e6e5c7dcc1aa10eb1c')
sha256sums_x86_64=('d942211a39ac7cbe4a17fff0f004a26a6d90072650c3d7bdab47b7b31f4a2de0')
sha256sums_armv6h=('6bc18711508285d6d1b789ed43f6101e85d2d783b2c289833dbf8d542411510b')
sha256sums_armv7h=('6bc18711508285d6d1b789ed43f6101e85d2d783b2c289833dbf8d542411510b')
sha256sums_aarch64=('682238ca46f9dad034ab0c2adbe5acdaea62d7634a5b1dd8a2158bf9d6df4312')
noextract=()

package() {
  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"

  # Run services with user deconz
  sed -e "s/User=1000/User=deconz/" -i ${pkgdir}/usr/lib/systemd/system/deconz.service ${pkgdir}/usr/lib/systemd/system/deconz-gui.service
  install -vDm 644 "69-conbee.rules" "${pkgdir}/etc/udev/rules.d/69-conbee.rules"
  install -vDm 644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm 644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
