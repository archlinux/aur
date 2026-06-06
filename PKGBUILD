# Maintainer: mfw <mfwolffe@outlook.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mat-cat
pkgver=0.7.3
pkgrel=1
pkgdesc='A fast cat/bat alternative with syntax highlighting, a built-in pager, and zero-copy I/O'
arch=('x86_64' 'aarch64')
url='https://github.com/tenseleyFlow/mat'
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('mat')
conflicts=('mat')
source=("mat::git+https://github.com/tenseleyFlow/mat.git#tag=v$pkgver"
        "paige::git+https://github.com/tenseleyFlow/paige#commit=4004f7a5cfa36897cb8b29df51dd9f4fef98ec82")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "mat"
    git submodule init
    git config submodule.lib/paige.url "$srcdir/paige"
    git -c protocol.file.allow=always submodule update
    sed -i '/LDFLAGS/s/=/+=/' Makefile
}

build() {
    cd "mat"
    ./configure --no-werror
    make
}

check() {
    cd "mat"
    make test
}

package() {
    cd "mat"

    install -Dm755 mat "$pkgdir/usr/bin/mat"
    install -Dm644 man/mat.1 "$pkgdir/usr/share/man/man1/mat.1"
    install -Dm644 completions/mat.bash "$pkgdir/usr/share/bash-completion/completions/mat"
    install -Dm644 completions/mat.zsh "$pkgdir/usr/share/zsh/site-functions/_mat"
    install -Dm644 completions/mat.fish "$pkgdir/usr/share/fish/vendor_completions.d/mat.fish"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
