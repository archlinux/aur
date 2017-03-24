#Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
#Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
#Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
#Contributor: Muhammed Uluyol <uluyol0@gmail.com>

pkgname=foo2zjs-nightly
pkgver=20161203
pkgrel=2
pkgdesc="foo2zjs Printer Drivers (automatically updated). Includes also foo2hp, foo2hbpl, foo2oak, foo2xqx, foo2qpdl, foo2slx, foo2hiperc and foo2lava drivers."
url="http://foo2zjs.rkkda.com/"
license=('GPL' 'custom')
depends=('psutils' 'cups')
conflicts=('foo2zjs')
provides=('foo2zjs')
replaces=('foo2zjs')
makedepends=('unzip' 'bc' 'wget' 'foomatic-db-engine')
optdepends=('tix: required by hplj10xx_gui.tcl')
arch=('i686' 'x86_64')
options=('!emptydirs' '!ccache')
install='foo2zjs.install'

pkgver() {
	local date=$(wget -qO- 'http://foo2zjs.rkkda.com' | sed -nre 's|.*Tarball last modified: <i>(.+)</i>.*|\1|p')
	if ! [[ "$date" ]]; then
		error "Could not extract package last modification date '$date', please report this to the maintainer"
		return 1
	fi

	date +%Y%m%d -u -d "$date"
}

# `source` is evaluated before `pkgver()`, so a lazy downloader will not re-download the existing source file even if version changes.
# Hence, manually include `pkgver()` in the source file name so that it will be re-downloaded if version changes.
source=("foo2zjs-$(pkgver).tar.gz::http://foo2zjs.rkkda.com/foo2zjs.tar.gz"
        '0001-Makefile-DESTDIR-support.patch'
        '0002-Makefile-general-fixes.patch'
        '0003-Rework-firmware-loading.patch'
        '0004-Makefile-fix-generating-.ppd-in-place.patch'
	'0005-Makefile-leverage-default-rules-as-much-as-possible-.patch')

sha256sums=('1514b28e529cfe66a0de8f68372c44c011b79a2e581e1ca36378980515941ff3'
            'dbb632abc38df11e461c9003d3bcfd35794faa0cf9492b54b6f06990cb3ecddd'
            '06cbfcca0a5127ee410ebcb40e6a23aca183058feb8925af00c285345df31874'
            '580563bdb5fc39df238722d41a3cfdd0d6744976911fb84c617a820264bce288'
            'c97bf5f461a7ffa1e23dc5667588d0f83770f31964eaf56ea8f1fed960da5c13'
            'b2cc15134ff9e68a2528b6b21758293cbc541a02f3b65dfbf83a8fcb0b1ff74d')

prepare() {
  cd foo2zjs

  for p in "${source[@]:1}"; do
    patch -Np1 -i "$srcdir/$p"
  done

  msg "Building 'getweb' helper and downloading extras"

  make getweb
  ./getweb all
}

build() {
  cd foo2zjs

  make all ppd
}

package() {
  cd foo2zjs

  install -d "${pkgdir}"/usr/share/{applications,pixmaps,cups/model}

  make DESTDIR="${pkgdir}" install install-hotplug

#  install -m755 getweb "${pkgdir}/usr/bin"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
