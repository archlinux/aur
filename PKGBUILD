# Maintainer: Bruno Felipe Leal Delfino <bruno.delfino1995@gmail.com>

pkgname='kct-git'
pkgver=0.3.1.34.gb52cd91
pkgrel=1
arch=('x86_64')
url='https://github.com/kseat/kct'
pkgdesc='A Kubernetes Configuration Tool'
license=('MIT')
makedepends=('git' 'rust' 'cargo')
depends=('gcc-libs')
provides=('kct')
conflicts=('kct' 'kct-bin')
source=("$pkgname::git+https://github.com/kseat/kct.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname/bin
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
	cd "$pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release --locked
}

check(){
	cd "$pkgname"
	env CARGO_INCREMENTAL=0 cargo test --release
}

package() {
	cd "$pkgname"

	install -Dm755 'target/release/kct' "$pkgdir/usr/bin/kct"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
