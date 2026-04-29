# Maintainer: ced0180 <countbaster@gmail.com>

pkgname=skull-shell-git
pkgver=0.1.0.r4.g41a9834
pkgrel=1
pkgdesc='Tiny POSIX-style shell written in C++20'
arch=('x86_64' 'aarch64')
url='https://codeberg.org/SkullOS/skull-shell'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'xmake')
provides=('skull-shell' 'skull')
conflicts=('skull-shell' 'skull')
install='skull-shell.install'
source=('git+https://codeberg.org/SkullOS/skull-shell.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/skull-shell"
    printf '0.1.0.r%s.g%s' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/skull-shell"
    xmake f -m release --yes
    xmake build skull
}

package() {
    cd "$srcdir/skull-shell"

    local binary
    binary="$(find build -type f -path '*/release/skull' -print -quit)"
    if [[ -z "$binary" ]]; then
        echo 'skull binary was not produced by xmake' >&2
        return 1
    fi

    install -Dm755 "$binary" "$pkgdir/usr/bin/skull"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 README.ja.md "$pkgdir/usr/share/doc/$pkgname/README.ja.md"
}
