# Maintainer:  Michael Lass <bevan@bi-co.net>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Thomas S Hatch <thatch45 ar gmail dot com>
# Contributor: Michael P <ptchinster@archlinux.us>
# Contributor: Matt Heagney <matt@heagney.com>

pkgname=multipath-tools
pkgver=0.5.0
pkgrel=4
pkgdesc='Multipath tools for Linux (including kpartx)'
arch=('i686' 'x86_64')
url="http://christophe.varoqui.free.fr/"
license=('GPL2')
depends=('libaio' 'device-mapper')
conflicts=('multipath-tools-git')
backup=('etc/multipath.conf')
install=multipath-tools.install
options=(!emptydirs)
source=(http://christophe.varoqui.free.fr/multipath-tools/$pkgname-$pkgver.tar.bz2
	blacklist-cciss-devices.patch)
sha256sums=('f13cf1eb84e94e83b2019e68f7965526903c13e94246db43965d181668a0a6f9'
            '415f90ea44e79a8d453eebdbca5fead6ac16f4ebcc3238f31a05b8014c2e8f0f')

prepare() {
  cd  "${srcdir}/${pkgname}-${pkgver}"

  # Blacklist cciss devices as they are not fully supported
  patch -p1 < "${srcdir}/blacklist-cciss-devices.patch"

  # Fix some paths that are hardcoded
  sed -i 's|/etc/udev/rules.d|/usr/lib/udev|g' kpartx/Makefile
  sed -i 's|${prefix}/lib/udev|${prefix}/usr/lib/udev|g' Makefile.inc
  sed -i 's|/sbin|/usr/bin|g' Makefile.inc multipathd/multipathd.service

  # Not sure why this is in here. Would the Before= line hurt anyone?
  sed -i '/Before/d' multipathd/multipathd.service

  # systemd-daemon is a compat lib that is not included in Arch's systemd package since v229
  sed -i 's/lsystemd-daemon/lsystemd/g' libmultipath/Makefile multipathd/Makefile
}

build() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make LIB="/usr/lib" \
       DESTDIR="${pkgdir}" \
       install

  # Install sample and default config
  install -dm755 "${pkgdir}/usr/share/multipath/examples"
  install -m644 multipath.conf* "${pkgdir}/usr/share/multipath/examples"
  install -Dm644 multipath.conf.defaults "${pkgdir}/etc/multipath.conf"

  # Fix library symlinks. libmpathpersist.so is broken and libmultipath.so is completely missing
  ln -sf "/usr/lib/libmpathpersist.so.0" "${pkgdir}/usr/lib/libmpathpersist.so"
  ln -s "/usr/lib/libmultipath.so.0" "${pkgdir}/usr/lib/libmultipath.so"
}
