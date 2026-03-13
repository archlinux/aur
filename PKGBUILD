# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=zmx
pkgver=0.4.1
pkgrel=2
pkgdesc="Session persistence for terminal processes"
arch=('x86_64')
url="https://zmx.sh/"
license=('MIT')
makedepends=('zig')
conflicts=('zmx-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neurosnap/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha512sums=('2529ab0e30488387ca17fe5a8b25911570a302ad6c75c2bd99164774e241844a8eff4b55a083b6dc13e9496d3c2581ec1304a781ebb703ffd659938b42449430')

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
