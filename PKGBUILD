# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=cfait
pkgver=1.1.0
pkgrel=1
pkgdesc="Powerful, fast and elegant task / TODO manager. (GUI & TUI, CalDAV & local)"
arch=('x86_64')
url="https://git.disroot.org/trougnouf/cfait"
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'fontconfig'        # Required by the GUI for system font discovery
    'libxkbcommon'      # Required by the GUI for keyboard handling (especially on Wayland)
    'vulkan-icd-loader' # Required by the GUI to load Vulkan drivers for rendering
    'org.freedesktop.secrets'  # Required to store the CalDAV password
)
makedepends=('cargo' 'pkgconf' 'git')  # git is needed as long as libdav > 0.10.3 is not released
# Optional dependencies for the GUI and specific features
optdepends=(
    'vulkan-driver: Required by the GUI for hardware-accelerated rendering'
    'wayland: Required by the GUI for Wayland session support'
    'libx11: Required by the GUI for X11 session support'
    'libxcursor: Required by the GUI for X11 cursor support'
    'libxi: Required by the GUI for X11 input devices'
    'libxrandr: Required by the GUI for X11 monitor layout support'
    'xdg-desktop-portal: Required by the GUI for the file picker (export/import)'
)

options=('!lto' '!strip' '!debug')
source=("cfait-source-v1.1.0.tar.gz::https://git.disroot.org/trougnouf/cfait/releases/download/v1.1.0/cfait-source-v1.1.0.tar.gz")
sha256sums=('d0f9867f991be3b7e73a858856930a284972e8acf5c67ee78fbd8d7a10d36db9')
replaces=('rustycal' 'rustache' 'fairouille')
provides=('cfait-tui' 'cfait-gui')

build() {
  cd "$pkgname-$pkgver"
  # Set the target directory to be at the root of the makepkg build area
  export CARGO_TARGET_DIR="$srcdir/target"
  # Skip compiling the problematic fallback RNG.
  # Linux's native getrandom() is used instead.
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1

  # Build both TUI and GUI
  cargo build --release --features gui
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$srcdir/target/release/cfait" "$pkgdir/usr/bin/cfait"
  install -Dm755 "$srcdir/target/release/cfait-gui" "$pkgdir/usr/bin/cfait-gui"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "assets/cfait.desktop" "$pkgdir/usr/share/applications/cfait.desktop"
  install -Dm644 "assets/cfait.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/cfait.svg"
}
