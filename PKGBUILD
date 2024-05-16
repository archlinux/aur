# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=wgcf-cli
pkgver=0.3.4
pkgrel=1
pkgdesc='A command-line tool for Cloudflare-WARP API, built using Cobra.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 's390x' 'riscv64')
url='https://github.com/ArchiveNetwork/wgcf-cli'
license=('MPL-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7de81bc118996c5618dc4c34d07b5f46a9f7fe7086454796095c25ff9cbc200a3164fe676f6c74733aa71c85fbf1f646f2487a650670c6006cda6921d3acce57')

build(){
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export VERSION=$pkgver

    make TAGS=with_plus

    install -d completions

    make completion=bash > completions/bash
    make completion=zsh > completions/zsh
    make completion=fish > completions/fish
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm644 completions/bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 completions/zsh "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 completions/fish "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
