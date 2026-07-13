# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex
pkgver=4.5
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('60a521e090027c501c3a2b8c3affbc32ae0a65161fa97e26a8f1b1ae750cec1d')

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -o clx \
        ./cmd/clx
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 clx "$pkgdir/usr/bin/clx"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 share/man/clx.1 "$pkgdir/usr/share/man/man1/clx.1"
    install -Dm644 share/completions/clx.bash \
        "$pkgdir/usr/share/bash-completion/completions/clx"
    install -Dm644 share/completions/_clx \
        "$pkgdir/usr/share/zsh/site-functions/_clx"
    install -Dm644 share/completions/clx.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/clx.fish"
}
