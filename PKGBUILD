# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Daniel Wallace <danielwallace@aur.archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=lib32-curl-git
_pkgname=curl
pkgver=7.72.0
pkgrel=1
pkgdesc="An URL retrieval utility and library (32-bit)"
arch=('x86_64')
url="https://curl.haxx.se"
license=('MIT')
provides=(lib32-curl)
conflicts=(lib32-curl)
depends=('lib32-libidn2' 'lib32-libssh2' 'lib32-krb5' 'lib32-openssl'
         'lib32-libpsl' 'lib32-zlib' 'lib32-zstd' "${_pkgname}" "lib32-brotli")
source=("git+https://github.com/curl/curl")
sha512sums=('SKIP')

pkgver() {
  cd curl
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd curl

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./buildconf
  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-dependency-tracking \
      --disable-ldap \
      --disable-ldaps \
      --enable-ipv6 \
      --enable-manual \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --with-gssapi \
      --with-libssh2 \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
      --libdir=/usr/lib32

  make
}

package() {
  cd curl

  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/usr/{share,bin,include}

  # license
  install -d "$pkgdir/usr/share/licenses"
  ln -s "$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
