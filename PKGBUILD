# Maintainer: Crumble <crumble@crumble.sh>
# Based on openconnect package with fortinet split-dns fix

pkgname=openconnect-fortisplitdns
_pkgname=openconnect
pkgver=9.12
pkgrel=1
epoch=1
pkgdesc="OpenConnect VPN client with Fortinet split-DNS resolution fix"
url="https://www.infradead.org/openconnect/"
arch=('x86_64')
license=('LGPL2.1')
depends=('libxml2' 'gnutls' 'libproxy' 'vpnc' 'krb5' 'lz4' 'pcsclite'
         'stoken' 'tpm2-tss' 'oath-toolkit' 'libproxy' 'libp11-kit'
         'xdg-utils'
         libstoken.so libtss2-esys.so libtss2-mu.so libtss2-tctildr.so
         libxml2.so libproxy.so libhogweed.so libp11-kit.so libpskc.so
         libgssapi_krb5.so libpcsclite.so)
makedepends=('intltool' 'python')
checkdepends=('python-flask')
optdepends=('python: tncc-wrapper')
provides=("openconnect=${pkgver}" 'libopenconnect.so')
conflicts=('openconnect')
replaces=('openconnect')
options=('!emptydirs')
source=(https://www.infradead.org/openconnect/download/openconnect-${pkgver}.tar.gz{,.asc}
        "fortinet-split-dns.patch")
sha256sums=('a2bedce3aa4dfe75e36e407e48e8e8bc91d46def5335ac9564fbf91bd4b2413e'
            'SKIP'
            '8c2fd8e1ab6fa9d6d6934d6425715e6e226ad970e135f5b6633c43b8ed0d0de0')
validpgpkeys=('BE07D9FD54809AB2C4B0FF5F63762CDA67E2F359') # David Woodhouse <dwmw2@infradead.org>

prepare() {
  cd "${_pkgname}-${pkgver}"
  
  # Apply Fortinet split-DNS fix
  patch -Np1 -i "${srcdir}/fortinet-split-dns.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  
  PYTHON=/usr/bin/python \
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "${_pkgname}-${pkgver}"
  
  make DESTDIR="${pkgdir}" install
}
