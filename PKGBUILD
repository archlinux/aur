# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=wgcf-cli
pkgver=0.3.6
pkgrel=1
pkgdesc='A command-line tool for Cloudflare-WARP API, built using Cobra.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 's390x' 'riscv64')
url='https://github.com/ArchiveNetwork/wgcf-cli'
license=('MPL-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0feded8450cfd7dbf71dfb3490cf8922181c4adec45e8bd6be270ff35e48042b86dee1ce60d44ee4eaa950e3cad6902276275bbd0f30c3820d4e8a766e2410de')

build(){
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export VERSION="v$pkgver"

    make TAGS=with_plus

    install -d completions

    make completion=bash > completions/bash
    make completion=zsh > completions/zsh
    make completion=fish > completions/fish
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname"        -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE"         -t "$pkgdir/usr/share/licenses/$pkgname/"

    install -Dm644 completions/bash     "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 completions/zsh      "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 completions/fish     "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
