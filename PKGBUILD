# Maintainer: Noah Vogt (noahvogt) noah@noahvogt.com
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=wget-xdg
pkgver=1.21.4
pkgrel=1
pkgdesc='Network utility to retrieve files from the Web - but moving ~/.wget-hsts to $XDG_CACHE_HOME/wget/hsts'
url='https://www.gnu.org/software/wget/wget.html'
arch=('x86_64')
license=('GPL3')
depends=('glibc' 'zlib' 'gnutls' 'libidn2' 'libidn2.so' 'util-linux-libs' 'libuuid.so'
         'libpsl' 'libpsl.so' 'pcre2' 'nettle' 'libnettle.so')
optdepends=('ca-certificates: HTTPS downloads')
backup=('etc/wgetrc')
source=(https://ftp.gnu.org/gnu/${pkgname%-*}/${pkgname%-*}-${pkgver}.tar.lz{,.sig}
        xdg-compliant-wget-hsts-file.patch)
sha256sums=('3683619a5f50edcbccb1720a79006fa37bf9b9a255a8c5b48048bc3c7a874bd9'
            'SKIP'
            'e7f03d1f253e4b66c38271f4a47ae8d849ac6241c60728b56be1a10b94611293')
b2sums=(
'ce4901b620b6523ad25594d810d2cf216b30d0256bb7dfd1c92c7c44739f3ff18ee74333a3629735af72dffa473f75a22eb39005eb25d5e077ce0ee69a47a241'
'SKIP'
'0da265b080a193805605bb8705e69e43a07aef062205ae9cf3558ac5e1199b67275f406337153018af4ec1631ef066cdd6eebbd5ba8029b3855e8c71c5953b2e')
validpgpkeys=(
  'AC404C1C0BF735C63FF4D562263D6DF2E163E1EA' # Giuseppe Scrivano <gscrivano@gnu.org>
  '7845120B07CBD8D6ECE5FF2B2A1743EDA91A35B6' # Darshit Shah <darnir@gnu.org>
  '1CB27DBC98614B2D5841646D08302DB6A2670428' # Tim Rühsen <tim.ruehsen@gmx.de>
)
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
