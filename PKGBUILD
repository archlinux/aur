
# Maintainer: Pierre-Luc Rigaux 
pkgname=sysd-manager
pkgver=1.30.4
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
_commit=9f58c4264df7ae6f15f7bc8a4e35f865556a29c2
source=("https://github.com/plrigaux/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('3bf887df73ea163136dfe447d15a129b93a284ddb5e0510f5cfdbf9016a34c15')
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
	install -Dm755 "$_pkgsrcdir/target/release/sysd-manager" -t "$pkgdir/usr/bin"
	install -Dm644 "$_pkgsrcdir/data/applications/io.github.plrigaux.sysd-manager.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$_pkgsrcdir/data/icons/hicolor/scalable/apps/io.github.plrigaux.sysd-manager.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "$_pkgsrcdir/data/schemas/io.github.plrigaux.sysd-manager.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas"
	install -Dm644 "$_pkgsrcdir/data/metainfo/io.github.plrigaux.sysd-manager.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
	cp -r "$_pkgsrcdir/target/locale" "$pkgdir/usr/share/" 
}
