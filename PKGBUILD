# Maintainer: Aloxaf <aloxafx@gmail.com>
pkgname=gitstatus-git
pkgver=r509.e26af91
pkgrel=1
pkgdesc='10x faster implementation of `git status` command'
arch=('x86_64')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'cmake' 'make' 'gcc')
provides=("gitstatus")
source=(
  'gitstatus::git+https://github.com/romkatv/gitstatus'
  'libgit2::git+https://github.com/romkatv/libgit2'
)
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/gitstatus"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build_libgit2() {
  cd "$srcdir/libgit2"
  mkdir -p build
  cd build
  cmake                        \
    -DCMAKE_BUILD_TYPE=Release \
    -DTHREADSAFE=ON            \
    -DUSE_BUNDLED_ZLIB=ON      \
    -DREGEX_BACKEND=builtin    \
    -DBUILD_CLAR=OFF           \
    -DUSE_SSH=OFF              \
    -DUSE_HTTPS=OFF            \
    -DBUILD_SHARED_LIBS=OFF    \
    -DUSE_EXT_HTTP_PARSER=OFF  \
    -DZERO_NSEC=ON             \
    ..
  make
}

build_gitstatus() {
  cd "$srcdir/gitstatus"
	cxxflags="-I$srcdir/libgit2/include -DGITSTATUS_ZERO_NSEC"
  ldflags="-L$srcdir/libgit2/build -static-libstdc++ -static-libgcc"
  CXXFLAGS=$cxxflags LDFLAGS=$ldflags make
}

build() {
  build_libgit2
  build_gitstatus
}

package() {
	cd "$srcdir/gitstatus"
  install -D "$srcdir/gitstatus/gitstatusd" "$pkgdir/usr/bin/gitstatusd"
}
