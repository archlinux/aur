# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=zmx
pkgver=0.8.1
pkgrel=1
pkgdesc="Session persistence for terminal processes"
arch=('x86_64')
url="https://zmx.sh/"
license=('MIT')
makedepends=('zig')
conflicts=('zmx-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neurosnap/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha512sums=('bc654d3b273f01e63c6fd6e2229c6313ce36daae7a707a90409b7a6b58a8b5dd0c905988af4a6a0bc94d7de02269c02480b6c35e2c6749a44eec03b63e41c0bc')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR=build zig build \
        --prefix "/usr" \
        -Doptimize=ReleaseSafe
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -a build/* "$pkgdir/"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    build/usr/bin/zmx completions bash > "$pkgdir/usr/share/bash-completion/completions/zmx.bash"
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
    build/usr/bin/zmx completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/zmx.fish"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    build/usr/bin/zmx completions zsh > "$pkgdir/usr/share/zsh/site-functions/_zmx"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
