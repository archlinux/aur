# Maintainer: Abdur-Rahman Mansoor <mansoorar at proton dot me>

_pkgname='quikc'
pkgname='quikc-git'
pkgver=r267.c83d32e
pkgrel=1
url="https://github.com/Ramenu/$_pkgname"
pkgdesc='A minimalistic, safety-focused build system for C/C++'
arch=('x86_64')
makedepends=('cargo' 'git')
depends=('python')
license=('MIT')
source=("$_pkgname::git+$url.git")
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
	export rustc_version=$(rustc --version)
	RUSTFLAGS="-C target-cpu=native" cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm755 ./target/release/quikc -t "$pkgdir/usr/bin/"
	install -Dm755 ./quikc-init -t "$pkgdir/usr/bin/"
}

