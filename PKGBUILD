# Maintainer: vieled-seraph <IITAspirant@proton.me>
# Common variables
_giturl="https://github.com/varnish/tinykvm.git"

# Package details
pkgname=simplekvm-git
pkgver=r415.71e6ecc
pkgrel=1
pkgdesc="Simple KVM emulator from tinykvm"
arch=('x86_64')
url="https://github.com/varnish/tinykvm"
license=('GPL3')
depends=()
makedepends=('cmake' 'make' 'git')
provides=('tinykvm')
conflicts=('tinykvm')
options=('!debug') # Disable debug symbol splitting
source=("$pkgname::git+$_giturl")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  
  # Create a dedicated build directory
  mkdir -p build
  cd build
  
  # Configure the build with CMake, explicitly setting the build type to Release
  cmake .. -DCMAKE_BUILD_TYPE=Release
  
  # Build the project
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  
  # Install the main binary (non-debug version) to the appropriate location
  install -Dm755 simplekvm "$pkgdir/usr/bin/simplekvm"
  
  # Strip debug symbols (optional, as makepkg does this by default)
  strip "$pkgdir/usr/bin/simplekvm"
}
