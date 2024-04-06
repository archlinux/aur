# Maintainer: Hei Piao <heipiao233 at outlook dot com>

pkgname=krunner-cratesio
pkgver=0.1.0
pkgrel=1
pkgdesc="A plugin for krunner that allows you search crates.io"
depends=('gcc-libs' 'glibc' 'kconfig' 'kcoreaddons' 'ki18n' 'kitemmodels' 'qt6-base')
makedepends=('rust' 'cargo')
arch=('x86_64')
license=(MIT)
url='https://github.com/heipiao233/krunner-cratesio'
_sha=8088e4f1e3008ef19855879d4daa8d53a8d66274
_archive="$pkgname-$_sha"
source=($_archive.tar.gz::$url/archive/$_sha.tar.gz)
sha256sums=('ddb7fcd56c6a22d210070f080cad7a6d83ea2e70a05b1525284dfcf372900a11')
install=.INSTALL

prepare() {
	cd "$_archive"
	# Upstream lockfile is buggered in v0.1.1
	cargo update
	cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
    cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $_archive

    install -Dm0755 -d $pkgdir/usr/share/icons/hicolor/22x22/apps
    install -Dm0755 -d $pkgdir/usr/share/krunner/dbusplugins
    install -Dm0755 -d $pkgdir/usr/share/dbus-1/services
    install -Dm0755 -d $pkgdir/usr/share/licenses/$pkgname

    install -Dm0755 icons/* $pkgdir/usr/share/icons/hicolor/22x22/apps/
    install -Dm0755 $pkgname.desktop $pkgdir/usr/share/krunner/dbusplugins/
    sed "s|@BINPATH@|/usr/bin/$pkgname|" net.heipiao.$pkgname.service.in > net.heipiao.$pkgname.service
    install -Dm0755 net.heipiao.$pkgname.service $pkgdir/usr/share/dbus-1/services/net.heipiao.$pkgname.service
    install -Dm0755 LICENSE $pkgdir/usr/share/licenses/$pkgname

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
