
# Maintainer: Vitold Sedyshev <vit1251@gmail.com>

pkgname='golden-point'
pkgver='1.2.19'
pkgrel=2
arch=('x86_64')
pkgdesc='Golden Point is FIDO network message editor/reader, mailer, tracker and tosser.'
url='https://github.com/vit1251/golden/releases'
license=('MIT')
makedepends=('go>=2:1.18')
source=("https://github.com/vit1251/golden/archive/refs/tags/$pkgver.tar.gz")
md5sums=('0eb99ab2413bf2078b75e202de995764')

prepare() {
    cd "golden-$pkgver"
    go get -v -u
    go generate
}

build() {
    cd "golden-$pkgver"
    export GOOS="linux"
    export GOARCH="amd64"
    export CGO_ENABLED="1"
    go build \
        -trimpath \
        -buildmode=pie \
        -o golden-linux-amd64
}

package() {
    cd "golden-$pkgver"
    install -m 0755 -d "$pkgdir/opt/golden"
    # Executable
    install -m 0755 golden-linux-amd64 "$pkgdir/opt/golden/golden-linux-amd64"
    # Readme, license and changes
    install -m 0644 LICENSE "$pkgdir/opt/golden/LICENSE"
    install -m 0644 README.md "$pkgdir/opt/golden/README.md"
    install -m 0644 ChangeLog "$pkgdir/opt/golden/ChangeLog"
    # User guide
    install -m 0755 -d "$pkgdir/opt/golden/docs"
    install -m 0644 docs/*.md "$pkgdir/opt/golden/docs/"
}
