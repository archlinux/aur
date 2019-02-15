# Maintainer: Aston <astonbitecode at gmail dot com>

pkgname="rust-keylock-ui"
pkgver="0.8.1"
pkgrel=1
epoch=
pkgdesc="Password manager with goals to be Secure, Simple to use, Portable and Extensible"
arch=("x86_64")
url="https://rust-keylock.github.io/"
license=("GPL")
groups=()
depends=("openssl" "java-runtime>=8" "libxfixes" "libxrender")
makedepends=("gendesk" "rust" "maven" "libxcb" "python")
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
sha512sums=("153e2d5af3858f9ee8e69ce245f4234eb233f4266b70936c465eca6d92bc914fc3e1d657eeff827e4759b3c047ffcf3bce3f32ceef575436281444f9fcb9b093")
validpgpkeys=()

prepare() {
	gendesk -f -n --pkgname="$pkgname" --pkgdesc="$pkgdesc" --terminal=false --name="$pkgname"
}

build() {
	cd $srcdir/$pkgname-$pkgver
	mvn install -f scala/pom.xml
	cargo build --release --manifest-path=rust/Cargo.toml
}

package() {
	mkdir -p $pkgdir{/usr/bin,/usr/share/licenses/$pkgname,/opt/$pkgname/deps}
	cd $srcdir/$pkgname-$pkgver

	install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
	
	cp $srcdir/$pkgname-$pkgver/rust/target/release/rust-keylock-ui $pkgdir/opt/$pkgname/
	cp $srcdir/$pkgname-$pkgver/rust/target/release/rust-keylock-ui-app $pkgdir/opt/$pkgname/
	cp $srcdir/$pkgname-$pkgver/rust/target/release/deps/libj4rs-*.so $pkgdir/opt/$pkgname/deps/
	cp -R $srcdir/$pkgname-$pkgver/rust/target/release/jassets $pkgdir/opt/$pkgname/
	cp -R $srcdir/$pkgname-$pkgver/rust/target/release/scalaassets $pkgdir/opt/$pkgname/
	
	ln -s /opt/$pkgname/rust-keylock-ui $pkgdir/usr/bin/rust-keylock-ui
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname-$pkgver/scala/src/main/resources/images/rkl.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
