# Maintainer: Huang-Huang Bao <eh5@sokka.cn>

_pkgbase=liblc3
pkgbase=liblc3-git
pkgname=(liblc3-git)
pkgver=1.0.1.r5.g685b1d0
pkgrel=2
pkgdesc="Low Complexity Communication Codec (LC3)"
url="https://github.com/google/${_pkgbase}"
license=(Apache)
arch=(x86_64)
makedepends=(git meson)
source=(
  "git+https://github.com/google/${_pkgbase}.git"
)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

  meson install -C builddir --destdir "$pkgdir"
}
