# Maintainer: Ayush Juvekar <ayushjuvekar@gmail.com>
#
# Omachess is built from source for the machine it runs on. The package owns
# only program files, the launcher entry, its icon, and its documentation: no
# Hyprland window rules, no Omarchy hooks, and no install scriptlet, so
# installing and removing it never touches the player's desktop configuration
# or their chess work.

pkgname=omachess
pkgver=0.1.0
pkgrel=1
pkgdesc='Local-first chess workspace for Omarchy: play, study, and create forms of chess'
arch=('x86_64' 'aarch64')
url='https://github.com/AyushJ1001/omachess'
# GPL-3.0-or-later is one of Arch's common licenses, so the package points at
# /usr/share/licenses/common/GPL3 rather than shipping its own copy.
license=('GPL-3.0-or-later')

# The Rules Authority is C++ compiled by the core's build.rs and bundled into
# the Rust static library. Under makepkg's global LTO those objects carry only
# bitcode, which the final link cannot resolve against the rustc-produced ones,
# so this package opts out.
options=('!lto')

# Omarchy 4 (Quattro) is a hard dependency: Omachess reads the active Quattro
# theme and targets its compositor, launcher, and notification surfaces.
depends=(
  'omarchy>=4.0.0'
  'qt6-base'
  'qt6-declarative'
  # The Piece Set artwork is vector, so the workspace needs the SVG handler.
  'qt6-svg'
  # The Live Store links system SQLite through rusqlite.
  'sqlite'
  'hicolor-icon-theme'
)
makedepends=(
  'cmake>=3.24'
  'ninja'
  'rust'
  'cargo'
  'python>=3.11'
)

# The release tarball is signed; makepkg verifies the detached signature
# against this key before anything is built.
#
# Ayush Juvekar <ayushjuvekar@gmail.com>, the Omachess release-signing key.
validpgpkeys=('9F20651D9E6414773BBDEFD327F405346508E367')

source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
  "$pkgname-$pkgver.tar.gz.sig::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
# The tarball's digest is pinned; a detached signature has no digest of its own,
# and it is what makepkg verifies against validpgpkeys anyway.
sha256sums=('5b020c230b9ac6672fc9bbe273ce3cf3348416f36ce72ddec64f49e7acd4466e'
            'SKIP')

build() {
  cd "$pkgname-$pkgver"
  # One CMake build covers everything: it drives cargo for the Rust core and
  # links it into the workspace binary.
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver"
  ctest --test-dir build --output-on-failure
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
