pkgname=maybar-git
_pkgname=maybar
pkgver=1.11.0.r112.ga0ebf48
pkgrel=1
pkgdesc="Simplistic and highly configurable status panel for Wayland (fork of yambar)"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/mathstuf/maybar"
license=('MIT')
options=('!debug')

depends=(
  'wayland'
  'pixman'
  'libyaml'
  'alsa-lib'
  'json-c'
  'libmpdclient'
  'libpulse'
  'pipewire'
  'curl'
  'fcft>=3.0.0'
  'fcft<4.0.0'
)

makedepends=(
  'git'
  'meson'
  'ninja'
  'scdoc'
  'tllist>=1.0.1'
)

provides=('maybar')
conflicts=('maybar')

source=("git+https://codeberg.org/mathstuf/maybar.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --tags --long \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" -Wno-error -Wno-error=unused-but-set-variable"
  export CXXFLAGS+=" -Wno-error -Wno-error=unused-but-set-variable"

  arch-meson "$_pkgname" build \
    -Db_lto=true \
    --wrap-mode=nofallback

  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 \
    "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
