# Maintainer: Aloxaf <aloxafx@gmail.com>
pkgname=gitstatus-git
pkgver=r509.e26af91
pkgrel=2
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

check() {
  local reply
  echo -nE $'hello\x1f\x1e' | $srcdir/gitstatus/gitstatusd 2>/dev/null | {
    IFS='' read -r -d $'\x1e' -t 5 reply
    [[ $reply == $'hello\x1f0' ]] && return 0 || return 1
  }
}

package() {
	cd "$srcdir/gitstatus"
  install -D "gitstatusd" "$pkgdir/usr/bin/gitstatusd"
  install -D "gitstatus.plugin.zsh" "$pkgdir/usr/share/zsh/plugins/gitstatus/gitstatus.plugin.zsh"
  install -D "gitstatus.prompt.zsh" "$pkgdir/usr/share/zsh/functions/Prompts/prompt_gitstatus_setup"
}
