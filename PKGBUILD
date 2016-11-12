# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="nzbhydra-git"
pkgver=r932.450f6d9
pkgrel=1
pkgdesc="Meta search for NZB indexers"
arch=('any')
url="https://github.com/theotherp/nzbhydra"
license=('Apache')
depends=('python2')
optdepends=('python2-lxml: faster result processing')
makedepends=('git')
install='nzbhydra.install'
provides=('nzbhydra')
conflicts=('nzbhydra')
source=("${pkgname}::git+https://github.com/theotherp/nzbhydra.git"
        "nzbhydra.sh"
        "nzbhydra.service")
sha512sums=('SKIP'
            '83aacf4f4f33af8d8cb99f1063958b44773f04ba168aaba12a303d1944a74f8ca729c483c57e2e8b8cadb7fac706d7297fc2de505a1c5608a8c09ddeee7690bf'
            'f0f79e0bb0aee5bce474811bb113593725772e31552aa48d74465565291005a977777469ce0a7b53c10800cffa16d952b63c368e2120cc2d0ed80f7288151f12')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/usr/lib/nzbhydra"
    cp -dpr --no-preserve=ownership "${srcdir}/nzbhydra-git/"* "${pkgdir}/usr/lib/nzbhydra"

    msg2 "Precompiling python files"
    python2 -m compileall -q "${pkgdir}/usr/lib/nzbhydra"

    install -D -m 755 "${srcdir}/nzbhydra.sh" "${pkgdir}/usr/bin/nzbhydra"

    install -d -m 755 "${pkgdir}/var/lib/nzbhydra"

    mkdir -m 755 "${pkgdir}/var/lib/nzbhydra/flask_session"
    touch "${pkgdir}/var/lib/nzbhydra/nzbhydra.log"
    touch "${pkgdir}/var/lib/nzbhydra/nzbhydra.pid"

    chmod 644 "${pkgdir}/var/lib/nzbhydra/nzbhydra.log"
    chmod 644 "${pkgdir}/var/lib/nzbhydra/nzbhydra.pid"

    ln -s "../../../var/lib/nzbhydra/nzbhydra.log" "${pkgdir}/usr/lib/nzbhydra/nzbhydra.log"
    ln -s "../../../var/lib/nzbhydra/nzbhydra.pid" "${pkgdir}/usr/lib/nzbhydra/nzbhydra.pid"
    ln -s "../../../var/lib/nzbhydra/flask_session" "${pkgdir}/usr/lib/nzbhydra/flask_session"

    install -d -m 750 "${pkgdir}/etc/nzbhydra"

    install -D -m 644 "${srcdir}/nzbhydra.service" "${pkgdir}/usr/lib/systemd/system/nzbhydra.service"
}
