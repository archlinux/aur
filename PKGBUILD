#Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
#Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
#Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
#Contributor: Muhammed Uluyol <uluyol0@gmail.com>

pkgname=foo2zjs
pkgver=20161021
pkgrel=3
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
            'b3fdf0702404bf2e4e5e47588d4c1440b95fb301abe0a03c58cf27aedefcadeb'
            '2cc5c9c51f240218106713e36682fd69caca05e04cfe3ee5b857a9bb55959977'
            '81abc3714cf1a6a1f46d5eefe4a6d554e66017befcca66a1d6891ab26f2a014d'
            '537db87a3d7e81c154d6a6b4b6d3b67f893aa4cede6046bf7658e414e9a5f825'
            '90a78899436021695246b884e717cd0f7fb6b4ec8e16e6aac029e0b348c4be50')

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
