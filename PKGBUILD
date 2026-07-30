# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=visage
pkgname="$_pkgbase"
pkgver=0.3.6
pkgrel=1
pkgdesc='Linux face authentication via PAM with persistent daemon, IR camera support, ONNX inference'
arch=('x86_64')
url='https://sovren.software/#/visage'
license=('MIT')
makedepends=('git' 'cargo' 'clang')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install='setup.install'
options=(!lto)
source=("$_pkgbase::git+https://github.com/sovren-software/visage.git#tag=v${pkgver}")
sha256sums=('370c1370910b92bb379c87fa2566ba8269a79284f2a69b1dd87e5108cdb5c8e1')

prepare() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$_pkgbase"
	install -Dm755 target/release/visaged "$pkgdir/usr/bin/visaged"
	install -Dm755 target/release/visage "$pkgdir/usr/bin/visage"
	install -Dm755 target/release/libpam_visage.so "$pkgdir/usr/lib/security/pam_visage.so"
	install -Dm644 packaging/systemd/visaged.service "$pkgdir/usr/lib/systemd/system/visaged.service"
	install -Dm644 packaging/systemd/visage-resume.service "$pkgdir/usr/lib/systemd/system/visage-resume.service"
	install -Dm644 packaging/dbus/org.freedesktop.Visage1.conf "$pkgdir/usr/share/dbus-1/system.d/org.freedesktop.Visage1.conf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgbase/README.md"
	install -dm700 "$pkgdir/var/lib/visage/models"
}
