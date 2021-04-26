# Maintainer: Fabian Köhler <fabian.koehler@protonmail.ch>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>

pkgname=dsnet-git
_pkgname=${pkgname%-git}
pkgver=0.5.r38.g9a71222
pkgrel=4
pkgdesc="Simple command to manage a centralised wireguard VPN."
arch=(any)
url="https://github.com/naggie/dsnet"
license=(MIT)
makedepends=("go" "git")
depends=("glibc")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+https://github.com/naggie/dsnet" "systemd.patch")
sha256sums=('SKIP'
            'c6df08c39903daf29dc03cda1b0723690ec40c85b75b8f5f9a736ba1189002cd')

pkgver() {
    cd "${srcdir}/${pkgname}"
    version=$(git tag -l --sort=-v:refname | sed 's/v\([^-].*\)/\1/g' | head -1)
    release=$(git describe --long --tags | sed 's/\([^-].*\)-\([0-9]*\)-\(g.*\)/r\2.\3/g')
    echo "${version}.${release}" | sed -re 's/-//g' # strip hyphen
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
        ./cmd/dsnet.go
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "dsnet" "${pkgdir}/usr/bin/dsnet"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "etc/dsnet.service" "${pkgdir}/usr/lib/systemd/system/dsnet.service"
}
