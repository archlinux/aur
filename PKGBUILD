# vim: set ts=2 sw=2 et:
# Maintainer: jghodd@gmail.com

pkgname=alpm12
pkgver=1.0.1
pkgrel=2
pkgdesc="Arch Linux Package Manager Library v12"
arch=('x86_64')
url="https://github.com/jghodd/alpm12"
license=('GPL')
depends=('bash' 'glibc' 'libarchive' 'curl' 'gpgme' 'archlinux-keyring')
makedepends=('asciidoc')
checkdepends=('python' 'fakechroot')
optdepends=('perl-locale-gettext: translation support in makepkg-template')
provides=('libalpm.so.12.0.2')
conflicts=('libalpm12')
options=('strip')
validpgpkeys=('6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'  # Allan McRae <allan@archlinux.org>
              'B8151B117037781095514CA7BBDFFC92306B1121') # Andrew Gregory (pacman) <andrew@archlinux.org>
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jghodd/alpm12/archive/${pkgver}.tar.gz"
        alpm12.h
        alpm12_list.h)
sha256sums=('1c8699d2e2bb6d9d1c9de1b010e7bd11c8a30ad133bab621fef162dbc97b3282'
            '636dbf71261aee295dd1d346dfbdc3f6e6bad13bcde5c329e39840529053dfcd'
            'a672ae5106caa912fe25969a1cfedf18597a85b994c8a211ca9c9071270e3ea0')

build() {
  cd "$pkgname-$pkgver"

  chmod 755 ./configure

  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var \
    --with-scriptlet-shell=/usr/bin/bash \
    --with-ldconfig=/usr/bin/ldconfig
  make V=1
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/lib/libalpm.a"
  rm "$pkgdir/usr/lib/libalpm.la"
  rm "$pkgdir/usr/lib/libalpm.so"
  rm "$pkgdir/usr/lib/libalpm.so.12"

  mkdir "$pkgdir/usr/include"

  cp "$srcdir/alpm12.h" "$pkgdir/usr/include/alpm12.h"
  cp "$srcdir/alpm12_list.h" "$pkgdir/usr/include/alpm12_list.h"

  mv "$pkgdir/usr/lib/libalpm.so.12.0.2" "$pkgdir/usr/lib/libalpm12.so.12.0.2"

  cd "$pkgdir/usr/lib"
  ln -sf "libalpm12.so.12.0.2" "libalpm12.so.12"
  ln -sf "libalpm12.so.12" "libalpm12.so"
}
