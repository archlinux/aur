
# Maintainer: Pierre-Luc Rigaux 
pkgname=sysd-manager
pkgver=1.32.2
pkgrel=1
epoch=
pkgdesc="A systemd GUI to manage your Services, Timers, Sockets and other units. You can enable, disable, stop and start them. Also, you can view their config file and peak at their journal logs."
arch=('x86_64' 'aarch64')
url="https://github.com/plrigaux/sysd-manager"
license=('GPLv3+')
groups=()
depends=("gtk4" "libadwaita" "systemd-libs" "gtksourceview5" "gettext")
makedepends=(cargo git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=CHANGELOG.md
_commit=f4f9b1c456ac0c17f6aba9b2ca0c35f63d5cd553
source=("https://github.com/plrigaux/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('4374414561f31078913786a4240d7efb9f33b50d1fae1c10b6bd81ae9eb2d6d7')
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
