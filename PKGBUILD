
# Maintainer: Vitold Sedyshev <vit1251@gmail.com>

pkgname='golden-git'
pkgver=r415.68ef303
pkgrel=1
arch=('x86_64')
pkgdesc='Golden Point is FIDO network message editor/reader, mailer, tracker and tosser.'
url='https://github.com/vit1251/golden/releases'
license=('MIT')
makedepends=('go>=2:1.18', 'git')
conflicts=('golden')
source=("git+https://github.com/vit1251/golden.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    go get -v ./...
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export GOOS="linux"
    export GOARCH="amd64"
    export CGO_ENABLED="1"
    go build \
        -trimpath \
        -buildmode=pie \
        -o "golden-linux-amd64" \
        ./cmd/golden
}

check() {
    cd "$srcdir/${pkgname%-git}"
    go test ./...
}

package() {
    cd "$srcdir/${pkgname%-git}"
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
