# Maintainer: Huang-Huang Bao <eh5@sokka.cn>

_pkgbase=liblc3
pkgbase=liblc3-git
pkgname=(liblc3-git)
pkgver=r45.448f3de
pkgrel=1
pkgdesc="Low Complexity Communication Codec (LC3)"
url="https://github.com/google/${_pkgbase}"
license=(Apache)
arch=(x86_64)
makedepends=(git meson)
source=("git+https://github.com/google/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  # make AUR helper happy
  rm -rf builddir || true
  arch-meson $_pkgbase builddir \
    -D tools=true

  meson compile -C builddir
}

check() {
  meson test -C builddir --print-errorlogs
}

package_liblc3-git() {
  depends=(glibc)
  provides=(liblc3 liblc3.so)
  conflicts=(liblc3)

  install -Dt "$pkgdir/usr/bin" -m755 builddir/tools/{dlc3,elc3}

  meson install -C builddir --destdir "$pkgdir"
}
