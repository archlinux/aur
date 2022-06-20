# Maintainer: Noah Vogt (noahvogt) noah@noahvogt.com
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=wget-xdg
pkgver=1.21.3
pkgrel=1
pkgdesc='Network utility to retrieve files from the Web - but moving ~/.wget-hsts to $XDG_CACHE_HOME/wget/hsts'
url='https://www.gnu.org/software/wget/wget.html'
arch=('x86_64')
license=('GPL3')
depends=('glibc' 'zlib' 'gnutls' 'libidn2' 'libidn2.so' 'util-linux-libs' 'libuuid.so'
         'libpsl' 'libpsl.so' 'pcre2' 'nettle' 'libnettle.so')
optdepends=('ca-certificates: HTTPS downloads')
backup=('etc/wgetrc')
source=(https://ftp.gnu.org/gnu/${pkgname%-*}/${pkgname%-*}-${pkgver}.tar.lz
        xdg-compliant-wget-hsts-file.patch)
sha256sums=('dbd2fb5e47149d4752d0eaa0dac68cc49cf20d46df4f8e326ffc8f18b2af4ea5'
            'e7f03d1f253e4b66c38271f4a47ae8d849ac6241c60728b56be1a10b94611293')
b2sums=(
'e57cb9ea883fb9ed07065b6912238bcc10f4dfd4bd961a363c98ca9321086b75a49f9c7eb03e7704712cb03e43d40f1b74a4d9f5ac2ed142e41f0422a13de275'
'0da265b080a193805605bb8705e69e43a07aef062205ae9cf3558ac5e1199b67275f406337153018af4ec1631ef066cdd6eebbd5ba8029b3855e8c71c5953b2e')
provides=('wget')
conflicts=('wget')

prepare() {
  cd ${pkgname%-*}-${pkgver}
  patch -p1 -i ../xdg-compliant-wget-hsts-file.patch
  cat >> doc/sample.wgetrc <<EOF
# default root certs location
ca_certificate=/etc/ssl/certs/ca-certificates.crt
EOF
}

build() {
  cd ${pkgname%-*}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-rpath \
    --enable-nls \
    --with-ssl=gnutls
  make
}

package() {
  cd ${pkgname%-*}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
