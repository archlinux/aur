# Contributor: Andrea Zucchelli <zukka77@gmail.com>
pkgname=monicelli
#pkgver=r326.f7fc90d
pkgver=2.3.0
pkgrel=1
pkgdesc="An esoterical programming language based on the so-called \"supercazzole\" from the movie Amici Miei, a masterpiece of the Italian comedy."
arch=('i686' 'x86_64')
url="https://github.com/esseks/monicelli"
license=('GPL-3.0-or-later')
groups=()
depends=('llvm18-libs')
makedepends=('bison>=3' 'flex>=2.5' 'cmake' 'clang18' 'ragel' 'llvm18')
#provides=("${pkgname%-git}")
#conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
#source=('monicelli::git+https://github.com/esseks/monicelli.git' 'cmakelist.patch')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/esseks/monicelli/archive/v${pkgver}.tar.gz" 'cmakelist.patch')
noextract=()
md5sums=('064d1f3aa5aafc7eeaa7a8c1173dbf5d' '57e9ab46d684b52c808f285a08a45d3b')



prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
	cat  $srcdir/cmakelist.patch | patch src/CMakeLists.txt
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	if [ ! -d build ];then
		mkdir build
	fi 
	cd build
	 
	LLVM_DIR=/usr/lib/llvm18 LDFLAGS="$(/usr/lib/llvm18/bin/llvm-config --ldflags) -lLLVM-18" CXXFLAGS="$(/usr/lib/llvm18/bin/llvm-config --cxxflags)" cmake ..
	make
}


package() {
	cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 build/src/mcc  $pkgdir/usr/bin/mcc
	install -Dd -m755 examples $pkgdir/usr/share/${pkgname}/examples 
	cp -r examples/*  $pkgdir/usr/share/${pkgname}/examples 
	install -D -m755 Specification.txt $pkgdir/usr/share/${pkgname}/Specification.txt
}
