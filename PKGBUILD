
# Maintainer: Pierre-Luc Rigaux 
# Contributor: Pierre-Luc Rigaux 
pkgname=sysd-manager
pkgver=2.10.6
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
_commit=6cecf460ed6901f22650eb477fd0f99a411d3719
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plrigaux/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('789e2f7160e8aa6a10ed3a63a2503efaca94e8939ca0410c59bae907bdc43329')
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
	pwd
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
	install -vDm755 "./target/release/sysd-manager-proxy" -t "$pkgdir/usr/bin"
	echo -e Executing Install srcipt
	#/usr/bin/sysd-manager-proxy install

	install -vDm644 "./sysd-manager-proxy/data/io.github.plrigaux.SysDManager.conf" -T  "$pkgdir/usr/share/dbus-1/system.d/io.github.plrigaux.SysDManager.conf"
	sed -i -e s/{BUS_NAME}/io.github.plrigaux.SysDManager/ -e s/{DESTINATION}/io.github.plrigaux.SysDManager/ -e s/{ENVIRONMENT}// -e s/{INTERFACE}/io.github.plrigaux.SysDManager/ "$pkgdir/usr/share/dbus-1/system.d/io.github.plrigaux.SysDManager.conf"
	install -vDm644 "./sysd-manager-proxy/data/io.github.plrigaux.SysDManager.policy" -t "$pkgdir/usr/share/polkit-1/actions"
	install -vDm644 "./sysd-manager-proxy/data/sysd-manager-proxy.service" -T "$pkgdir/usr/lib/systemd/system/sysd-manager-proxy.service"
	sed -i -e s/{BUS_NAME}/io.github.plrigaux.SysDManager/ -e s/{DESTINATION}/io.github.plrigaux.SysDManager/ -e s/{ENVIRONMENT}// -e s/{EXECUTABLE}/\\/usr\\/bin\\/sysd-manager-proxy/ -e s/{INTERFACE}/io.github.plrigaux.SysDManager/ -e s/{SERVICE_ID}/sysd-manager-proxy/ "$pkgdir/usr/lib/systemd/system/sysd-manager-proxy.service"
	echo -e Installation of $PROGRAM completed, enjoy.
}
