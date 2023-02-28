# Maintainer: Huang-Huang Bao <eh5@sokka.cn>

_pkgbase=pw-capture
pkgname=${_pkgbase}-git
pkgver=r25.a62cd68
pkgrel=1
pkgdesc="Vulkan/OpenGL (game) capture for PipeWire"
url="https://github.com/EHfive/${_pkgbase}"
license=(MIT Apache)
arch=(x86_64)
makedepends=(git meson rust clang libpipewire libffi)
depends=(libpipewire-0.3.so pipewire libffi.so)
provides=(pw-capture)
optdepends=(
  'lib32-pw-capture: Capture 32-bit graphics applications'
  'vulkan-icd-loader'
  'libglvnd'
)
source=(
  "git+https://github.com/EHfive/${_pkgbase}.git"
)
sha256sums=('SKIP')
options=(!debug)

pkgver() {
  cd $_pkgbase
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  # make AUR helper happy
  rm -rf builddir || true
  arch-meson $_pkgbase builddir \
    -D profile=release

  meson compile -C builddir
}

package() {
  meson install -C builddir --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "${_pkgbase}/LICENSE-MIT"
}
