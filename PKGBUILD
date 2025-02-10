pkgname=cgtproxy
pkgver=0.2.3
_commit=714875612e78305e4a0675e69c344540d7015ebf
pkgrel=1
pkgdesc="A transparent proxy RULE manager written in go inspired by cgproxy."
arch=(x86_64)
url="https://github.com/black-desk/cgtproxy"
license=(GPL-3.0-only)
depends=(gcc-libs glibc)
makedepends=(go)
source=("$pkgname-$_commit.tar.gz::https://github.com/black-desk/cgtproxy/archive/$_commit.tar.gz")
sha256sums=('6820966eebb300c50e04f63b815e2000894ae5edd577bd3460fe783e9131f951')

prepare() {
    cd "$pkgname-$_commit"
    # Allow this value being overriden
    sed -i 's/PROJECT_GIT_DESCRIBE =/PROJECT_GIT_DESCRIBE ?=/' \
        Makefile
}

build() {
    cd "$pkgname-$_commit"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    make GO_LDFLAGS="-linkmode=external" PROJECT_GIT_DESCRIBE="v$pkgver-0-g${_commit:0:7}"

    ./cgtproxy completion bash > cgtproxy.sh
    ./cgtproxy completion zsh > cgtproxy.zsh
    ./cgtproxy completion fish > cgtproxy.fish
}

package() {
    cd "$pkgname-$_commit"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -Dm644 misc/config/example.yaml "$pkgdir/usr/share/doc/$pkgname/config.yaml"
    install -Dm644 cgtproxy.sh "$pkgdir/usr/share/bash-completion/completions/cgtproxy"
    install -Dm644 cgtproxy.zsh "$pkgdir/usr/share/zsh/site-functions/_cgtproxy"
    install -Dm644 cgtproxy.fish "$pkgdir/usr/share/fish/vendor_completions.d/cgtproxy.fish"
}
