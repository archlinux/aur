# Maintainer: Gaurav Atreya <allmanpride@gmail.com>
pkgname=anek
pkgver=0.3.1
pkgrel=1
pkgdesc="Tool to run commands based on a templates"
arch=('x86_64')
url="https://github.com/Atreyagaurav/${pkgname}"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/Atreyagaurav/${pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "%s" "$(git describe --tags --abbrev=0 | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname}"
    git checkout "tags/$(git describe --tags --abbrev=0)"
}


build() {
	cd "$srcdir/${pkgname}"
	cargo build --release
}

package() {
    cd "$srcdir/${pkgname}"
    mkdir -p "$pkgdir/usr/bin"
    cp "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    cp completions/bash-completions.sh "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/"
    "./target/release/${pkgname}" completions --fish > "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    "./target/release/${pkgname}" completions --zsh > "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
}
