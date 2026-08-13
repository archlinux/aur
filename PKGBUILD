# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Trengrove <john at weaviate dot-symbol io>
# Contributor: tee < teeaur at duck dot com >

pkgname=weaviate
pkgver=1.39.0
pkgrel=1
_commit=be0c9cd
pkgdesc='An open source vector database written in Go'
arch=(x86_64 aarch64)
url='https://github.com/weaviate/weaviate'
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git go)
source=("$pkgname::git+$url#commit=${_commit}?signed"
        weaviate.default
        weaviate.service
        weaviate.sysusers
        weaviate.tmpfiles)
sha256sums=('41007ed2789c6f620d27ba546624525fce4dd588eab24b697ed5b34a7b1f1beb'
            'a375b1c55be48563ea3284a264352f1673c3f8e8f83bfd337c2ddfaeb532ce6d'
            '1507f4003ed6d3d5230cc9570e6f69c3be6177b52496b976f10a93519626b86a'
            'a644fc4eaa46e97381df09b5321e60a9ca1cfdac67277b8fe103fb4bd96d4fa0'
            '557f6c52ca3c4dc261a5ff11e4d998b9f66690c8ee2075450a2a225107b58f57')
validpgpkeys=(CFC67B5024BEB759BE2FADF262EADC233D625E3D) ## jeroiraz

prepare() {
    cd "$pkgname"
    export GOPATH="$srcdir"
    go mod download -modcacherw
    mkdir -p build
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    cd "$pkgname"
    go build -o build ./cmd/weaviate-server/
}

package() {
    # binary
    install -Dm755 "$pkgname/build/weaviate-server" "${pkgdir}/usr/bin/weaviate"

    # user/group & owned directories
    install -Dm644 weaviate.sysusers "${pkgdir}/usr/lib/sysusers.d/weaviate.conf"
    install -Dm644 weaviate.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/weaviate.conf"

    # services & runtime
    install -Dm644 weaviate.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 weaviate.default "${pkgdir}/etc/default/weaviate"

    install -Dm644 "$pkgname/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

    # licenses
    install -Dm644 "$pkgname/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
