
# Maintainer: Pierre-Luc Rigaux 
pkgname=sysd-manager
pkgver=1.13.2
pkgrel=1
epoch=
pkgdesc="A systemd GUI to manage your Services, Timers, Sockets and other units. You can enable, disable, stop and start them. Also, you can view their config file and peak at their journal logs."
arch=('x86_64' 'aarch64')
url="https://github.com/plrigaux/sysd-manager"
license=('GPLv3+')
groups=()
depends=("gtk4" "libadwaita" "systemd-libs")
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
_commit=df06bcc623482930a534e4789e69a8e85db7c0c8
source=("git+https://github.com/plrigaux/sysd-manager.git#commit=$_commit")
noextract=()
sha256sums=('34c8edf808dbd2e2072fa0176ae09d3023d0bdae03c9de46dd72a49760396ca3')
validpgpkeys=()

prepare() {
	cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname
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
	install -Dm755 "$pkgname/target/release/sysd-manager" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname/data/applications/io.github.plrigaux.sysd-manager.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$pkgname/data/icons/hicolor/scalable/apps/io.github.plrigaux.sysd-manager.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "$pkgname/data/schemas/io.github.plrigaux.sysd-manager.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas"
	install -Dm644 "$pkgname/data/metainfo/io.github.plrigaux.sysd-manager.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
}
