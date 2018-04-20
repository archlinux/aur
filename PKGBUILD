# Maintainer: Jan Baudisch <dev@baudisch.xyz>
pkgname=z88dk-git
pkgver=de7d7119a
pkgrel=1
pkgdesc="The development kit for over fifty z80 machines - c compiler, assembler, linker, libraries."
arch=("x86_64")
url="https://www.z88dk.org"
license=("custom: The Clarified Artistic License")
depends=("perl")
provides=("z88dk")
conflicts=("z88dk")
source=("$pkgname::git+https://github.com/z88dk/z88dk.git"
        "z88dk.sh"
        "unixem::git+https://github.com/z88dk/UNIXem.git"
        "optparse::git+https://github.com/skeeto/optparse.git"
        "uthash::git+https://github.com/z88dk/uthash.git")
sha256sums=("SKIP"
            "d9e302908dd3355440901254c48ffa43af273ec710ce442db77406c378f1942d"
            "SKIP"
            "SKIP"
            "SKIP")

pkgver() {
  cd "$pkgname"
  git rev-parse --short HEAD
}

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.UNIXem.url $srcdir/unixem
  git config submodule.optparse.url $srcdir/optparse
  git config submodule.uthash.url $srcdir/uthash
  git submodule update
}

build() {
  cd "$pkgname"
  chmod +x build.sh
  ./build.sh
}

package() {
  # would not create paths otherwise
  export INSTALL="install -D"

  cd "$pkgname"

  make prefix="/usr" DESTDIR="$pkgdir" install

  install -Ddm755 "$pkgdir/etc/profile.d"
  install -m644 "$srcdir/z88dk.sh" "$pkgdir/etc/profile.d/z88dk.sh"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/z88dk/LICENSE"
}
