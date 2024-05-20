# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

_pkgname='html2atom'
pkgbase="$_pkgname"
pkgname="$_pkgname-git"
pkgver=r10.ebd28c3
pkgrel=1
url="https://git.missingno.dev/$_pkgname"
pkgdesc='Convert vanilla HTML file(s) to a Atom feed'
arch=(
	'x86_64' 
	'i686'
	'aarch64'
)
makedepends=('cargo' 'git')
license=('GPL-3.0')
source=("$_pkgname::git+$url")
conflicts=("$_pkgname")
provides=("$_pkgname")
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
	install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm755 ./target/release/html2atom -t "$pkgdir/usr/bin/"
}

