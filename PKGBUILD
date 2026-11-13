# Maintainer: Fermín Olaiz <fermin@olaiz.net>

pkgname=hcl-tools
pkgver=2.25.0
pkgrel=1
pkgdesc="Tools for parsing and formatting HCL based files (hcldec, hclfmt, hclspecsuite)"
arch=('x86_64' 'aarch64')
url="https://github.com/hashicorp/hcl"
license=('MPL-2.0')
depends=('glibc')
makedepends=('git' 'go')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('53689ee1205c77b9f5666f19cc277f2afd41d4a2e69b4e6612c7840315b53cce')

build() {
    cd "${srcdir}/hcl"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
    go build -ldflags "-compressdwarf=false -linkmode external" -o build/ ./cmd/...
}

package() {
    cd "${srcdir}/hcl"
    install -Dm755 -t "${pkgdir}/usr/bin/" ./build/{hcldec,hclfmt,hclspecsuite}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
