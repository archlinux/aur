# Maintainer: zer0def <zer0def on freenode>
pkgname=signald-git
pkgver=0.7.0.r43.0008585
pkgrel=1
pkgdesc='An unofficial daemon that facilitates communication with the Signal messaging app.'
url='https://git.callpipe.com/finn/signald'
license=('GPL3')
arch=('any')
makedepends=('git' 'gradle')
depends=('java-runtime')
provides=('signald')
conflicts=('signald')
source=("${pkgname}::git+https://github.com/thefinn93/signald"
        'gradle-no-daemon.patch'
        'sysusers')
sha512sums=('SKIP'
            'aa2ff9eef6ebd8ad31275a587b7b24e34938e9744b06892c96d43e274b18a15d2f0258f56cea8fea9163e85a754ebde1e66c20781876bcb524960defe02ce535'
            '2aa12935ec8d6ce7dac1328e232fd8af9cea8248b7315c54fd8132b578ef5c6dfb32dc64558281bac57156c37336c3203e03af9cdb56312c57bfce1d23f82764')

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
    install -dm755 "${pkgdir}/var/lib/"
    cp -dr --no-preserve=ownership "build/install/signald/" "${pkgdir}/var/lib/"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s ../../var/lib/signald/bin/signald "${pkgdir}/usr/bin/signald"
    install -Dm644 "${srcdir}/${pkgname}/debian/signald.service" "${pkgdir}/usr/lib/systemd/system/signald.service"

    install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/signald.conf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
