# Maintainer: jeryd leuck <jerydleuck@gmail.com>
pkgname=bleachbit-tui-git
pkgver=6.0.0.r17.9bb4a493
pkgrel=4
pkgdesc="Free space and maintain privacy (Experimental TUI branch)"
arch=('any')
url="https://github.com/bleachbit/bleachbit"
license=('GPL-3.0-or-later')
depends=('python' 'python-requests' 'python-chardet' 'python-textual' 'python-psutil')
optdepends=('gtk3: for GTK+ UI' 'python-gobject: for GTK+ UI')
makedepends=('git' 'make')
provides=('bleachbit')
conflicts=('bleachbit' 'bleachbit-git')
source=("bleachbit::git+https://github.com/bleachbit/bleachbit.git#branch=tui"
        "bleachbit-tui.desktop"
        "bleachbit-tui-launcher.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd bleachbit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd bleachbit
  make build
}

package() {
  cd bleachbit
  make DESTDIR="$pkgdir" prefix=/usr install
  
  # Remove the upstream GUI desktop file so we don't have duplicate launchers
  rm -f "$pkgdir/usr/share/applications/org.bleachbit.BleachBit.desktop"

  # The upstream Makefile on the 'tui' branch currently misses the TUI module files.
  # We manually install them here until it's fixed upstream.
  mkdir -p "$pkgdir/usr/share/bleachbit/bleachbit/tui/screens"
  install -Dm644 bleachbit/tui/*.py "$pkgdir/usr/share/bleachbit/bleachbit/tui/"
  install -Dm644 bleachbit/tui/screens/*.py "$pkgdir/usr/share/bleachbit/bleachbit/tui/screens/"
  
  # Install the TUI entrypoint
  install -Dm755 bleachbit_tui.py "$pkgdir/usr/bin/bleachbit-tui"

  # Fix Python path for the TUI entrypoint so it can find the bleachbit modules
  sed -i '/import sys/a sys.path.append("/usr/share/")' "$pkgdir/usr/bin/bleachbit-tui"

  # Install the universal terminal wrapper
  install -Dm755 "$srcdir/bleachbit-tui-launcher.sh" "$pkgdir/usr/bin/bleachbit-tui-launcher"

  # Install the custom TUI desktop shortcut
  install -Dm644 "$srcdir/bleachbit-tui.desktop" "$pkgdir/usr/share/applications/bleachbit-tui.desktop"
}
