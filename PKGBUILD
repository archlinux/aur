#Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
#Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
#Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
#Contributor: Muhammed Uluyol <uluyol0@gmail.com>

pkgname=foo2zjs
pkgver=20161021
pkgrel=4
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

sha256sums=('55604f4580fb21534739c294df64e041b6ea96ef45d8a0ff4cdcf516eff243a3'
            'f13c6a2308df53d7ed5636f6d77aae7616fc0e8437ca5f4f79ed4361c92eb709'
            'cf40a20898b9619545bdcf2a59e72e0018c47d81b965b8a781e01688faa1abae'
            'dd049ccd362c098515d3873c17b9f09b2d78da697e89d2022f537d7587874861'
            'ef76d05b549e2c5875eabe7f526fda3caa5151824000ef582a869601edfbf690'
            '83c37616c37887df933910b5dee30cedb118e4c3e4b08d7ab6dd7813466441f2')

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
