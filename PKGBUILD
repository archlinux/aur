# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: desbma
pkgname=bat-extras-git
pkgver=2020.10.05.r13.g165fc69
pkgrel=2
pkgdesc="Bash scripts that integrate bat with various command line tools."
arch=('any')
url="https://github.com/eth-p/bat-extras"
license=('MIT')
depends=('bat')
makedepends=('git')
checkdepends=('ripgrep')
optdepends=('ripgrep: required for batgrep script'
            'entr: optional for batwatch script'
            'ncurses: optional for batdiff script'
            'git-delta: optional for batdiff script'
            'prettier: various code formatting for prettybat script'
            'shfmt: bash formatting for prettybat script'
            'rustfmt: Rust formatting for prettybat script'
            'clang: C / C++ / Objective-C formatting for prettybat script'
            'python-black: Python formatting for prettybat script')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/eth-p/bat-extras.git'
        'git+https://github.com/eth-p/best.git'
        'git+https://github.com/eth-p/best-tests.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init .test-framework
	git config submodule.best.url "$srcdir/best"
	git submodule update

	cd .test-framework
	git submodule init tests
	git config submodule.best-tests.url "$srcdir/best-tests"
	git submodule update
}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./build.sh --minify=none
}

check() {
	cd "$srcdir/${pkgname%-git}"
	./test.sh
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 bin/* -t "$pkgdir/usr/bin"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/${pkgname%-git}"
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 man/* -t "$pkgdir/usr/share/man/man1"
}
