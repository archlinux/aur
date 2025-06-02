# Contributor: Danilo Carolino <danilogcarolino@gmail.com>

pkgname=docker-color-output-git
pkgver=2.6.1.r0.g7c44fec
pkgrel=1
pkgdesc="Enhances docker's command output by adding customizable colors"
arch=('x86_64')
license=('MIT')
url="https://github.com/devemio/docker-color-output"
source=("git+$url.git")
makedepends=("go" "git")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o ${pkgname%-git} ./cmd/cli
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 -t "$pkgdir/usr/bin" docker-color-output
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
