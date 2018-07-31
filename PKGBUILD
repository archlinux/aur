pkgname=ene-git
_pkgname=ene
pkgdesc="An experimental end to end email encryption tool"
pkgrel=1
pkgver=0.1.0.63
arch=('i686' 'x86_64')
conflicts=("ene")
provides=("ene")
url="https://github.com/quininer/ene"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$_pkgname::git+https://github.com/quininer/ene")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	env CARGO_INCREMENTAL=0 RUSTFLAGS="-C target-feature=+ssse3,+avx2,+aes" cargo build --features post-quantum --release
}

package() {
	cd $_pkgname
	install -Dm755 "$srcdir/$_pkgname/target/release/ene" "$pkgdir/usr/bin/ene"
	install -Dm644 "target/release/build/ene-"*/out/_ene "$pkgdir/usr/share/bash-completion/completions/ene"
	install -Dm644 "target/release/build/ene-"*/out/ene.bash "$pkgdir/usr/share/zsh/site-functions/_ene"
	install -Dm644 "target/release/build/ene-"*/out/ene.fish "$pkgdir/usr/share/fish/completions/ene.fish"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
