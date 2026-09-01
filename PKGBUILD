# Maintainer: Andy Jeffries <andy@andyjeffries.co.uk>

pkgname=panefile-git
_pkgname=panefile
pkgver=r54.a1b837c
pkgrel=1
pkgdesc="Keyboard-driven, multi-panel file manager for Wayland (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/andyjeffries/panefile"
license=('MIT')

# Every optional dependency is a hard one here, deliberately.
#
# §3.4 keeps them out of the binary's load-time dependencies — they are opened
# on first use, and the application runs without any of them. But a package
# that leaves them to optdepends gives most people a build with no syntax
# highlighting, no PDF previews and no video thumbnails, and no indication that
# anything is missing. Installing them costs a few megabytes once; discovering
# their absence costs a bug report.
#
# panefile-git and panefile agree on this. Anyone who wants the lean build has
# makepkg and this file.
depends=(
  'qt6-base'          # Core, Gui, Widgets, DBus, Network
  'libarchive'        # §7.10 archives, resolved at runtime
  'shared-mime-info'  # §7.6 MIME detection
  'hicolor-icon-theme'
  'syntax-highlighting'   # §7.6 Quick Look source highlighting (KF6)
  'poppler-qt6'           # §7.6 PDF previews
  'qt6-multimedia'        # §7.6 audio and video previews
  'ffmpegthumbnailer'     # §7.7 video thumbnails
  'udisks2'               # §7.11 removable media
)
makedepends=('git' 'cmake' 'ninja' 'gcc')
checkdepends=('xorg-server-xvfb')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/andyjeffries/panefile.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "$srcdir/$_pkgname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
  cmake --build build
}

check() {
  # The GUI tests need a platform plugin; offscreen is what CI uses and needs
  # no display server.
  QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
