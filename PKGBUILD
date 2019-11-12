# Original: zer0def <zer0def on freenode>
# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=signald
pkgver=0.8.1
pkgrel=1
pkgdesc='An unofficial daemon that facilitates communication with the Signal messaging app.'
url='https://git.callpipe.com/finn/signald'
license=('GPL3')
arch=('any')
makedepends=('gradle')
depends=('java-runtime>=11')
optdepends=('openbsd-netcat: interaction with signald socket'
            'qrencode: display account linking token as QR code')
conflicts=('signald-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thefinn93/signald/archive/${pkgver}.tar.gz"
        'gradle-no-daemon.patch'
        'signald.install')
sha512sums=('610ab37498c698ef78a54195899ef39165974f1c46deecda41cb802753201b2583a02d6e5093625ed44a08651615105f4898507cbceb93d8c03245d26c0d06b6'
            'aa2ff9eef6ebd8ad31275a587b7b24e34938e9744b06892c96d43e274b18a15d2f0258f56cea8fea9163e85a754ebde1e66c20781876bcb524960defe02ce535'
            '9ac1f323657bdf0357d005635394f0b21a74a76d3b25307c9ccec32c10eed00686e584a021028658ebd023c029c3b44485713532bb6f04b30c887790bf617a42')
backup=('var/lib/signald/data')
install=${pkgname}.install
_daemon_uid=565

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 < ${srcdir}/gradle-no-daemon.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make installDist
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm "build/install/signald/bin/signald.bat"
    install -dm755 "${pkgdir}/var/lib/signald/data"
    cp -dr --no-preserve=ownership "build/install/signald/" "${pkgdir}/var/lib/"
    chown -R ${_daemon_uid}:${_daemon_uid} "${pkgdir}/var/lib/signald/"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s ../../var/lib/signald/bin/signald "${pkgdir}/usr/bin/signald"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/debian/signald.service" "${pkgdir}/usr/lib/systemd/system/signald.service"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
