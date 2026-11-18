# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=tfk8s-bin
_pkgname=tfk8s
pkgver=0.1.10
pkgrel=2
pkgdesc='Convert Kubernetes YAML manifests to Terraform HCL'
arch=('x86_64' 'aarch64')
url='https://github.com/jrhouston/tfk8s'
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Upstream publishes no release binaries, so this builds from the source tag.
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('be2680e76311ac7dd814a1bb0dceb486e3511d8d68845421338f9fcf5a92d5f9')

prepare() {
    cd "$_pkgname-$pkgver"
    export GOPATH="$srcdir/gopath" GOFLAGS='-mod=readonly -modcacherw'
    go mod download
}

build() {
    cd "$_pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
    # -buildvcs=false: srcdir sits inside the AUR/packaging git checkout, not upstream's repo
    export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
    go build -ldflags "-linkmode=external -X main.toolVersion=$pkgver" -o tfk8s
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 tfk8s "$pkgdir/usr/bin/tfk8s"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
