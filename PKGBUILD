# Contributor: Wilhelm Schuster <aur [aT] rot13 _dot_ io>
# Maintainer: tee < teeaur at duck dot com >
pkgname=wget2
pkgver=2.2.1
pkgrel=1
#pkgdesc="Updated version of the popular wget URL retrieval tool"
pkgdesc="GNU Wget2 is the successor of GNU Wget, a file and recursive website downloader(without docs)"
arch=('x86_64')
url="https://gitlab.com/gnuwget/wget2"
license=('GPL-3.0-or-later AND LGPL-3.0-or-later')
depends=('glibc' 'pcre2' 'libidn2' 'zstd' 'brotli' 'xz' 'zlib' 'gpgme' 'bzip2' 'libnghttp2' 'libpsl' 'gnutls' 'ca-certificates')
# libhsts is optional but not in any repository. I currently don't feel
# the motivation to package it myself since it requires regularly
# updating the preload list. Leave a comment if you'd like to see HSTS
# preload support so that I can gauge interest.
checkdepends=('libmicrohttpd')
makedepends=('python')
source=("https://ftp.gnu.org/gnu/wget/${pkgname}-${pkgver}.tar.gz"{,.sig})
b2sums=('dccd9db63a237055377fb78e36ba36f357f5ec47b999e74aeffc170e3918a9d16df9a775b8836139e0640682eefe1d96d8bf6c7278b556ae9182039fa5dd90c0'
        'SKIP')
validpgpkeys=("1CB27DBC98614B2D5841646D08302DB6A2670428")

build() {
  cd ${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-openssl=no \
    --with-ssl=gnutls \
    --without-libhsts \
    --without-libidn \
    --without-libpcre \
    --disable-doc

  make
}

check() {
  cd ${pkgname}-${pkgver}

  make check
}


package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="$pkgdir"/ install
  install -Dm644 docs/man/man1/wget2.1 -t "$pkgdir"/usr/share/man/man1/
  install -Dm644 docs/man/man3/*.3 -t "$pkgdir"/usr/share/man/man3/
  install -Dm644 docs/wget2.info -t "$pkgdir"/usr/share/info/
  install -Dm644 docs/wget2.md -t "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 COPYING COPYING.LESSER -t "$pkgdir"/usr/share/licenses/$pkgname/

  # AFAICT wget2_noinstall is meant run `make check` before installing
  # wget2 itself. Normally, wget2 links to libwget, which is located
  # in /usr/lib and thus can't be resolved before wget2 is actually
  # installed.
  rm -f "$pkgdir/usr/bin/wget2_noinstall"
}

# vim:set ts=2 sw=2 tw=0 et:
