# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="nzbhydra-git"
pkgver=r375.0b09898
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
source=("nzbhydra-git::git+https://github.com/theotherp/nzbhydra.git"
        "nzbhydra.sh"
        "nzbhydra.service"
        "nzbhydra.install")
md5sums=('SKIP'
         '1430b962bb52c75abee5a63347e61dbd'
         '66ff80d1a9bc2079cd5fd44134467159'
         '4cb81156eb125cf6daefc2389ccf050a')
sha1sums=('SKIP'
          '9c928da41170ec913463347a833a0caad052b342'
          '02e37e3aa125ed6a95b1cdcd36c265a81b4e8ec7'
          '28d5f16cea5130ae7cc6844c486d001f18daba88')
sha256sums=('SKIP'
            '91552953d0d956101136cd3165f217de4d14eb65042b7dd3e9a09c8657319436'
            '9035c3c2a7d773ddadefb207cc0690629283f60903189ad595dd8de098c4457f'
            '4419c7faed911a03ea0c9ccafa69607d2038cf49a508aa5595d9732146204649')
sha512sums=('SKIP'
            '83aacf4f4f33af8d8cb99f1063958b44773f04ba168aaba12a303d1944a74f8ca729c483c57e2e8b8cadb7fac706d7297fc2de505a1c5608a8c09ddeee7690bf'
            'b7157d91508e8c4b07a47bd201bf93b69ef119d1090a9f66c8feeb4980028869a67c99c46a6a51bb8ef4dd774daf3a3cf97af83b7d3ee943f5404325032ce70f'
            'b3605cb1e8fb70c6ca246e82a0c9e10a1659d6907f5e18f0a39e63ff33cbc55b57cfc8ee113be0ae07e0cee08859009346377ac5a51ac17dc48ff906fb6873c7')

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
