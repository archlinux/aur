# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=zmx
pkgver=0.4.2
pkgrel=1
pkgdesc="Session persistence for terminal processes"
arch=('x86_64')
url="https://zmx.sh/"
license=('MIT')
makedepends=('zig')
conflicts=('zmx-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neurosnap/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha512sums=('d0dcaec402aa83d7178722b8bbad5279cfb925b3019ad93838b2d6cbcaa71dcee15018d0c74270d4a94344724db553d6efebe121848c042adbfd2e287ce563aa')

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
