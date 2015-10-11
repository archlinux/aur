# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

_pkgname=libao
pkgname=lib32-${_pkgname}-jack
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross-platform audio output library and plugins (32-bit) - patched with JACK support"
url="http://xiph.org/ao/"
arch=('x86_64')
license=('GPL')
depends=("${_pkgname}-jack" 'lib32-alsa-lib')
makedepends=('gcc-multilib' 'lib32-libpulse' 'lib32-jack')
options=('!libtool')
source=("http://downloads.xiph.org/releases/ao/${_pkgname}-${pkgver}.tar.gz"
        "https://trac.xiph.org/raw-attachment/ticket/2083/libao-jack-plugin.tgz"
        "https://trac.xiph.org/raw-attachment/ticket/2083/0001-jack-plugin.patch")
noextract=('libao-jack-plugin.tgz')
sha1sums=('6b1d2c6a2e388e3bb6ebea158d51afef18aacc56'
          '9e8436d5aa3c81496a8f315d75c4fba8ea24b3b6'
          '53af33fcf7a7981656ad5519cad38a0575c58afe')

conflicts=('lib32-libao')
provides=("lib32-libao=${pkgver}-${pkgrel}")

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

    bsdtar -xf "${srcdir}/libao-jack-plugin.tgz"
    patch -p1 -i "${srcdir}/0001-jack-plugin.patch"
    autoreconf -if
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	./configure \
		--prefix=/usr \
		--libdir=/usr/lib32 \
		--enable-alsa-mmap \

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/"{include,share}
}
