# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=cgrep-clang
pkgname=$_name-git
pkgver=r154.f7e9ac8
_mainfolder=$_name
pkgrel=1
pkgdesc='grep for C/C++ source files'
arch=(any)
url=https://github.com/bloodstalker/cgrep
license=(GPL3)
depends=(llvm clang)
makedepends=(git)
source=($_name::git+$url
        git+https://github.com/bloodstalker/cfe-extra
        adjust-libclang-lib-names.patch)
sha256sums=('SKIP'
            'SKIP'
            'c726ccfdc45f9ad434647cfcab95ac536700ab87978f05f3a341a555642eb8c4')
conflicts=($_name)
provides=($_name)

pkgver() {
  cd "$srcdir/$_mainfolder"

  # from https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_mainfolder"

  git submodule init
  git config submodule.cfe-extra.url "$srcdir"/cfe-extra
  git submodule update
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
