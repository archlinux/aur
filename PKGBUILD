# Maintainer: CharOfString <root@charofstring.cc>

pkgname=flakewm-git
_pkgname=flakewm
pkgver=3.0.0.gxde3.r0.g8e41598
pkgrel=1
pkgdesc='GXDE Wayland compositor'
arch=('x86_64' 'aarch64')
url='https://github.com/flake-wm/flake-wm'
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'glib2'
  'json-c'
  'libdisplay-info'
  'libdrm'
  'libepoxy'
  'libglvnd'
  'libinput'
  'libjpeg-turbo'
  'libliftoff'
  'libpng'
  'librsvg'
  'libunwind'
  'libxcb'
  'libxkbcommon'
  'mesa'
  'openssl'
  'pango'
  'pixman'
  'seatd'
  'systemd-libs'
  'vulkan-icd-loader'
  'wayland'
  'xcb-util-errors'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'xorg-xwayland'
)
makedepends=(
  'git'
  'cmake'
  'glslang'
  'hwdata'
  'meson'
  'ninja'
  'qt6-base'
  'qt6-declarative'
  'qt6-5compat'
  'systemd'
  'vulkan-headers'
  'wayland-protocols'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null |
      sed 's/^v//;s/\([^-]*-g[0-9a-f]*\)$/r\1/;s/-/./g' ||
      printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  local _tag
  _tag=$(git -C "$_pkgname" describe --tags --abbrev=0)
  msg2 "$_pkgname -> $_tag"
  git -C "$_pkgname" checkout -q --detach "refs/tags/$_tag"
}

build() {
  cmake -S "$_pkgname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_BINDIR=bin \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWLCOM_EXAMPLES=OFF \
    -DWLCOM_UKUI_THEME=ON \
    -DWLCOM_WLROOTS_RENDERERS=gles2,vulkan
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  test -x "$pkgdir/usr/bin/flakewm"
  test -x "$pkgdir/usr/bin/startflakewm"
}
