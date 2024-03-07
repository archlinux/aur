# Maintainer: Aston <astonbitecode at gmail dot com>

pkgname="rust-keylock-ui"
pkgver="0.15.1"
pkgrel=1
epoch=
pkgdesc="Password manager with goals to be Secure, Simple to use, Portable and Extensible"
arch=("x86_64")
url="https://rust-keylock.github.io/"
license=("GPL")
groups=()
depends=("openssl" "java-runtime>=11" "libxfixes" "libxrender")
makedepends=("gendesk" "java-runtime>=11" "rust" "maven" "libxcb" "python")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/rust-keylock/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=("d4c23d1864c21f06586c30eadaa98f2f504ac6eb251871b0ec1cdb530a0b2eb1a882091faf7dc6ae311d096d49e22b32a656ca5f7a80239a449dcda70079d760")
validpgpkeys=()

prepare() {
	gendesk -f -n --pkgname="$pkgname" --pkgdesc="$pkgdesc" --terminal=false --name="$pkgname"
}

build() {
	cd $srcdir/$pkgname-$pkgver
	mvn install -f java/pom.xml
	cargo build --release --manifest-path=rust/Cargo.toml
}

package() {
	mkdir -p $pkgdir{/usr/bin,/usr/share/licenses/$pkgname,/opt/$pkgname/deps}
	cd $srcdir/$pkgname-$pkgver

	install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
	
	cp $srcdir/$pkgname-$pkgver/rust/target/release/rust-keylock-ui $pkgdir/opt/$pkgname/
	cp $srcdir/$pkgname-$pkgver/rust/target/release/deps/libj4rs-*.so $pkgdir/opt/$pkgname/deps/
	cp -R $srcdir/$pkgname-$pkgver/rust/target/release/jassets $pkgdir/opt/$pkgname/

	ln -s /opt/$pkgname/rust-keylock-ui $pkgdir/usr/bin/rust-keylock-ui
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname-$pkgver/java/src/main/resources/images/rkl.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
