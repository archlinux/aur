# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Valentin-Costel Hăloiu <vially.ichb@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=the_platinum_searcher
pkgver=2.1.5
pkgrel=5
pkgdesc='A code search tool similar to ack, the_silver_searcher (ag) and ripgrep (rg).'
arch=('x86_64')
makedepends=('git' 'go')
depends=('glibc')
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
	#git checkout -q v"$pkgver"
	# v2.1.5 + fix to build issue
	git checkout -q c7d8eec66dca50773e6b4ee7dfdad2174860b9b1
	unset GOBIN  # prevent bin to end up elsewhere
	GOPATH="$srcdir" go get -v ...
}

check() {
	GOPATH="$srcdir" go test -v -x github.com/monochromegane/the_platinum_searcher/
}

package() {
	msg 'Installing pt binary...'
	install -Dm 755 "$srcdir/bin/pt" "$pkgdir/usr/bin/pt"

	msg 'Installing README...'
	install -Dm 644 "$_repodir/$pkgname/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"

	msg 'Installing LICENSE...'
	install -m 644 -D "$_repodir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
