# Contributor: Andrea Zucchelli <zukka77@gmail.com>
pkgname=monicelli-git
pkgver=r326.f7fc90d
pkgrel=1
pkgdesc="An esoterical programming language based on the so-called \"supercazzole\" from the movie Amici Miei, a masterpiece of the Italian comedy."
arch=('i686' 'x86_64')
url="https://github.com/esseks/monicelli"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'bison>=3' 'flex>=2.5' 'cmake' 'clang14' 'ragel' 'llvm14')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('monicelli::git+https://github.com/esseks/monicelli.git' 'cmakelist.patch')
noextract=()
md5sums=('SKIP' '57e9ab46d684b52c808f285a08a45d3b')



pkgver() {
	cd "$srcdir/${pkgname%-git}"


# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	cat  $srcdir/cmakelist.patch | patch src/CMakeLists.txt
}

build() {
	cd "$srcdir/${pkgname%-git}"
	if [ ! -d build ];then
		mkdir build
	fi 
	cd build
	 
	LLVM_DIR=/usr/lib/llvm14 LDFLAGS="$(/usr/lib/llvm14/bin/llvm-config --ldflags) -lLLVM-14" CXXFLAGS="$(/usr/lib/llvm14/bin/llvm-config --cxxflags)" cmake ..
	make
}


package() {
	cd "$srcdir/${pkgname%-git}"
    install -D -m755 build/src/mcc  $pkgdir/usr/bin/mcc
	install -Dd -m755 examples $pkgdir/usr/share/${pkgname%-git}/examples 
	cp -r examples/*  $pkgdir/usr/share/${pkgname%-git}/examples 
	install -D -m755 Specification.txt $pkgdir/usr/share/${pkgname%-git}/Specification.txt
}
