# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>

pkgname=dsnet-git
_pkgname=${pkgname%-git}
pkgver=0.7.3.r0.gc7096d1
pkgrel=1
pkgdesc="Simple command to manage a centralised wireguard VPN."
arch=(x86_64)
url="https://github.com/naggie/dsnet"
license=(MIT)
makedepends=("go" "git")
depends=("glibc")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+https://github.com/naggie/dsnet"
        "systemd.patch")
sha256sums=('SKIP'
            'c6df08c39903daf29dc03cda1b0723690ec40c85b75b8f5f9a736ba1189002cd')


pkgver() {
    cd "${pkgname}"
    git describe --tags --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "${pkgname}"
    patch --forward --strip=1 --input="${srcdir}/systemd.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    go build \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
        -buildmode=pie \
        -o dsnet \
        ./cmd/
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "dsnet" "${pkgdir}/usr/bin/dsnet"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "etc/dsnet.service" "${pkgdir}/usr/lib/systemd/system/dsnet.service"
}
