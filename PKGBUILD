# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=cgrep-clang
pkgname=$_name
pkgver=1.1
_mainfolder=cgrep-$pkgver
pkgrel=2
pkgdesc='grep for C/C++ source files'
arch=(any)
url=https://github.com/terminaldweller/cgrep
license=(GPL3)
depends=(llvm clang)
makedepends=(git)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        git+https://github.com/terminaldweller/cfe-extra#commit=0d705a3
        adjust-libclang-lib-names.patch)
sha256sums=('68e7e66029f643a3a7e745a88bf95516c517aec1739c81ba1f1d3978833c7d80'
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
}

package() {
  cd "$srcdir/$_mainfolder"

  # see https://www.archlinux.org/todo/llvm-10/
  patch -p1 -i "$srcdir/adjust-libclang-lib-names.patch"

  make

  # `make install` isn't provided, so we have to manually copy the files
  install -dm755 "$pkgdir"/{usr/bin,usr/share/licenses/$_name}
  install -m 755 cgrep "$pkgdir/usr/bin"
  install -m 644 LICENSE "$pkgdir"/usr/share/licenses/$_name/LICENSE.md
}
