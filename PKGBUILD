# Maintainer: Your Name <claudemods101@gmail.com>
pkgname=claudemods-alpm
pkgver=7.0.0.1
pkgrel=1
pkgdesc="Custom Arch Linux Package Manager supporting https://aur.archlinux.org/"
arch=('x86_64')
url="https://github.com/claudemods/claudemods-alpm"
license=('GPL3')  # Adjust if the actual license differs
depends=()  # No runtime dependencies
makedepends=('git' 'meson' 'ninja')  # Build-time dependencies
install=claudemods-alpm.install  # Reference the install script
source=("git+https://github.com/claudemods/claudemods-alpm.git")
md5sums=('SKIP')  # Replace with actual checksums for production

build() {
  cd "$srcdir/claudemods-alpm"
  mkdir -p build
  cd build
  meson setup --prefix=/usr ..
  ninja
}

package() {
  cd "$srcdir/claudemods-alpm/build"

  # Remove the existing /usr/bin/pacman binary if it exists
  if [ -f "$pkgdir/usr/bin/pacman" ]; then
    rm -f "$pkgdir/usr/bin/pacman"
  fi

  # Install the custom pacman binary
  install -Dm755 "pacman" "$pkgdir/usr/bin/pacman"

  # Optionally, remove the cloned directory after packaging
  rm -rf "$srcdir/claudemods-alpm"
}
