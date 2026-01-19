# Mantainer: Hownioni <honeyhownihoni at gmail dot com>
# Contributor: Previous submitter's and mantainer's name: Bart De Roy <de dot roy dot bart at gmail dot com>
pkgname=pistol-git
pkgver=0.5.3.r23.g6521f9f
pkgrel=1
pkgdesc='General purpose file previewer'
arch=('x86_64')
url="https://github.com/doronbehar/pistol"
license=('MIT')
makedepends=('go' 'git' 'asciidoctor' 'make')
depends=('file')
optdepends=('ranger: file browser to preview files in' 'lf: file browser to preview files in')
source=("$pkgname::git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" build
	make build manpage
}

package() {
	cd "$srcdir/$pkgname"
	make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm755 "$srcdir/pistol-git/pistol" "$pkgdir/usr/bin/pistol"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.adoc
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/man/man1" pistol.1
}
