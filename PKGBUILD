# Guidelines specific to Bazaar, Git, Mercurial and Subversion packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: minerharry <miner.harry567@gmail.com>
pkgname=keysharp-input-git
pkgver=v1.1.1.r0.gd57605c
pkgrel=1
pkgdesc="Input hooks for KeySharp (Autohotkey Port) for linux, compatible with X11 and Wayland."
arch=('x86_64')
url="https://github.com/keysharp-org/keysharp-input"
license=('GPL-3.0-or-later')
groups=()
depends=('libevdev' 'polkit') #also udev, which comes with systemd 
makedepends=('git' 'cmake' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=keysharp-input.install
source=("keysharp-input::git+https://github.com/keysharp-org/keysharp-input")
noextract=()
sha256sums=('SKIP')


# Please refer to the USING VCS SOURCES section of the PKGBUILD man page for
# a description of each element in the source array

prepare() {
  cd "keysharp-input"
  git submodule update --init
}

pkgver() {
  cd "keysharp-input"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )

}

build() {
  cd "keysharp-input"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build --parallel
}

check() {
  cd "keysharp-input"
  ctest --test-dir build --output-on-failure
}

package() {
  cd "keysharp-input"
  DESTDIR="${pkgdir}" cmake --install build

  #install library location config to ld.so.conf.d using builtin
  bash packaging/configure-library-path.sh /usr/local/lib "${pkgdir}/etc/ld.so.conf.d/keysharp-input.conf"

  echo "build complete"

  #further installation/uninstallation happens in keysharp-input.install
}
