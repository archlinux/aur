# Maintainer: tuftedocelot@fastmail.fm
_pkgname=exa
pkgname=${_pkgname}-git
pkgver=v0.9.0.r80.78ba0b8
pkgrel=1
pkgdesc='Replacement for ls written in Rust.'
arch=('i686' 'x86_64')
url="https://github.com/ogham/exa"
license=('MIT')
depends=('libssh2' 'zlib')
makedepends=('cmake' 'rust' 'cargo' 'git')
provides=('exa')
conflicts=('exa')
source=("git+https://github.com/ogham/exa.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    make -C "$srcdir/$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/bin"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 contrib/completions.bash \
        "$pkgdir/etc/bash_completion.d/$pkgname"
    install -Dm644 contrib/completions.zsh \
        "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 contrib/completions.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 LICEN?E \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$_pkgname/contrib/man/$_pkgname.1" \
        "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
