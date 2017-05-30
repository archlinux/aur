# Maintainer: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Jan Kašpar < jan.kaspar at gmail dot com >
pkgname=xrootd
pkgver=4.6.0
pkgrel=3
pkgdesc="Software framework for fast, low latency, scalable and fault tolerant data access."
provides=('xrootd' 'xrootd-abi0')
arch=('i686' 'x86_64')
url="http://xrootd.org/"
license=('LGPL3')
depends=('ceph' 'libxml2' 'openssl-1.0')
makedepends=('cmake')
options=('!emptydirs')
source=("http://xrootd.org/download/v${pkgver}/xrootd-${pkgver}.tar.gz"
        'gcc7.patch')
sha256sums=('b50f7c64ed2a4aead987de3fdf6fce7ee082407ba9297b6851cd917db72edd1d'
            '20f4d966f302e44e4729df6454f4e12570522632a25726e38523f7fbb4b01941')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/gcc7.patch"
    cd "${srcdir}"
    rm -rf "build"
    mkdir "build"
    cd "build"

    msg2 'Configuring...'
    cmake "${srcdir}/${pkgname}-${pkgver}" \
          -DCMAKE_BUILD_TYPE:STRING=Release \
          -DOPENSSL_ROOT_DIR=/usr/lib/openssl-1.0 \
          -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
          -DCMAKE_INSTALL_LIBDIR:PATH=lib \
          -DCMAKE_INSTALL_PREFIX:PATH=/usr

    msg2 'Compiling...'
    make ${MAKEFLAGS}
}

package() {
    cd "${srcdir}/build"
    msg2 'Installing...'
    make DESTDIR="${pkgdir}" install
}
