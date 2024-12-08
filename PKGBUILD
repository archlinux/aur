# Maintainer: pryme-svg <edoc.www@gmail.com>

_basename="man2html"

pkgname="vh-man2html"
pkgver="1.6g_16"
pkgrel=1
pkgdesc="convert man pages into HTML format"
arch=('x86_64')
url="https://salsa.debian.org/debian/man2html"
license=('GPL2')
depends=()
makedepends=()
optdepends=()
provides=('man2html')
conflicts=('man2html')
_packager="debian"
_srcname="${_basename}-${_packager}-${pkgver//_/-}"
source=("https://salsa.debian.org/debian/${_basename}/-/archive/debian/${pkgver//_/-}/${_srcname}.tar.gz"
        "makemsg.patch")
sha256sums=('0d96e743a9bfccd484aa519a9de1b5e5d551b8a39f41eb8088ac21b1bf8f64cf'
            '7f492e8d672588f6781652fccd09191fda5ffd9b28c597c978608acff0e514dd')

prepare() {
	cd "$_srcname"
	patch -Np1 < "../makemsg.patch"
	patchdir=$srcdir/$_srcname/debian/patches
	while read p; do
		echo "Applying patch $p..."
		patch -Np1 < "$patchdir/$p"
	done < "$patchdir/series"
}

build() {
	cd "$_srcname"
	./configure -d +fhs
	make manhtml
}

package() {
	cd "$_srcname"
	make DESTDIR="$pkgdir/" install -C man2html # don't need CGI service
}
