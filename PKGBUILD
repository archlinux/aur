# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Patrick Bartels <pckbls@gmail.com>

pkgname=sndio
pkgver=1.4.0
pkgrel=5
epoch=1
pkgdesc='Small audio and MIDI framework part of the OpenBSD project'
arch=('i686' 'x86_64')
url='http://www.sndio.org/'
license=('ISC')
depends=('alsa-lib')
install="$pkgname.install"
backup=('etc/default/sndiod')
source=("http://www.sndio.org/${pkgname}-${pkgver}.tar.gz"
        'sndiod.tmpfiles')
sha256sums=('68713db624797dbff69c0f4ce1b24054fb0803da340508edbc5e08d6778f9781'
            'c28700653292cee52feb0e5c3e15866902cb965f752056b8b6b10cdf7eecbc29')

build() {
    cd "${pkgname}-${pkgver}"
    
    ./configure \
        --prefix='/usr' \
        --enable-alsa
        
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    # systemd service
    install -D -m644 contrib/default.sndiod "${pkgdir}/etc/default/sndiod"
    install -D -m644 contrib/sndiod.service "${pkgdir}/usr/lib/systemd/system/sndiod.service"
    
    # create ephemeral dirs via tmpfiles
    install -D -m644 "${srcdir}/sndiod.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sndiod.conf"
    
    # create a LICENSE file
    sed -n '3,15p' libsndio/sndio.h > LICENSE  # create file
    sed -i '1,13s/^.\{,3\}//'         LICENSE  # erase C comments
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
