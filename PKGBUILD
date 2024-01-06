# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wayprompt-git
pkgver=0+74+ac34121
pkgrel=1
pkgdesc='Multi-purpose prompt tool for Wayland (pinentry)'
url='https://git.sr.ht/~leon_plickat/wayprompt'
license=(GPL3)
depends=(fcft libxkbcommon pixman wayland )
makedepends=(git wayland-protocols zig)
arch=(x86_64)
source=(
    git+https://git.sr.ht/~leon_plickat/wayprompt
    git+https://git.sr.ht/~novakane/zig-fcft
    git+https://github.com/ifreund/zig-pixman.git
    git+https://github.com/ifreund/zig-xkbcommon.git
    git+https://github.com/ifreund/zig-wayland.git
    0001-add-option-to-build-PIE-executables.patch
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'c8f1bae6f23cabc7a408372896e9e2dda5db4190ae68f5b21eb73873945106f11129156d1446591b92cffe029ed68a4d11ecd7000dd7a7cffc00a8713284fecb')

pkgver() {
  cd ${pkgname%-git}
  printf "0+%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  sed -i 's/wayprompt.install();/wayprompt.pie=true;\nwayprompt.install();/' build.zig
  git submodule init
  git config submodule."deps/zig-wayland".url "${srcdir}/zig-wayland"
  git config submodule."deps/zig-pixman".url "${srcdir}/zig-pixman"
  git config submodule."deps/zig-xkbcommon".url "${srcdir}/zig-xkbcommon"
  git config submodule."deps/zig-fcft".url "${srcdir}/zig-fcft"
  git -c protocol.file.allow=always submodule update
  patch -Np1 < ../0001-add-option-to-build-PIE-executables.patch
}

build() {
  cd ${pkgname%-git}
  DESTDIR="build" zig build \
    --prefix /usr \
    --search-prefix /usr \
    -Dtarget=native-linux.5.15-gnu.2.37 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe \
    -Dpie=true
}

package() {
  cd ${pkgname%-git}
  mv -v build/* "${pkgdir}"
}
