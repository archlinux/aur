pkgname='kct-git'
_pkgname='kct'
pkgver=0.2.0.23.g703878d
pkgrel=2
arch=('any')
url='https://github.com/kseat/kct'
pkgdesc='A Kubernetes Configuration Tool'
license=('MIT')
makedepends=('git' 'rust' 'cargo')
provides=('kct')
conflicts=('kct')
source=("$_pkgname::git+https://github.com/kseat/kct.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname/bin
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
	cd "$_pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release --locked
}

check(){
	cd "$_pkgname"
	env CARGO_INCREMENTAL=0 cargo test --release
}

package() {
	cd "$_pkgname"

	install -Dm755 'target/release/kct' "$pkgdir/usr/bin/kct"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
