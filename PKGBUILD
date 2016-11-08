#Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
#Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
#Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
#Contributor: Muhammed Uluyol <uluyol0@gmail.com>

pkgname=foo2zjs
pkgver=20161105
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
        '0004-Makefile-fix-generating-.ppd-in-place.patch'
	'0005-Makefile-leverage-default-rules-as-much-as-possible-.patch')

sha256sums=('aeae02808157633145aba789ad017e66a1208c12386ca2a259ad4567436cb0a8'
            '5935bfc2d7127cf47ee828710145075a1ba0e538e349389b514a0f3afa603618'
            '40bea306e1d379fbd9a7452617807f16694384e58d7e4ece0de4a6f189caca8c'
            '6df5958dad60c5a486b4dc9ad138f9e6a45d40e55e2af307c0304fa7ea96b6c2'
            'c4dfa7351148df96710aa3a5c0223c2c107f71c3f9b33bd251fbb9e20860a2e8'
            'a817509ce1bdaf4f2c68ba5a98a931de47ddcfe1bb9f6b8fb9ed7b36b0144f03')

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

  make DESTDIR="${pkgdir}" install install-hotplug

#  install -m755 getweb "${pkgdir}/usr/bin"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
