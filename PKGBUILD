# Maintainer: Justin Dray <justin@dray.be>
# Contributor:  Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Thomas S Hatch <thatch45 ar gmail dot com>
# Contributor: Michael P <ptchinster@archlinux.us>
# Contributor: Matt Heagney <matt@heagney.com>

pkgname=multipath-tools
pkgver=0.5.0
pkgrel=1
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
	buffer-overflows.patch
	blacklist-cciss-devices.patch)
md5sums=('faf261d4cc717bf4c979557dc7bf5f52'
         '869942bdd31decc696f9cf4af24df65b'
         'c81422ccf5fd5ca6208dfbdd66ff323c')

prepare() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/buffer-overflows.patch"
  patch -Np1 -i "${srcdir}/blacklist-cciss-devices.patch"

  sed -i 's|/etc/udev/rules.d|/usr/lib/udev|g' Makefile.inc kpartx/Makefile kpartx/kpartx.rules
  sed -i 's|${prefix}/lib/udev|${prefix}/usr/lib/udev|g' Makefile.inc
  sed -i 's|/sbin|/usr/bin|g' Makefile.inc multipathd/multipathd.service
  sed -i '/Before/d' multipathd/multipathd.service
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

  install -d "${pkgdir}/usr/share/multipath/examples"
  install -Dm644 "multipath.conf.annotated" "${pkgdir}/usr/share/multipath/examples/multipath.conf.annotated"
  install -Dm644 "multipath.conf.defaults" "${pkgdir}/usr/share/multipath/examples/multipath.conf.defaults"
  install -Dm644 "multipath.conf.synthetic" "${pkgdir}/usr/share/multipath/examples/multipath.conf.synthetic"
  install -Dm644 "multipath.conf.defaults" "${pkgdir}/etc/multipath.conf"
  rm "${pkgdir}/usr/lib/libmpathpersist.so"
  ln -s "${pkgdir}/usr/lib/libmpathpersist.so.0" "libmpathpersist.so"
}
