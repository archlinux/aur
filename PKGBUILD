_pkgname=cargo-clippy
pkgname=$_pkgname-git
pkgver=r18.c3f6ba5
pkgrel=2
pkgdesc="A cargo subcommand that runs the clippy linter"
url="https://github.com/arcnmx/cargo-clippy"
depends=('cargo')
provides=($_pkgname)
arch=('i686' 'x86_64')
license=('MIT')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	
	if hash multirust 2>/dev/null; then
		multirust run nightly cargo build --release
	else
		cargo build --release
	fi
}

package() {
	cd "$srcdir/$_pkgname/target/release"
	
	install -Dm755 "$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname"
	install -d "$pkgdir/usr/lib/$_pkgname/deps"
	install -m644 "deps/libclippy-"*.so "$pkgdir/usr/lib/$_pkgname/deps"
	install -d "$pkgdir/usr/bin"
	ln -s "/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
