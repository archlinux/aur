#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgbase=libexosip2-3xx
pkgname=('libexosip2-3xx' 'libexosip2-3xx-doc' 'libexosip2-3xx-tools')
_pkgname=libeXosip2
pkgver=3.3.0
pkgrel=1
pkgdesc='A library that hides the complexity of using SIP for multimedia session establishement (version 3.x, last working with GNU Sipwitch)'
arch=('x86_64' 'i686')
url="https://savannah.nongnu.org/projects/exosip/"
license=('GPL')
depends=(libosip2-3xx openssl-1.0)
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')
source=("https://download.savannah.gnu.org/releases/exosip/$_pkgname-$pkgver.tar.gz")
b2sums=('1a5ecaaf52ce7d4c390fa1a90551589e7d757036be08e7b8f99df3f82da139215a29eb8151761cdd464165372e917369535eccf347a176d46902b804a587df10')

prepare() {
  mv -v "$srcdir/$_pkgname-$pkgver" "$srcdir/$pkgname-$pkgver"
}

## Build

build_libexosip2-3xx() {
  cd "$srcdir/$pkgname-${pkgver}"
  COMPILERFLAGS="-Wno-error=format-security -I/usr/include/openssl-1.0"
  ENVFLAGS=(CFLAGS="$CFLAGS $COMPILERFLAGS"
      CXXFLAGS="$CXXFLAGS $COMPILERFLAGS"
      CPPFLAGS="$CPPFLAGS $COMPILERFLAGS")
  env "${ENVFLAGS[@]}" \
      LDFLAGS="-Wno-error=format-security -L/usr/lib/openssl-1.0 -lssl" \
    ./configure --prefix=/usr --with-openssl=/usr/lib/openssl-1.0 \
    --enable-static --enable-shared
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  env "${ENVFLAGS[@]}" make -C src
}

build_libexosip2-3xx-doc() {
  makedepends+=(doxygen graphviz)
  cd "$srcdir/${pkgname%%-doc}-${pkgver}"
  make doxygen
}

build_libexosip2-3xx-tools() {
  cd "$srcdir/${pkgname%%-tools}-${pkgver}"
  make -C tools
}

## Package

package_libexosip2-3xx() {
  build_libexosip2-3xx
  provides=("libexosip2=$pkgver")
  conflicts=("libexosip2")
  cd "$srcdir/$pkgname-${pkgver}"
  make DESTDIR="$pkgdir" -d install
  rm -rv "$pkgdir/usr/bin" || true
  rm -rv "$pkgdir/usr/share/doc" || true
}

package_libexosip2-3xx-doc() {
  build_libexosip2-3xx-doc
  pkgdesc="$pkgdesc (documentation)"
  cd "$srcdir/${pkgname%%-doc}-${pkgver}"
  msg2 "Installing documentation..."
  cd help/doxygen/doc
  find . -type f -and -not -ipath '*/man/*' \
    -exec install -Dm644 {} "$pkgdir/usr/share/doc/${pkgname%%-doc}/{}" \; -print
  find man -type f -and -name '*.gz' \
    -exec install -Dm644 {} "$pkgdir/usr/share/{}" \; -print
  (pacman -Qq texlive-core >/dev/null 2>&1 && command -v dvipdfmx >/dev/null 2>&1) && {
    msg2 "Installing PDF documentation…"
    cd latex
    make pdf
    find . -type f -and -name '*.dvi' \
      -exec /usr/bin/dvips {} \; \
      -exec /usr/bin/dvipdfmx {} \; -print
    find . -type f -and -\( \
        -name '*.pdf' -or -name '*.ps' \
      -\) \
      -exec install -Dm644 {} "$pkgdir/usr/share/doc/${pkgname%%-doc}/{}" \; -print
  } || {
    warning "texlive-core not installed, skipping PDF documentation!"
  }
}

package_libexosip2-3xx-tools() {
  build_libexosip2-3xx-tools
  pkgdesc="$pkgdesc (tools)"
  cd "$srcdir/${pkgname%%-tools}-${pkgver}/tools"
  msg2 "Installing tools..."
  find . -mindepth 1 -maxdepth 1 \
    -type f -executable -exec install -Dm755 {} "$pkgdir/usr/bin/{}" \; -print
}

# vim:set ts=2 sw=2 et:
