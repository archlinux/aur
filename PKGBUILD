# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=k86-software-git
_pkgname=k86-software
pkgver=0.2.0.r1.gb289fd9
pkgrel=1
pkgdesc='Configuration software for the Attack Shark K86 keyboard (CLI and GTK 3 GUI, git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/TheElevatedOne/K86-Software-Linux'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'gtk3')
makedepends=('git' 'cmake' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname" 'attackshark-k86')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  # Protocol tests only; the GUI self-test needs a display (run it with `ctest` in a session).
  ctest --test-dir build --output-on-failure -R '^k86tests$'
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "$_pkgname"
  install -Dm644 README.md docs/PROTOCOL.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
