# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>

pkgname=dsnet
_pkgname=${pkgname}
pkgver=0.7.3
pkgrel=1
pkgdesc="Simple command to manage a centralised wireguard VPN."
arch=(any)
url="https://github.com/naggie/dsnet"
license=(MIT)
makedepends=("go" "git")
depends=("glibc")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "systemd.patch")
sha256sums=('4464fd197f6501e22f2fac8d2cded221ba91481a99f97edd48f5467785bdac6d'
            'c6df08c39903daf29dc03cda1b0723690ec40c85b75b8f5f9a736ba1189002cd')


prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/systemd.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
        -buildmode=pie \
        -o dsnet \
        ./cmd
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "dsnet" "${pkgdir}/usr/bin/dsnet"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "etc/dsnet.service" "${pkgdir}/usr/lib/systemd/system/dsnet.service"
}
