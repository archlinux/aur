# Maintainer: Aston <astonbitecode at gmail dot com>

pkgname="rust-keylock-ui"
pkgver="0.18.2"
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
options=('!lto')
install=
changelog=
source=("https://github.com/rust-keylock/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=("41cf2129a98346045a53dbf8ecd19b17fbbfd0495439df7f4382ba3cd1303624cee769811d926a90614b95ea3731a32a2763b94278d5d9527a8ac2c89d586400")
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
