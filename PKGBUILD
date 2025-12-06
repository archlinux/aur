# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jalv
pkgname=$_pkgname-git
pkgver=1.8.0.r922.5a288e3
pkgrel=1
pkgdesc='A simple but fully featured LV2 host for JACK (git version)'
arch=(x86_64)
url="https://drobilla.net/software/$_pkgname/"
license=(ISC)
depends=(glibc jack)
makedepends=(
  git
  gtk3
  gtkmm
  'lilv>=0.26.0'
  'lv2>=0.18.0'
  python
  qt5-base
#  qt6-base
  'serd>=0.32.2'
  'sord>=0.6.16'
  'sratom>=0.6.4'
  'suil>=0.10.0'
  'zix>=0.8.0'
)
provides=($_pkgname)
conflicts=($_pkgname)
optdepends=(
  'gtk3: Gtk 3.x frontend'
  'qt5-base: Qt 5.x frontend'
#  'qt6-base: Qt 6.x frontend'
)
source=("$_pkgname::git+https://gitlab.com/drobilla/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  arch-meson $_pkgname $_pkgname-build \
    --reconfigure \
    -Dgtk3=enabled \
    -Djack=enabled \
    -Dportaudio=disabled \
    -Dqt5=enabled \
    -Dqt6=disabled
#    -Dqt6=enabled
  meson compile -C $_pkgname-build
}

package() {
  depends+=(
    libjack.so
    liblilv-0.so
    libserd-0.so
    libsratom-0.so
    libzix-0.so
    libsuil-0.so
  )
  meson install -C $_pkgname-build --destdir "$pkgdir"
  # license
  install -vDm 644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  # documentation
  install -vDm 644 $_pkgname/{AUTHORS,NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}
