
# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=acmetool
pkgver=0.0.59
pkgrel=2
pkgdesc="An easy-to-use command line tool for automatically acquiring certificates from ACME servers (such as Let's Encrypt)"
arch=(i686 x86_64 armv7h)
url="https://github.com/hlandau/acme"
license=('MIT')
depends=(glibc bash libcap)
makedepends=(go)

source=(acmetool-$pkgver.tar.gz::https://github.com/hlandau/acme/archive/v$pkgver.tar.gz
        LICENSE::https://raw.githubusercontent.com/hlandau/rilts/master/licences/COPYING.MIT
        acmetool.service
        acmetool.timer
        acmetool.tmpfile
        )

sha256sums=('c84bf2d7ab20fdc16b9047ebb3bca48c8e1282f92605fa2eba08f7963ef6c3b4'
            'fd80a26fbb3f644af1fa994134446702932968519797227e07a1368dea80f0bc'
            'de9d31c97000445e3da4dccca404efa9c23203d5fe345befdd9926bcdb6b36e3'
            '82cd724853507a6d96f7a432aa44c457e76f4d6c0f1ad35142287b7c383d5c0b'
            'ae82f90321f60f441f49227e8cc69c3bb1fc80f196bb6070b4617048adf1ca4d')

build() {
    GOPATH="${srcdir}/fakegopath"
    export GOPATH
    mkdir -p "${GOPATH}/src/github.com/hlandau/acme/"
    cd "${srcdir}/acme-${pkgver}"
    for i in `find . -maxdepth 1 -type d`
    do
    if [ "${i}" = "." ]
    then
    continue
    fi
    cp -rf "${i}" "${GOPATH}/src/github.com/hlandau/acme/"
    done
    go get -v github.com/hlandau/acme/cmd/acmetool
    cd "${GOPATH}/src/github.com/hlandau/acme/cmd/acmetool"
    go build -pkgdir "${pkgdir}"
}

package() {
    install -Dm0755 "${srcdir}/fakegopath/bin/acmetool" "${pkgdir}/usr/bin/acmetool"
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" \
                        ${srcdir}/acmetool.service \
                        ${srcdir}/acmetool.timer
    install -Dm644 -t "${pkgdir}/usr/lib/tmpfiles.d" ${srcdir}/acmetool.tmpfile

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/acme-${pkgver}/README.md" "${srcdir}/acme-${pkgver}/_doc/"*
    # copy the license
    install -Dm644  "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/acmetool/LICENSE"
}
