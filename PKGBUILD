# Maintainer: Andrej Radović <r.andrej@gmail.com>

_pkgauthor=ambientsound
_upstream_pkgname=pms
pkgname=pms-git
pkgver=r980.628d497
pkgrel=1
pkgdesc='Practical Music Search is an interactive Vim-like console client for the Music Player Daemon.'
arch=('x86_64')
makedepends=(
	'go'
	'git'
)
license=('MIT')
url="https://github.com/$_pkgauthor/$_upstream_pkgname"
source=("$_upstream_pkgname::git+https://github.com/$_pkgauthor/$_upstream_pkgname.git")
sha256sums=('SKIP')

prepare() {
	export GOPATH="${srcdir}/gopath"

	cd "$_upstream_pkgname"
	sed -i 's|go install -ldflags="-X main.buildVersion=${VERSION}"|CGO_ENABLED=0 \0|' Makefile
}

pkgver() {
	cd "$_upstream_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_upstream_pkgname"
	make pms
}

package() {
	install -Dm755 "$_upstream_pkgname/build/$_upstream_pkgname" "$pkgdir/usr/bin/$_upstream_pkgname"
	install -Dm644 "$_upstream_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_upstream_pkgname/LICENSE"
}
