  # Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=('n64-git' 'n64-tools-git')
pkgver=r110.23a6b60
pkgrel=1
arch=('x86_64' 'i686' 'mips64')
url="https://github.com/glankk/n64"
source=("git+https://github.com/glankk/n64.git#branch=n64-ultra"
        "gs.patch")
makedepends=('git')
sha256sums=('SKIP'
            'b36d4a851c5dd76ba3d56e4ab2370e5a8ac28dc0e8feef11fb6f32141abdc117')
options=('!buildflags' '!strip')
_prefix=/usr

pkgver() {
  cd ${srcdir}/n64/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # The gs binary conflicts with GhostScript on Linux. Rename it to gs.n64.
  patch --strip=1 --input=${srcdir}/gs.patch
  #pwd
}

build() {
  # cd to source directory.
  cd $srcdir/n64

  ./configure --prefix=$_prefix

  # Install the tools.
  make -j 4
}

package_n64-tools-git() {
  pkgdesc="A set of N64 development tools."
  depends=('jansson' 'lua' 'libusb')
  provides=('n64-tools')
  conflicts=('n64-tools')
  replaces=('n64-tools)')
  cd $srcdir/n64
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-local-exec
}

package_n64-git() {

  pkgdesc="A custom N64 development library"
  # Because the lib installs symlinks to the tools, the lib must depend on the
  # tools package.
  provides=('n64')
  conflicts=('n64')
  replaces=('n64)')
  depends+=('n64-tools')

  # Install the binaries that the makefile generates.
  cd $srcdir/n64
  make DESTDIR="$pkgdir" install-sys
}
