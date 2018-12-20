# Maintainer: Noel Kuntze <noel.kuntze at thermi dot consulting>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>

pkgname=acmetool
pkgver=0.0.67
pkgrel=3
pkgdesc="An easy-to-use command line tool for automatically acquiring certificates from ACME servers (such as Let's Encrypt)"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/hlandau/acme"
license=('MIT')
depends=(bash libcap)
makedepends=(go)

source=(acmetool-$pkgver.tar.gz::https://github.com/hlandau/acme/archive/v$pkgver.tar.gz
        LICENSE::https://raw.githubusercontent.com/hlandau/rilts/master/licences/COPYING.MIT
        acmetool.service
        acmetool.timer
        acmetool.conf
        )

sha256sums=('01f78340006539c62bb86250433d2f819ab529ccd9a0aa74e140ff0fee839073'
            'fd80a26fbb3f644af1fa994134446702932968519797227e07a1368dea80f0bc'
            'bf0052ea1a94919455fc364c6e9ff66f9268b7f80c42e9a73249919a6b369d9c'
            '82cd724853507a6d96f7a432aa44c457e76f4d6c0f1ad35142287b7c383d5c0b'
            '91f8999341dd8dcc1170231f977ae8f93fc671cd4d2b87c56b9e44c4ec0a13a2')

prepare() {
    export GOPATH="${srcdir}/build"
    mkdir -p "${GOPATH}/src/github.com/hlandau/"
    mv "${srcdir}/acme-${pkgver}" "${GOPATH}/src/github.com/hlandau/acme"
    go get -v github.com/hlandau/acme/cmd/acmetool
}

build() {
    export GOPATH="${srcdir}/build"
    cd "${GOPATH}/src/github.com/hlandau/acme/cmd/acmetool"
    go build -pkgdir "${pkgdir}" \
        -ldflags "-X github.com/hlandau/acme/responder.StandardWebrootPath=\"/run/acme/acme-challenge\""
}

package() {
    # copy binary
    install -Dm0755 "${srcdir}/build/bin/acmetool" "${pkgdir}/usr/bin/acmetool"
    # copy systemd units (service and timer)
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" \
                        ${srcdir}/acmetool.service \
                        ${srcdir}/acmetool.timer
    # copy acmetool.tmpfiles
    install -Dm644 -t "${pkgdir}/usr/lib/tmpfiles.d/" ${srcdir}/acmetool.conf

    # copy README.md and other documentation
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/build/src/github.com/hlandau/acme/README.md" "${srcdir}/build/src/github.com/hlandau/acme/_doc/"*
    # copy the license
    install -Dm644  "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/acmetool/LICENSE"
}
