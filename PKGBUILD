# Maintainer: Lennart Martens  <monkeynator78@gmail.com>

pkgname=servicemaster-git
_pkgname=servicemaster
pkgver=1.7.8.r172.726aff3
pkgrel=1
pkgdesc="Linux Systemd administration tool with nice TUI written in C."
arch=('x86_64')
url="https://github.com/lennart1978/servicemaster"
license=('MIT')
depends=('ncurses' 'systemd-libs')
makedepends=('meson' 'ninja' 'gcc' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lennart1978/servicemaster.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "1.7.8.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson build $_pkgname
  meson compile -C build
}

package() {
  # Define path to any old manual installation
  old_path="/usr/local/bin/servicemaster"
  
  # Check if an old manual installation exists and remove it
  if [ -f "$old_path" ]; then
    echo "⚠️  Old manual installation found at $old_path. Removing it..."
    if rm -f "$old_path"; then
      echo "✅ Successfully removed old version."
    else
      echo "❌ Failed to remove $old_path!" >&2
      exit 1
    fi
  fi

  # Standard Meson installation to package directory
  meson install -C build --destdir "${pkgdir}"
}

