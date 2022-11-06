# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=gmnisrv
pkgver=1.0
pkgrel=2
pkgdesc="simple Gemini protocol server"
url="https://git.sr.ht/~sircmpwn/gmnisrv"
arch=(x86_64)
license=("GPL3")
depends=("openssl-1.1" "mailcap")
makedepends=("scdoc")
source=(${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz
	${pkgname}.service)
b2sums=('977e93d8826f5aab5fe00f1fa6fb39ca317caf8439116b5dd8f2ab7b811d6a4f650e94e25d7b24a7f22c33956effbe904fcb5bd3bdcd59ddec6caaff60ac6cd4'
        '7a33cf875f7012d8dedd3f9fc41ef9bc5022c85cfc7dd79b254f8fc25eef164335802d67acc426124ab61922de8882945941951dae4eb7be4a57fe4efb08f3dd')


build() {
    cd "${pkgname}-${pkgver}"

    # It needs openssl-1.1, but build process doesn't seem to allow this easily
    export PKG_CONFIG_PATH=/usr/lib/openssl-1.1/pkgconfig

    mkdir build
    cd build
    ../configure --prefix=/usr
    make PREFIX="/usr"
}

package() {
    cd "${pkgname}-${pkgver}/build"

    make PREFIX="/usr" DESTDIR="$pkgdir" install

    # Move conf file into etc
    mkdir "${pkgdir}/etc"
    mv "${pkgdir}/usr/share/gmnisrv/gmnisrv.ini" "${pkgdir}/etc"
    rmdir "${pkgdir}/usr/share/gmnisrv"

    # Copy systemd service
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    cp "${srcdir}/gmnisrv.service" "${pkgdir}/usr/lib/systemd/system"
}
