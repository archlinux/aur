pkgname=deconz
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgver=2.32.5
pkgrel=1
pkgdesc="A generic ZigBee monitoring and control tool"
url="https://www.dresden-elektronik.de"
license=('BSD 3-Clause "New" or "Revised" License')
groups=()
depends=('hicolor-icon-theme'
         'libcap'
         'libpng'
	 'libxcrypt-compat'
         'qt6-base'
         'qt6-5compat'
         'qt6-serialport'
	 'qt6-declarative'
         'qt6-websockets'
         'sqlite')
makedepends=('xz')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug)
install=
changelog=
source=(
  '69-conbee.rules'
  '99-conbee3.rules'
  'deconz.sysusers'
  'deconz.tmpfiles'
)
source_x86_64=(${pkgname}-qt6_${pkgver}_x86_64.deb::https://github.com/dresden-elektronik/deconz-rest-plugin/releases/download/v${pkgver}/${pkgname}-qt6_${pkgver}_amd64.deb)
source_armv6h=(${pkgname}-qt6_${pkgver}-armv6h.deb::https://github.com/dresden-elektronik/deconz-rest-plugin/releases/download/v${pkgver}/${pkgname}-qt6_${pkgver}_armhf.deb)
source_armv7h=(${pkgname}-qt6_${pkgver}-armv7h.deb::https://github.com/dresden-elektronik/deconz-rest-plugin/releases/download/v${pkgver}/${pkgname}-qt6_${pkgver}_armhf.deb)
source_aarch64=(${pkgname}-qt6_${pkgver}-debian-buster-stable_arm64.deb::https://github.com/dresden-elektronik/deconz-rest-plugin/releases/download/v${pkgver}/${pkgname}-qt6_${pkgver}_arm64.deb)
sha256sums=('568f0ff41fad18d6a26ef96a90181e6fac6b1dd6abd69d202de849d1caf76354'
            'b39ef78676141edfd148944a287aea4d20ee202abe37dff564a977c367d7b385'
            '4f4554238a3ee2ecd7af3510a3e4ff5a62259082f9b1672904da29c933c5e065'
            '5cb6ea540da8cfb4343b97792886952ee244fa272b3c00e6e5c7dcc1aa10eb1c')
sha256sums_x86_64=('a4bd04ce2f37e83768543424f89cd46e304dffea0e6e23efb7490773b0f3d73b')
sha256sums_armv6h=('9e93a2033aaf149c93368fda468a88ad5bbbbc156a86fcd9e6df484157201485')
sha256sums_armv7h=('9e93a2033aaf149c93368fda468a88ad5bbbbc156a86fcd9e6df484157201485')
sha256sums_aarch64=('60e56462661bed669fd0779c6275608f8c9d481bcfddcdd22de4ddbf31c56073')
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
