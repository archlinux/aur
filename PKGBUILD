#Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
#Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
#Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
#Contributor: Muhammed Uluyol <uluyol0@gmail.com>

pkgname=foo2zjs-nightly
pkgver=20161108
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

sha256sums=('75df43dbba15dafec6b100115a0ee1e444769bf9189a8eee15cc3b8d1835ecc8'
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
