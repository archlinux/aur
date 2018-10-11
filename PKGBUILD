# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Valentin-Costel Hăloiu <vially.ichb@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=the_platinum_searcher
pkgver=2.2.0
pkgrel=1
pkgdesc='A code search tool similar to ack, the_silver_searcher (ag) and ripgrep (rg).'
arch=('x86_64')
makedepends=('git' 'go' 'godep')
url='https://github.com/monochromegane/the_platinum_searcher'
license=('MIT')
provides=('the_platinum_searcher')
conflicts=('the_platinum_searcher-bin')
source=('git+https://github.com/monochromegane/the_platinum_searcher.git')
sha512sums=('SKIP')

build() {
	export _repodir="$srcdir/src/github.com/monochromegane"
	mkdir -p "$_repodir"
	mv "$srcdir/$pkgname" "$_repodir"
	cd "$_repodir/$pkgname"
	git checkout -q v"$pkgver"
	unset GOBIN  # prevent bin to end up elsewhere
	GOPATH="$srcdir" godep restore
	GOPATH="$srcdir" godep go install -v ./...
}

check() {
	cd "$_repodir/$pkgname"
	GOPATH="$srcdir" godep go test -v -x .
}

package() {
	msg 'Installing pt binary...'
	install -Dm755 "$srcdir/bin/pt"			"$pkgdir/usr/bin/pt"

	msg 'Installing README...'
	install -Dm644 "$_repodir/$pkgname/README.md"	"$pkgdir/usr/share/doc/$pkgname/README.md"

	msg 'Installing LICENSE...'
	install -Dm644 "$_repodir/$pkgname/LICENSE"	"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
