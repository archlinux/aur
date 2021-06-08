# vim: set ts=2 sw=2 et:
# Maintainer: 

pkgname=libalpm12
pkgver=12.0.2
pkgrel=1
pkgdesc="Standalone libalpm library"
arch=('x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL')
depends=('bash' 'glibc' 'libarchive' 'curl' 'gpgme')
checkdepends=('python' 'fakechroot')
provides=('libalpm.so=12')
conflicts=('pacman<6.0')
options=('strip' 'debug')
validpgpkeys=('6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'  # Allan McRae <allan@archlinux.org>
              'B8151B117037781095514CA7BBDFFC92306B1121') # Andrew Gregory (pacman) <andrew@archlinux.org>
source=(https://sources.archlinux.org/other/pacman/pacman-5.2.2.tar.gz{,.sig}
        pacman-5.2.2-fix-strip-messing-up-file-attributes.patch::'https://git.archlinux.org/pacman.git/patch/?id=88d054093c1c99a697d95b26bd9aad5bc4d8e170'
        pacman-5.2.2-fix-debug-packages-with-gcc11.patch::'https://git.archlinux.org/pacman.git/patch/?id=bdf6aa3fb757a2363a4e708174b7d23a4997763d')
sha256sums=('bb201a9f2fb53c28d011f661d50028efce6eef2c1d2a36728bdd0130189349a0'
            'SKIP'
            '871fd97b3f13f1718358e4b8e046a56c0262c9042b5e3b5d60835606735798bd'
            '6be31dd7f4e1645e58c26fafaf1d9df4ba5e31b629fc3e8f4070d771571d0011')

prepare() {
  cd pacman-5.2.2
  patch -Np1 < "$srcdir"/pacman-5.2.2-fix-strip-messing-up-file-attributes.patch
  patch -Np1 < "$srcdir"/pacman-5.2.2-fix-debug-packages-with-gcc11.patch
}

build() {
  cd pacman-5.2.2

  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --disable-doc \
    --with-scriptlet-shell=/usr/bin/bash \
    --with-ldconfig=/usr/bin/ldconfig
  make V=1
}

check() {
  make -C pacman-5.2.2 check
}

package() {
  cd pacman-5.2.2

  make DESTDIR="$pkgdir" install

  rm -fr "$pkgdir"/{etc,var}
  rm -fr "$pkgdir"/usr/{bin,include,share}
  mv "$pkgdir"/usr/lib/libalpm.so           "$pkgdir"/usr/lib/libalpm12.so
  mv "$pkgdir"/usr/lib/pkgconfig/libalpm.pc "$pkgdir"/usr/lib/pkgconfig/libalpm12.pc
}
