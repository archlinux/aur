pkgname=mira-git
pkgver=0.2.0.r39.g53dd587
pkgrel=1
pkgdesc='Unit test runner for Rime schemas'
arch=('x86_64' 'aarch64')
url='https://github.com/rimeinn/mira'
license=('MIT')
depends=(
  'librime'
  'yaml-cpp'
  'lua54'
  'argparse'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'gcc'
  'pkgconf'
)
provides=('mira')
conflicts=('mira')
source=('git+https://github.com/rimeinn/mira.git')
sha256sums=('SKIP')

pkgver() {
  cd mira
  local version
  version="$(sed -n "s/^project('mira', 'cpp', version: '\\([^']*\\)'.*/\\1/p" meson.build)"
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson mira build \
    --buildtype=release \
    -Dlua_version=5.4
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 mira/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
