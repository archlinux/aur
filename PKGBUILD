#Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
#Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
#Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
#Contributor: Muhammed Uluyol <uluyol0@gmail.com>

pkgname=foo2zjs
pkgver=20161021
pkgrel=1
pkgdesc="foo2zjs Printer Drivers. Includes also foo2hp, foo2hbpl, foo2oak, foo2xqx, foo2qpdl, foo2slx, foo2hiperc and foo2lava drivers."
url="http://foo2zjs.rkkda.com/"
license=('GPL' 'custom')
depends=('psutils' 'cups')
conflicts=('foo2zjs-testing')
makedepends=('unzip' 'bc' 'wget' 'foomatic-db-engine')
optdepends=('tix: required by hplj10xx_gui.tcl')
arch=('i686' 'x86_64')
options=('!emptydirs' '!ccache')
install='foo2zjs.install'
source=("foo2zjs-$pkgver.tar.gz::http://foo2zjs.rkkda.com/foo2zjs.tar.gz"
        '0001-Makefile-DESTDIR-support.patch'
        '0002-Makefile-general-fixes.patch'
        '0003-Rework-firmware-loading.patch'
        '0004-Makefile-skip-installing-Foomatic-files.patch'
        '0005-Makefile-fix-generating-.ppd-in-place.patch'
	'0006-Makefile-leverage-default-rules-as-much-as-possible-.patch')

sha256sums=('55604f4580fb21534739c294df64e041b6ea96ef45d8a0ff4cdcf516eff243a3'
            '2c0e40294c3f77a33e242280e280a98ed834a16584072b2d0f5fa95d0c44503f'
            '33c1c7bd31ddee2b27ef06f726684da503bc165873f10db68e7435a1e3690756'
            '320a7d5d1e10474e8e11e201a05e741d6a7786ca1c1b5ebbe668f63ac6d5b765'
            'cfaa38ea47afbd89b0d85a944d336a2ef30e2964beefb6a3cfc312b1d2b6ab2b'
            'cc6befb039909ee8a09e2ef47ef10c72d4bbe59df52d35687506cfd2ad484e62'
            '0d7dd404b84e354bdad579820e0fbe334e553a561ab0986aabd528a22628eecf')

prepare() {
  cd "${pkgname}"

  for p in "${source[@]:1}"; do
    patch -Np1 -i "$srcdir/$p"
  done

  msg "Building 'getweb' helper and downloading extras"

  make getweb
  ./getweb all
}

build() {
  cd "${pkgname}"

  make all ppd
}

package() {
  cd "${pkgname}"

  install -d "${pkgdir}"/usr/share/{applications,pixmaps,cups/model}

  make DESTDIR="${pkgdir}" install install-hotplug-prog

#  install -m755 getweb "${pkgdir}/usr/bin"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
