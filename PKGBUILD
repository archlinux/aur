
# Maintainer: Pierre-Luc Rigaux 
# Contributor: Pierre-Luc Rigaux 
pkgname=sysd-manager
pkgver=2.9.2
pkgrel=1
pkgdesc="A systemd GUI to manage service, timer, socket and other units."
arch=("x86_64" "aarch64")
url="https://github.com/plrigaux/sysd-manager"
license=("GPL-3.0-or-later")
groups=()
depends=("gtk4" "libadwaita" "systemd-libs" "gtksourceview5" "gettext")
makedepends=("cargo" "git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=CHANGELOG.md
_commit=e232a4d2d3997f1a65359d4778dfc43f11e58b8c
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plrigaux/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('c1e1f1eda7b7f9922778c97ddb01929639c9cc9f0cd2f82f99b85271e5ae1836')
validpgpkeys=()
_pkgsrcdir=$pkgname-$pkgver

prepare() {
	cd $_pkgsrcdir
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $_pkgsrcdir
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --locked --release --features default
}

#check() {
#	cd $pkgname
#	export RUSTUP_TOOLCHAIN=stable
#	cargo test --frozen --features default
#}

package() {
	cd $_pkgsrcdir
	echo Generating translation files
	echo ""
	cargo run -p transtools -- packfiles
	echo ""
	install -Dm755 "./target/release/sysd-manager" -t "$pkgdir/usr/bin"
	install -Dm644 "./data/icons/hicolor/scalable/apps/io.github.plrigaux.sysd-manager.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "./data/schemas/io.github.plrigaux.sysd-manager.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas"
	install -Dm644 "./target/loc/io.github.plrigaux.sysd-manager.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "./target/loc/io.github.plrigaux.sysd-manager.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
	cp -r          "./target/locale" "$pkgdir/usr/share/" 
}
