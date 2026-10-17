# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=k86-software-git
_pkgname=k86-software
pkgver=0.1.1.r0.gc64a2ef
pkgrel=1
pkgdesc='Configuration software for the Attack Shark K86 keyboard (CLI and GTK 3 GUI, git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/TheElevatedOne/AttackSharkKeyboardSoftware'
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
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "$_pkgname"
  install -Dm644 README.md docs/PROTOCOL.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
