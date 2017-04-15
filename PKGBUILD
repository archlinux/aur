#Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
#Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
#Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
#Contributor: Muhammed Uluyol <uluyol0@gmail.com>

pkgname=foo2zjs-nightly
pkgver=20170412
pkgrel=1
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

sha256sums=('SKIP'
            '5bb596a33c74d80a4efbc654ee57cfa5d7fa745f46880b116247e0938a3005b0'
            'be38f1d49290ffdd75e1b692268f0cafed97f29fc9800d2f6f0a63e93d9a8874'
            'ab45df3afe8e25699904be6b2dc709fb4bdd0dd5e348c4f180678e27ec866177'
            'df6c992c5efbb8f30cfbb249a7444564b27a40ad5e43b4c1975b714a56b9a90b'
            '1961671d931a542a438377a56eae42d414f07cde25296565d0099a0d46e3ac98')

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
