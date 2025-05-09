pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgver=2.30.2
pkgrel=1
pkgdesc="A generic ZigBee monitoring and control tool"
url="https://www.dresden-elektronik.de"
license=('BSD 3-Clause "New" or "Revised" License')
groups=()
depends=('hicolor-icon-theme'
         'libcap'
         'libpng'
	 'libxcrypt-compat'
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
  '99-conbee3.rules'
  'deconz.sysusers'
  'deconz.tmpfiles'
)
source_x86_64=($pkgname-$pkgver-x86_64.deb::https://deconz.dresden-elektronik.de/ubuntu/stable/$pkgname-$pkgver-qt5.deb)
source_armv6h=($pkgname-$pkgver-armv6h.deb::https://deconz.dresden-elektronik.de/raspbian/stable/$pkgname-$pkgver-qt5.deb)
source_armv7h=($pkgname-$pkgver-armv7h.deb::https://deconz.dresden-elektronik.de/raspbian/stable/$pkgname-$pkgver-qt5.deb)
source_aarch64=(${pkgname}_${pkgver}-debian-buster-stable_arm64.deb::https://deconz.dresden-elektronik.de/debian/stable/${pkgname}_${pkgver}-debian-buster-stable_arm64.deb)
sha256sums=('568f0ff41fad18d6a26ef96a90181e6fac6b1dd6abd69d202de849d1caf76354'
            'b39ef78676141edfd148944a287aea4d20ee202abe37dff564a977c367d7b385'
            '4f4554238a3ee2ecd7af3510a3e4ff5a62259082f9b1672904da29c933c5e065'
            '5cb6ea540da8cfb4343b97792886952ee244fa272b3c00e6e5c7dcc1aa10eb1c')
sha256sums_x86_64=('2f35d4de1e861b5465b0d72960dae43cf48ee55b890e93644ab7332cbae363d1')
sha256sums_armv6h=('f4afe3e646718dd23be50fc4045261f4fe0da1bd5ddc9c1654bfcacd66f43890')
sha256sums_armv7h=('f4afe3e646718dd23be50fc4045261f4fe0da1bd5ddc9c1654bfcacd66f43890')
sha256sums_aarch64=('2f35d4de1e861b5465b0d72960dae43cf48ee55b890e93644ab7332cbae363d1')
noextract=()

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  chown -R root:root "${pkgdir}"
  cp -rfv "${pkgdir}/lib" "${pkgdir}/usr"
  rm -rf "${pkgdir}/lib"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"

  # Run services with user deconz
  sed -e "s/User=1000/User=deconz/" -i ${pkgdir}/usr/lib/systemd/system/deconz.service ${pkgdir}/usr/lib/systemd/system/deconz-gui.service
  install -vDm 644 "69-conbee.rules" "${pkgdir}/etc/udev/rules.d/69-conbee.rules"
  install -vDm 644 "99-conbee3.rules" "${pkgdir}/etc/udev/rules.d/99-conbee3.rules"
  install -vDm 644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm 644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
