# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=gogcli
_pkgbin=gog
pkgver=0.18.0
pkgrel=1
pkgdesc="Google Suite CLI: Gmail, GCal, GDrive, GContacts."
arch=('x86_64' 'aarch64')
url="https://github.com/steipete/gogcli"
license=('MIT')
provides=('gog')
conflicts=('gog')
depends=('glibc')
makedepends=('go' 'make')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ceeb362531d3277c5b83ce2e4f3d0bcdcb5038c0a6513ef0504698540a873db9')

build() {
    cd "$pkgname-$pkgver"
    make
    ./bin/"$_pkgbin" completion bash >"$_pkgbin".bash
    ./bin/"$_pkgbin" completion zsh >_"$_pkgbin"
    ./bin/"$_pkgbin" completion fish >"$_pkgbin".fish
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "bin/${_pkgbin}" -t "$pkgdir/usr/bin/"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"

    install -Dm644 "${_pkgbin}.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgbin"
    install -Dm644 _"${_pkgbin}" "$pkgdir/usr/share/zsh/site-functions/_$_pkgbin"
    install -Dm644 "${_pkgbin}".fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgbin.fish"
}
