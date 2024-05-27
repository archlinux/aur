# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=terraform-ls-git
_pkgname=terraform-ls
pkgver=v0.30.1.r417.g985e4a61
pkgrel=1
pkgdesc='Terraform Language Server'
arch=('x86_64')
url='https://github.com/hashicorp/terraform-ls'
license=('MPL-2.0')
makedepends=('go' 'git')
conflicts=('terraform-ls')
provides=('terraform-ls')
source=('git+https://github.com/hashicorp/terraform-ls')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$_pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
}
