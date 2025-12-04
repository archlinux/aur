
# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terrascan
pkgver=1.19.9
pkgrel=1
pkgdesc="Detect compliance and security violations across Infrastructure as Code"
arch=('x86_64')
url="https://github.com/accurics/${pkgname}"
license=('Apache-2.0')
makedepends=('go>=1.19')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('13c120a63d7024ca8c54422e047424e318622625336ed77b2c1a36ef5fb1441c')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    # Fix proto/yaml conflicts
    go mod edit \
        -replace github.com/googleapis/gnostic=github.com/google/gnostic-models@v0.6.9 \
        -replace gopkg.in/yaml.v3=gopkg.in/yaml.v3@v3.0.1
    
    go mod tidy
}

build() {
    cd "${pkgname}-${pkgver}"
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -mod=mod -modcacherw"
    
    go build -o "${pkgname}" \
        -ldflags="-linkmode=external \
            -X 'main.VERSION=${pkgver}' \
            -X 'main.buildDate=$(date -u +%Y-%m-%dT%H:%M:%SZ)' \
            -X 'google.golang.org/protobuf/reflect/protoregistry.conflictPolicy=warn'" \
        ./cmd/terrascan/
}

package() {
    cd "${pkgname}-${pkgver}"
    
    install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}