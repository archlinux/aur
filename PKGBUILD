# Maintainer: zer0def <zer0def@github>
pkgname=signald-git
pkgver=0.8.1.r1.3faee48
pkgrel=2
pkgdesc='An unofficial daemon that facilitates communication with the Signal messaging app.'
#url='https://git.callpipe.com/finn/signald'
url='https://gitlab.com/thefinn93/signald'
license=('GPL3')
arch=('any')
makedepends=('git' 'java-environment-openjdk' 'gradle')
depends=('java-runtime')
optdepends=('openbsd-netcat: interaction with signald socket'
            'qrencode: display account linking token as QR code')
provides=('signald')
conflicts=('signald')
source=("${pkgname}::git+https://github.com/thefinn93/signald"
        'gradle-no-daemon.patch'
        'signald-git.install')
sha512sums=('SKIP'
            'aa2ff9eef6ebd8ad31275a587b7b24e34938e9744b06892c96d43e274b18a15d2f0258f56cea8fea9163e85a754ebde1e66c20781876bcb524960defe02ce535'
            '9ac1f323657bdf0357d005635394f0b21a74a76d3b25307c9ccec32c10eed00686e584a021028658ebd023c029c3b44485713532bb6f04b30c887790bf617a42')
backup=('var/lib/signald/data')
install=${pkgname}.install
_daemon_uid=565

pkgver() {
    cd "${srcdir}/${pkgname}"
    GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
    printf '%s.r%s.%s' \
        "${GITTAG}" \
        "$(git rev-list --count ${GITTAG}..)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -Np1 < ${srcdir}/gradle-no-daemon.patch
}

build() {
    cd "${srcdir}/${pkgname}"
    make installDist
}

package() {
    cd "${srcdir}/${pkgname}"

    rm "build/install/signald/bin/signald.bat"
    install -dm755 "${pkgdir}/var/lib/signald/data"
    cp -dr --no-preserve=ownership "build/install/signald/" "${pkgdir}/var/lib/"
    chown -R ${_daemon_uid}:${_daemon_uid} "${pkgdir}/var/lib/signald/"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s ../../var/lib/signald/bin/signald "${pkgdir}/usr/bin/signald"
    install -Dm644 "${srcdir}/${pkgname}/debian/signald.service" "${pkgdir}/usr/lib/systemd/system/signald.service"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
