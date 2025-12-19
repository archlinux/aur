
# Maintainer: Pierre-Luc Rigaux 
# Contributor: Pierre-Luc Rigaux 
pkgname=sysd-manager
pkgver=2.10.1
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
_commit=d731bf17ffcab6100c82de12b32e363c1e6298e3
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plrigaux/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('7c4a7be0f17d5d56ff2931a6dc792f9072a86c99aa171a23b24cca414dbcc75d')
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

	cargo build --locked --release --features default --manifest-path ./sysd-manager-proxy/Cargo.toml
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
	install -vDm755 "./target/release/sysd-manager" -t "$pkgdir/usr/bin"
	install -vDm644 "./data/icons/hicolor/scalable/apps/io.github.plrigaux.sysd-manager.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -vDm644 "./data/schemas/io.github.plrigaux.sysd-manager.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas"
	install -vDm644 "./target/loc/io.github.plrigaux.sysd-manager.desktop" -t "$pkgdir/usr/share/applications"
	install -vDm644 "./target/loc/io.github.plrigaux.sysd-manager.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
	
	cp -vr "./target/locale" "$pkgdir/usr/share/" 

	PROGRAM="${BBCYAN}SysD Manager${NC}"
	echo -e Installing $PROGRAM Proxy  

	sudo install -vDm755 "./target/release/sysd-manager-proxy" -t "$pkgdir/usr/bin"
	echo -e Executing Install srcipt
	/usr/bin/sysd-manager-proxy install

	echo -e Installation of $PROGRAM completed, enjoy.
}
