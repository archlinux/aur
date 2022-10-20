# Maintainer: Huang-Huang Bao <eh5@sokka.cn>

_pkgbase=liblc3
pkgbase=liblc3-git
pkgname=(liblc3-git)
pkgver=v1.0.1.r0.gcf1676d
pkgrel=1
pkgdesc="Low Complexity Communication Codec (LC3)"
url="https://github.com/google/${_pkgbase}"
license=(Apache)
arch=(x86_64)
makedepends=(git meson)
source=(
  "git+https://github.com/google/${_pkgbase}.git"
  "pr-12.patch::https://github.com/google/liblc3/pull/12.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd $_pkgbase
  patch -Np1 <../pr-12.patch
}

pkgver() {
  cd $_pkgbase
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
