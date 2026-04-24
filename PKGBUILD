# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=zmx
pkgver=0.5.0
pkgrel=1
pkgdesc="Session persistence for terminal processes"
arch=('x86_64')
url="https://zmx.sh/"
license=('MIT')
makedepends=('zig')
conflicts=('zmx-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neurosnap/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha512sums=('0d484b352dec9d54b54d02e0e6d7cb2c6542be4075e1c73b0a3ac9b0119fc9875e29f5fd6e34d37f86f6ebab5a098df4d41e6715c527169f5bdeea0d0c2a8176')

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
