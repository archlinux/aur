# Maintainer: Mike Boiko <mike@boiko.ca>

pkgname=mani
pkgver=0.32.1
pkgrel=1
pkgdesc='A CLI tool that helps you manage multiple repositories'
arch=('x86_64')
url='https://manicli.com'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!debug')
_commit='342a362ce3353ef23e03ec2041022d931ec49368'
source=("$pkgname::git+https://github.com/alajmo/mani.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/^v//'
}

build() {
	cd "$pkgname"
	# set Go flags
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"

	# run make build
	make build
}

package() {
	cd "$pkgname"

	# Install the binary
	install -vDm755 -t "$pkgdir/usr/bin" dist/mani

	# Install documentation
	install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

	# Install license
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

	# Install and compress the man page
	install -vDm644 "core/mani.1" "$pkgdir/usr/share/man/man1/mani.1"
	gzip "$pkgdir/usr/share/man/man1/mani.1"
}
