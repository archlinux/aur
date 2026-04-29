# Maintainer: Renat Gorbushin <lis@lis314.ru>
# Contributor: Lolle2000la
pkgname=amd-container-toolkit
pkgver=1.3.0
pkgrel=1
pkgdesc="Offers tools that streamline the use of AMD GPUs with containers."
arch=('x86_64')
url="https://github.com/ROCm/container-toolkit"
license=('Apache-2.0')
depends=('docker')
makedepends=('go' 'git')
_srcname=container-toolkit
source=("${pkgname}-${pkgver}.tar.gz"::https://github.com/ROCm/container-toolkit/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('4eadb33b77ac93be19dd33175d3bb669badf84ca618cb84e9b9f97f7505ba1be')

prepare() {
    mkdir -p "${srcdir}/${_srcname}-${pkgver}/bin/deb"
}

build() {
    cd "${srcdir}/${_srcname}-${pkgver}"

    local _build_date=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
    local _ldflags="-X main.Version=${pkgver} -X main.GitCommit=v${pkgver} -X main.BuildDate=${_build_date}"

    CGO_ENABLED=0 go build \
        -trimpath \
        -ldflags "-s -w ${_ldflags}" \
        -o bin/deb/amd-container-runtime \
        ./cmd/container-runtime

    CGO_ENABLED=0 go build \
        -trimpath \
        -ldflags "-s -w ${_ldflags}" \
        -o bin/deb/amd-ctk \
        ./cmd/amd-ctk
}

check() {
    cd "${srcdir}/${_srcname}-${pkgver}"
    # Required for cmd/amd-ctk integration tests
    export AMD_CTK_PATH="${PWD}/bin/deb/amd-ctk"
    go test ./...
}

package() {
    cd "${srcdir}/${_srcname}-${pkgver}"

    install -Dm755 bin/deb/amd-container-runtime "${pkgdir}/usr/local/bin/amd-container-runtime"
    install -Dm755 bin/deb/amd-ctk "${pkgdir}/usr/local/bin/amd-ctk"

    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
