#Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
#Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
#Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
#Contributor: Muhammed Uluyol <uluyol0@gmail.com>

pkgname=foo2zjs-nightly
pkgver=20180325
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
	local date=$(curl -s 'http://foo2zjs.rkkda.com' | sed -nre 's|.*Tarball last modified: <i>(.+)</i>.*|\1|p')
	if ! [[ "$date" ]]; then
		error "Could not extract package last modification date '$date', please report this to the maintainer"
		return 1
	fi

	date +%Y%m%d -u -d "$date"
}

# `source` is evaluated before `pkgver()`, so a lazy downloader will not re-download the existing source file even if version changes.
# Hence, manually include `pkgver()` in the source file name so that it will be re-downloaded if version changes.
source=(
	"foo2zjs-$(pkgver).tar.gz::http://foo2zjs.rkkda.com/foo2zjs.tar.gz"
	'0001-Makefile-DESTDIR-support.patch'
	'0002-Makefile-general-fixes.patch'
	'0003-Rework-firmware-loading.patch'
	'0004-Makefile-fix-generating-.ppd-in-place.patch'
	'0005-Makefile-leverage-default-rules-as-much-as-possible-.patch'
	'0006-Makefile-do-not-blacklist-usblp-seems-unnecessary-co.patch'
)

sha256sums=('SKIP'
            '620e4bd9da088c96843f2a124301e5529bc6a3c92b87b535ee907042cdb46756'
            '4110354cdbdf73349585a7d823f7c0b4aac0ff930ce718cb59a7e28c9ead57bb'
            '50b8c3403403bfe36730db2a04b47c7f8c1afd36115edb8474aaa09c8b75d0f9'
            '4a399fb37b061cad3c506ad4d3584f3d547c2ed1434c4b245ca5fde94ea313a3'
            'c92a8ce7b49cc69271ae4ea1338ebf65632bfce6c9e68d959e9fd1391f23e1bb'
            '32255dbd841facc8aa17e89668d499760395e3d750aa9ee8750e0fbd9afa574e')

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
