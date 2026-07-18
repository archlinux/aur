# Maintainer: oldkingOK <oldkingok.creeper@gmail.com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river-opacity
_pkgname=river
pkgver=0.4.5
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor (with window opacity patch)"
arch=('x86_64')
url="https://isaacfreund.com/software/river/"
license=('0BSD' 'CC-BY-SA-4.0' 'GPL-3.0-only' 'MIT')
depends=(
    'glibc'
    'libevdev'
    'libinput'
    'libxkbcommon'
    # 'mesa'
    'pixman'
    # 'sh'
    'wayland'
    'wlroots0.20'
    'xorg-xwayland'
)
makedepends=(
    'git'
    'scdoc'
    'wayland-protocols'
    'zig'
    # https://codeberg.org/ziglang/zig/issues/31272
    'clang'
)
# optdepends=('polkit: access seat through systemd-logind')
# provides=('river-window-management-v1')

source=(git+https://codeberg.org/river/river.git#tag=v${pkgver}
        river-opacity.patch)
#
# disable source caching for now: https://codeberg.org/ziglang/zig/issues/31866
# 
# PACKAGING.md -> build.zig.zon
# source+=(zig-pixman-0.3.0.tar.gz::https://codeberg.org/ifreund/zig-pixman/archive/v0.3.0.tar.gz
         # zig-wayland-0.6.0.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v0.6.0.tar.gz
         # zig-wlroots-0.20.1.tar.gz::https://codeberg.org/ifreund/zig-wlroots/archive/v0.20.1.tar.gz
         # zig-xkbcommon-0.4.0.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.4.0.tar.gz
         # translate_c::git+https://codeberg.org/ziglang/translate-c.git#commit=57c559cf581b1fcad90494eda219f98abeb155ce)
noextract=("${source[@]:1}")
conflicts=('river-classic' 'river')
sha256sums=('87b6d9ca61be97e1493c539887ae18c5bd9a9b0bbf13ada0458e0b4f3ce0b93b'
            'aa33997bdb4299828fdc001b8f2e7cf04e513c577cd0c7de86b71c624d11a67a')

prepare() {
    cd $_pkgname && patch -p1 -i ../river-opacity.patch
}

build() {
  cd $_pkgname
  DESTDIR="build" zig build \
    -Dllvm --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --build-id=sha1 \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Dpie \
    -Doptimize=ReleaseSafe \
    -Dxwayland
    # --global-cache-dir ../zig-global-cache \
    # --system ../zig-global-cache/p \
}

check() {
  cd $_pkgname
  zig build test \
    -Dllvm --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --build-id=sha1 \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Dpie \
    -Doptimize=ReleaseSafe \
    -Dxwayland
    # --global-cache-dir ../zig-global-cache \
    # --system ../zig-global-cache/p \
}

package() {
  cd $_pkgname

  cp -a build/* "$pkgdir"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions"

  # add license + exception
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSES/{0BSD.txt,MIT.txt}
}
