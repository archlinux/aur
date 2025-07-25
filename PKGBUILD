# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=make-static
_pkgname=make
pkgver=4.4.1
pkgrel=1
pkgdesc="GNU make utility to maintain groups of programs"
arch=(aarch64 'x86_64')
url="https://www.gnu.org/software/make"
license=('GPL3')
conflicts=(make)
provides=(make)
makedepends=('musl' 'gcc' 'gzip')
source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3'
            'SKIP')
validpgpkeys=('6D4EEB02AD834703510B117680CB727A20C79BB2')   # Paul Smith

build() {
  export CC=musl-gcc CFLAGS="$CFLAGS -Os" LDFLAGS="$LDFLAGS -static"
	cd "${_pkgname}-${pkgver}"
	./configure --prefix=/usr --without-guile --disable-load
  ./build.sh
}

check() {
  make -j $(nproc) -C "${_pkgname}-${pkgver}" -k check
}

package() {
	make -C "${_pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
