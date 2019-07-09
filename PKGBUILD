  # Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=('n64-git' 'n64-tools-git')
pkgver=20190523
pkgrel=1
arch=('x86_64' 'i686' 'mips64')
url="https://github.com/glankk/n64"
source=("git+https://github.com/glankk/n64.git#branch=n64-ultra"
        "gs.patch")
makedepends=('git')
sha256sums=('SKIP'
            'dad3aa103bfa59ed276ff487459c28166d9ca89fdb910c4d4a5ffcae4d1fa78c')
options=('!buildflags' '!strip')
_prefix=/usr

pkgver() {
  # Identify latest version.
  cd "$srcdir/n64"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  # The gs binary conflicts with GhostScript on Linux. Rename it to gs.n64.
  patch --strip=1 --input=${srcdir}/gs.patch

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
