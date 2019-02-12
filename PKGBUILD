#Submitter: Carsten Feuls <archlinux@carstenfeuls.de>

_pkgname=thanos
pkgname=prometheus-$_pkgname
pkgver=0.3.0
pkgrel=1
pkgdesc="Highly available Prometheus setup with long term storage capabilities. (binary, not built from source)"
arch=("x86_64")
url="https://github.com/improbable-eng/thanos"
license=("Apache")
depends=()
makedepends=()
backup=("etc/thanos/sidecar.conf"
        "etc/thanos/store.conf"
        "etc/thanos/query.conf"
        "etc/thanos/rule.conf"
        "etc/thanos/compact.conf")

source_x86_64=("thanos.service"
               "thanos.conf"
               "thanos.sysuser"
               "https://github.com/improbable-eng/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.linux-amd64.tar.gz")
sha256sums_x86_64=('a2da1b0fd68488693b4db2d46300d70d6a3233e91195d971c6c470dd337cf08d'
                   '97a2a76ded469808b7d086dc02a63a9f45c535831763fc33ebd99528dceb437e'
                   '0d2ee33fa0a91ea2a93c652fdcc8d50f2b69a3598bc6819f14c57239ce3fcc82'
                   'fe1cb7ed940dac645309bbf0ce99c278ded8727a6cab9842bd9f572d205f60a6')

package() {
    cd "${srcdir}/$_pkgname-$pkgver.linux-amd64"

    # Install Binary
    install -D -m0755 thanos "${pkgdir}/usr/bin/thanos"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/thanos.service" "${pkgdir}/usr/lib/systemd/system/thanos@.service"
    install -D -m0644 "${srcdir}/thanos.sysuser" "${pkgdir}/usr/lib/sysusers.d/thanos.conf"

    install -d -m0655 -o212 -g212 "${pkgdir}/etc/thanos/"
    install -d -m0655 -o212 -g212 "${pkgdir}/var/lib/thanos"


    # Install thanos config
    install -D -m644 -o212 -g212 "${srcdir}/thanos.conf" "${pkgdir}/etc/thanos/sidecar.conf"
    install -D -m644 -o212 -g212 "${srcdir}/thanos.conf" "${pkgdir}/etc/thanos/store.conf"
    install -D -m644 -o212 -g212 "${srcdir}/thanos.conf" "${pkgdir}/etc/thanos/query.conf"
    install -D -m644 -o212 -g212 "${srcdir}/thanos.conf" "${pkgdir}/etc/thanos/rule.conf"
    install -D -m644 -o212 -g212 "${srcdir}/thanos.conf" "${pkgdir}/etc/thanos/compact.conf"
}
