# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

_pkgname=libao
pkgname=${_pkgname}-jack
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross-platform audio output library and plugins - patched with JACK support"
url="http://xiph.org/ao/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('alsa-lib')
makedepends=('libpulse' 'jack')
backup=('etc/libao.conf')
source=("http://downloads.xiph.org/releases/ao/${_pkgname}-${pkgver}.tar.gz"
        "https://trac.xiph.org/raw-attachment/ticket/2083/libao-jack-plugin.tgz"
        "https://trac.xiph.org/raw-attachment/ticket/2083/0001-jack-plugin.patch"
        'libao.conf')
noextract=('libao-jack-plugin.tgz')
sha1sums=('6b1d2c6a2e388e3bb6ebea158d51afef18aacc56'
          '9e8436d5aa3c81496a8f315d75c4fba8ea24b3b6'
          '53af33fcf7a7981656ad5519cad38a0575c58afe'
          '603f5e6715e7e50e1c8e8c1935c45a897c46e9af')

conflicts=('libao' 'libao-pulse')
provides=("libao=${pkgver}-${pkgrel}" "libao-pulse=${pkgver}-${pkgrel}")

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

    bsdtar -xf "${srcdir}/libao-jack-plugin.tgz"
    patch -p1 -i "${srcdir}/0001-jack-plugin.patch"
    autoreconf -if
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--enable-alsa-mmap \

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -Dm644 "${srcdir}/libao.conf" "${pkgdir}/etc/libao.conf"
}
