_pkgname=libevent
pkgname=libevent-compat
pkgver=2.0.22
pkgrel=3
pkgdesc="An event notification library"
arch=('i686' 'x86_64')
url="http://libevent.org/"
license=('BSD')
depends=('openssl')
optdepends=('python2: to use event_rpcgen.py')
source=(https://github.com/libevent/libevent/releases/download/release-$pkgver-stable/$_pkgname-$pkgver-stable.tar.gz
        openssl_1.1.patch
        0001-evdns-fix-searching-empty-hostnames.patch
        0002-test-dns-regression-for-empty-hostname.patch
        0003-evdns-name_parse-fix-remote-stack-overread.patch
        0004-evutil_parse_sockaddr_port-fix-buffer-overflow.patch
        libevent-2.0.22-stable.patch)
sha256sums=('71c2c49f0adadacfdbe6332a372c38cf9c8b7895bb73dabeaa53cdcc1d4e1fa3'
            '1c0e3a47e5739ce6f05cfdaeaf1bb33eb7c6c89003538f680586e50cbd2abb48'
            '66ca7cd16a2260537e1f7d7d22ace9c50bcc54f5f47af41361f1771de6b37526'
            'b76aaa4730fe377f49077a428645e6e5335a5fe5600fece1e0dd4503749e25d5'
            'e2bbd44121f4f5c70ba891e4dc9f150254babae0c647bb47792571a6e88c0614'
            'c02932ec76925d9c470a7b955add045f59dbef3dcc85b46020bda61151b22533'
            '20770f7f492d95f2ae55646a3d67d3cd80ff28f1cb4ed34a643304f9192c67d0')

prepare() {
  cd ${_pkgname}-${pkgver}-stable
  patch -Np1 -i ../0001-evdns-fix-searching-empty-hostnames.patch
  patch -Np1 -i ../0002-test-dns-regression-for-empty-hostname.patch
  patch -Np1 -i ../0003-evdns-name_parse-fix-remote-stack-overread.patch
  patch -Np1 -i ../0004-evutil_parse_sockaddr_port-fix-buffer-overflow.patch
  patch -Np1 -i ../openssl_1.1.patch
  patch -Np1 -i ../libevent-2.0.22-stable.patch
}

build() {
  cd ${_pkgname}-${pkgver}-stable
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-libevent-regress
  make
}

check() {
  cd ${_pkgname}-${pkgver}-stable
  make -j1 check
}

package() {
  cd ${_pkgname}-${pkgver}-stable
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  rm -rf -- "${pkgdir}/usr/include"
  rm -rf -- "${pkgdir}/usr/bin"
  rm -rf -- "${pkgdir}/usr/lib/"*.so
  rm -rf -- "${pkgdir}/usr/lib/pkgconfig"
}
