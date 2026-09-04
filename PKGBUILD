# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=zmx
pkgver=0.8.0
pkgrel=1
pkgdesc="Session persistence for terminal processes"
arch=('x86_64')
url="https://zmx.sh/"
license=('MIT')
makedepends=('zig')
conflicts=('zmx-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neurosnap/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha512sums=('5e6cd690df3c01d5a2b1882a383e582c0836694c22430414ce2e07c9806c8935807d87c1a45e36a611efa3ed2b78e9810e6877681653e321c9d8ca4a1a76c95d')

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
