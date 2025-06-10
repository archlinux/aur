pkgname=cgtproxy
pkgver=0.3.1
pkgrel=1
pkgdesc="A transparent proxy RULE manager written in go inspired by cgproxy."
arch=(x86_64)
url="https://github.com/black-desk/cgtproxy"
license=(GPL-3.0-only)
depends=(gcc-libs glibc)
makedepends=(go git)
source=("git+https://github.com/black-desk/cgtproxy#tag=v$pkgver")
sha256sums=('87d2f01dc04fa96f3c6bab29b4712593adffdbab91b614f62c42b509b17b39a1')

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    make GO_LDFLAGS="-linkmode=external"

    ./cgtproxy completion bash > cgtproxy.sh
    ./cgtproxy completion zsh > cgtproxy.zsh
    ./cgtproxy completion fish > cgtproxy.fish
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -Dm644 misc/config/example.yaml "$pkgdir/usr/share/doc/$pkgname/config.yaml"
    install -Dm644 cgtproxy.sh "$pkgdir/usr/share/bash-completion/completions/cgtproxy"
    install -Dm644 cgtproxy.zsh "$pkgdir/usr/share/zsh/site-functions/_cgtproxy"
    install -Dm644 cgtproxy.fish "$pkgdir/usr/share/fish/vendor_completions.d/cgtproxy.fish"
}
