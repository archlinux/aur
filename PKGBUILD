# Orphaned Package

pkgname=bristol
pkgver=0.60.11
pkgrel=3
pkgdesc="Vintage synthesizers emulator"
arch=(i686 x86_64)
url="http://bristol.sourceforge.net"
license=('GPL')
makedepends=('gcc')
depends=('jack' 'libx11')
options=(!libtool)
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz https://sources.debian.org/data/main/b/bristol/0.60.11-3.1/debian/patches/04-gcc_10.patch)
sha256sums=('7d1f0bbd0d7d303fc77c6b9549b61708d7a83b4dc007818011b1f55d1fa922ba'
            '4080f34444e301fcd94b454813dc646f39fb2e5787f3fe74cdc9c36520458c81')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i '/#include <alsa\/iatomic.h>/ s/^/\/\//' libbristolaudio/audioEngineJack.c # disable alsa/iatomic
    patch --forward --strip=1 --input="${srcdir}/04-gcc_10.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --disable-version-check --enable-jack-default-audio # --enable-jack-default-midi
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -v -m 0644 ChangeLog ${pkgdir}/usr/share/bristol/
    install -v -m 0644 README ${pkgdir}/usr/share/bristol/
}
