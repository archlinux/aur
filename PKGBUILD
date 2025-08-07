# Maintainer: Flinner Yuu <flinner @ tilde DOT team>
pkgname='jank-git'
pkgver=r1.4e696aa
pkgrel=1
pkgdesc="The native Clojure dialect hosted on LLVM with seamless C++ interop."
arch=('x86_64')
url=""
license=('MPL-2.0')
options=(!buildflags) # CXXFLAGS and CFLAGS set by /etc/makepkg.conf break our Clang
depends=('gcc' 'libzip' 'lbzip2' 'libxml2' 'libedit' 'python3') # TODO ???
makedepends=('git' 'git-lfs' 'pkg-config' 'cmake' 'ninja' 'make' 'libffi' 'entr' 'doctest' )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# Source is in `prepare` to allow for `--depth=1`
# source=('git+https://github.com/jank-lang/jank')
source=()
sha256sums=()

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	if [ ! -d "$srcdir/jank/.git" ]; then
		git clone --depth 1 --single-branch --shallow-submodules --recurse-submodules https://github.com/jank-lang/jank.git
  else
    echo "Jank repository already cloned, skipping."
  fi
}

build() {
	# Build Clangd (Jank requires custom clangd)
	cd "$srcdir/${pkgname%-git}"
	cd compiler+runtime
	mkdir -p build

	# `/etc/makepkg.conf` overrides -DLLVM_ENABLE_EH=ON -DLLVM_ENABLE_RTTI=ON ...
	export CFLAGS+=" -fPIC -fexceptions"
	export CXXFLAGS+=" -fPIC -fexceptions -frtti"

	CC=clang  CXX=clang++ ./bin/build-clang
	export CC=$PWD/build/llvm-install/usr/local/bin/clang; export CXX=$PWD/build/llvm-install/usr/local/bin/clang++

	# Build Jank, finally...
./bin/configure -GNinja \
	                -DCMAKE_BUILD_TYPE=None \
									-Djank_local_clang=on \
			            -Wno-dev
./bin/compile

}

check() {
	cd "$srcdir/${pkgname%-git}"
	cd compiler+runtime
	./bin/configure -GNinja -DCMAKE_BUILD_TYPE=None -Djank_local_clang=on -Djank_test=on
	./bin/compile
	./bin/test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd compiler+runtime
	./bin/install --prefix="$pkgdir/usr"
}
