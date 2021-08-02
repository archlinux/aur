# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=cgrep-clang
pkgname=$_name
pkgver=1.1.2
_mainfolder=cgrep-$pkgver
pkgrel=1
pkgdesc='grep for C/C++ source files'
arch=(any)
url=https://github.com/terminaldweller/cgrep
license=(GPL3)
depends=(llvm clang)
makedepends=(git)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
        git+https://github.com/terminaldweller/cfe-extra#commit=0d705a3
        adjust-libclang-lib-names.patch)
sha256sums=('f3d4cb66401282b89e6400d10056f1553e9126428c40e2a02bbafc4e288c79dc'
            'SKIP'
            'c726ccfdc45f9ad434647cfcab95ac536700ab87978f05f3a341a555642eb8c4')

prepare() {
  cd "$srcdir/$_mainfolder"

  # if the repo we are going to clone already exists, delete it
  if [ -d "$srcdir"/$_mainfolder/cfe-extra ]; then
    rm -R "$srcdir"/$_mainfolder/cfe-extra
  fi

  # we can't use "git config submodule" here like in cgrep-clang-git because in
  # cgrep-clang we download an archive and do not clone a repo
  git clone "$srcdir"/cfe-extra

  # see https://www.archlinux.org/todo/llvm-10/
  patch -p1 -i "$srcdir/adjust-libclang-lib-names.patch"
}

build() {
  cd "$srcdir/$_mainfolder"
  make
}

package() {
  cd "$srcdir/$_mainfolder"

  # `make install` isn't provided, so we have to manually copy the files
  install -dm755 "$pkgdir"/{usr/bin,usr/share/licenses/$_name}
  install -m 755 cgrep "$pkgdir/usr/bin"
  install -m 644 LICENSE "$pkgdir"/usr/share/licenses/$_name/LICENSE.md
}
