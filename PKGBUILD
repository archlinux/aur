# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

_pkgname='quikc'
pkgname='quikc-git'
pkgver=r374.fa09550
pkgrel=4
url="https://git.missingno.dev/$_pkgname"
pkgdesc='A minimalistic, safety-focused build system for C/C++'
arch=(
	'x86_64'
	'i686'
	'aarch64'
)
makedepends=('cargo' 'git')
license=('MIT')
source=("$_pkgname::git+$url")
optdepends=('gcc: GNU C/C++ compiler'
	    'clang: LLVM C/C++ frontend'
	    'pkgconf: for automatic third party dependency resolution'
	    'python: for quikc-init')
conflicts=('quikc')
provides=('quikc')
b2sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( 
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
	cd "$_pkgname"
	rustc_version=$(rustc --version) cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm644 ./manpages/quikc.7 "$pkgdir/usr/share/man/man7/quikc.7"
	install -Dm644 ./manpages/quikc-init.7 "$pkgdir/usr/share/man/man7/quikc-init.7"
	install -Dm644 ./README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 ./LICENSE.html -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm755 ./target/release/quikc -t "$pkgdir/usr/bin/"
	install -Dm755 ./quikc-init -t "$pkgdir/usr/bin/"
}

