# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sin Kim

pkgname=newmat-shared
pkgver=10E
pkgrel=2
pkgdesc="C++ matrix library (shared library)"
arch=("x86_64")
url="http://www.robertnz.net"
license=("LicenseRef-newmat")
depends=("glibc" "libgcc" "libstdc++")
provides=("newmat=$pkgver" "libnewmat.so")
conflicts=("newmat")
# keep exporting inline functions, like previous builds
options=("!lto")
source=("https://www.robertnz.net/ftp/newmat10.tar.gz")
noextract=("newmat10.tar.gz")
sha256sums=("637d18c0363b8bb99c48eb04cce8c182ccbff771df0bf1e2d541e95f6eb34e7b")

prepare() {
	# the archive has no top level directory
	mkdir -p newmat
	bsdtar -xf newmat10.tar.gz -C newmat
	# only change to the original sources: put everything into namespaces
	sed -i 's|^//#define use_namespace|#define use_namespace|' newmat/include.h
}

build() {
	cd newmat
	local objects=(newmat{1..9}.o newmat{ex,nl,rm}.o bandmat.o cholesky.o evalue.o fft.o hholder.o
		jacobi.o myexcept.o newfft.o solution.o sort.o submat.o svd.o)

	make -f nm_gnu.mak CXXFLAGS="$CPPFLAGS $CXXFLAGS -fPIC" "${objects[@]}"
	g++ $CXXFLAGS $LDFLAGS -shared -Wl,-soname,libnewmat.so.10 -o libnewmat.so.10 "${objects[@]}"
	ln -sf libnewmat.so.10 libnewmat.so
}

check() {
	cd newmat
	local objects=(tmt.o tmt{1..9}.o tmt{a..m}.o)

	make -f nm_gnu.mak CXXFLAGS="$CPPFLAGS $CXXFLAGS" "${objects[@]}"
	g++ $LDFLAGS -o tmt "${objects[@]}" -L. -lnewmat
	LD_LIBRARY_PATH="$PWD" ./tmt | tee tmt.log
	# one test matrix is non-zero on purpose
	grep -q "Number of non-zero matrices (should be 1) = 1" tmt.log
}

package() {
	cd newmat
	install -Dm 755 libnewmat.so.10 -t "$pkgdir/usr/lib/"
	ln -s libnewmat.so.10 "$pkgdir/usr/lib/libnewmat.so"
	install -Dm 644 {boolean,controlw,include,myexcept,newmat,newmatap,newmatio,newmatnl}.h \
		{newmatrc,newmatrm,precisio,solution}.h -t "$pkgdir/usr/include/newmat/"
	install -Dm 644 nm10.htm README -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
