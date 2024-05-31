# Maintainer: fossdd <fossdd@pwned.life>

pkgname=redlib
pkgver=0.34.0
pkgrel=2
pkgdesc="Private front-end for Reddit"
url='https://github.com/redlib-org/redlib'
license=(AGPL-3.0)
arch=(x86_64)
depends=()
makedepends=(cargo git)
backup=("etc/$pkgname.conf")
options=('!lto')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.zip"
	"make-android-user-agent-patching-unconditional.patch::https://github.com/redlib-org/redlib/commit/bd47c206a1d94c8382570b69730d72562d777454.patch"
)
sha256sums=('fa028cc346ec185e1be5259ab8b042db7b5cd7604eeeaf18cb747a15faf49eb7'
            '7dd9d9873b6f9e7fa21a16fdbcb5fa03ca87efab1f0fbc835a0b5f048a6a7721')

prepare() {
	cd $pkgname-$pkgver
	patch --forward --strip=1 --input=$srcdir/make-android-user-agent-patching-unconditional.patch
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 "contrib/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "contrib/$pkgname.conf" -t "$pkgdir/etc/"
}
