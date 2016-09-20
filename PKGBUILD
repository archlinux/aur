#Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
#Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
#Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
#Contributor: Muhammed Uluyol <uluyol0@gmail.com>

pkgname=foo2zjs
pkgver=20160902
pkgrel=1
pkgdesc="foo2zjs Printer Drivers. Includes also foo2hp, foo2hbpl, foo2oak, foo2xqx, foo2qpdl, foo2slx, foo2hiperc and foo2lava drivers."
url="http://foo2zjs.rkkda.com/"
license=('GPL' 'custom')
depends=('psutils' 'cups' 'foomatic-db-engine' 'foomatic-db-foo2zjs')
conflicts=('foo2zjs-testing')
provides=('foo2zjs')
makedepends=('unzip' 'bc' 'wget')
optdepends=('tix: required by hplj10xx_gui.tcl')
arch=('i686' 'x86_64')
options=('!emptydirs' '!ccache')
install='foo2zjs.install'
source=('http://foo2zjs.rkkda.com/foo2zjs.tar.gz'
        'destdir-support-20140329-1.patch'
        'gen-fixes-20140329-1.patch'
        'firmware-loader-20130602-1.patch'
        'udev-firmware-loading-ruleset-20130601-1.patch')

sha256sums=('0e04ecf67c38538dd463a1b635d43339dbdbe018af96fe6d2828668852d5c6e7'
            '6fe2abe505305c627e35123ffdf80279b0e6e065b34a1967674fe56f09380f6a'
            '2a104b8f93d8cb4bd0a10156043f9cf47eddaa728f6317d235bc6d9843312f05'
            '5fe072326173d5008741ffed2e122053f821eabc0d3369ef64a2e346e4e327d1'
            '32c2ccf07eb0be50f2d27e976de6383795ff1755f72965e47c238825621c459d')

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

  make
}

package() {
  cd "${pkgname}"

  install -d "${pkgdir}"/usr/share/{applications,pixmaps,cups/model}
  install -d "${pkgdir}"/usr/share/foomatic/db/source/{driver,opt,printer}

  make DESTDIR="${pkgdir}" install install-hotplug-prog

#  install -m755 getweb "${pkgdir}/usr/bin"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
