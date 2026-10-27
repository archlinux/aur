# Guidelines specific to Bazaar, Git, Mercurial and Subversion packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: minerharry <miner.harry567@gmail.com>
pkgname=keysharp-desktop-git
pkgver=v1.0.3.r0.gb28cac1
pkgrel=1
pkgdesc="Desktop interaction (windows, clipboard, etc) for KeySharp (Autohotkey Port) for linux, compatible with X11, KWin/Plasma Wayland, GNOME/Cinammon, and more."
arch=('x86_64')
url="https://github.com/keysharp-org/keysharp-desktop"
license=('GPL-3.0-or-later')
groups=()
depends=(
    'polkit' 'glib2'
    'libxcb' 'libxkbcommon' #x11 (todo: test without)
    'wayland' 'wayland-protocols' #wayland (todo: test without)
    )
makedepends=('git' 'cmake' 'gcc' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=keysharp-desktop.install
source=("keysharp-desktop::git+https://github.com/keysharp-org/keysharp-desktop")
noextract=()
sha256sums=('SKIP')


# Please refer to the USING VCS SOURCES section of the PKGBUILD man page for
# a description of each element in the source array

prepare() {
  cd "keysharp-desktop"
  git submodule update --init
}

pkgver() {
  cd "keysharp-desktop"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )

}

build() {
  cd "keysharp-desktop"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build --parallel
}

check() {
  cd "keysharp-desktop"
  ctest --test-dir build --output-on-failure
}

package() {
  cd "keysharp-desktop"
  DESTDIR="${pkgdir}" cmake --install build

#  #install library location config to ld.so.conf.d using builtin
#  bash packaging/configure-library-path.sh /usr/local/lib "${pkgdir}/etc/ld.so.conf.d/keysharp-input.conf"

  echo "build complete"

  #further installation/uninstallation happens in keysharp-desktop.install
}
