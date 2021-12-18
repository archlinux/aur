# Maintainer: Noah Vogt (noahvogt) noah@noahvogt.com
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=wget-xdg
pkgver=1.21.2
pkgrel=3
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
sha256sums=('1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3'
            'e7f03d1f253e4b66c38271f4a47ae8d849ac6241c60728b56be1a10b94611293')
b2sums=(
'9141b27f2db587bbd34cb97ecf4a6179e564817067b45c8168390cf1548c1a18f71723247d82b11f2edf3981a9b9f0d2097afe5d56397e033b0a86adae9482b1'
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
