# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=make-static
_pkgname=make
pkgver=4.4.1
pkgrel=3
pkgdesc="GNU make utility to maintain groups of programs"
arch=(aarch64 'x86_64')
url="https://www.gnu.org/software/make"
license=('GPL3')
conflicts=(make)
provides=(make)
makedepends=('musl' 'gcc' 'gzip')
source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.lz"{,.sig}
  fix_signatures_for_getenv_getopt.patch)
sha256sums=('8814ba072182b605d156d7589c19a43b89fc58ea479b9355146160946f8cf6e9'
            'SKIP'
            '14aa7e9a923f1aab7da0811cdca094f1aea196aa159a43f8e1507a0dc5c4e3dc')
validpgpkeys=('6D4EEB02AD834703510B117680CB727A20C79BB2')   # Paul Smith

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 <../*.patch
}
build() {
  export CC=musl-gcc CFLAGS="$CFLAGS -Os" LDFLAGS="$LDFLAGS -static -fno-link-libatomic"
	cd "${_pkgname}-${pkgver}"
	./configure --prefix=/usr --without-guile --disable-load
  ./build.sh
}

# check() {
#   make -j $(nproc) -C "${_pkgname}-${pkgver}" -k check
# }

package() {
	make -C "${_pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
  strip $pkgdir/usr/bin/make
}
