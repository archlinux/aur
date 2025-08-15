# Maintainer: Guillaume Clément <gclement@baobob.org>
pkgname='mqtt-system-monitor-rs'
pkgver=1.2.0
pkgrel=2
pkgdesc="MQTT System Monitor"
arch=('x86_64')
url="https://github.com/guillaumecl/mqtt-system-monitor"
groups=()

_build_dir="mqtt-system-monitor-${pkgver}"

makedepends=('cargo')
checkdepends=()
optdepends=()
depends=('gcc-libs' 'glibc')
backup=(etc/mqtt-system-monitor.conf)
options=(!debug !lto)
install=mqtt-system-monitor.install
changelog=
source=(${pkgname}-${pkgver}.tar.gz::"$url/archive/refs/tags/v${pkgver}.zip")
noextract=()
sha256sums=('af2d1c27a36a292df99a717de56d7109da2ce1d71fec8e00928ed95b24fbca18')
license=(MIT)

prepare() {
	cd "${_build_dir}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${_build_dir}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "${_build_dir}"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/mqtt-system-monitor"
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "conf/mqtt-system-monitor.service"
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" "conf/mqtt-system-monitor.service"
	install -Dm0755 -t "$pkgdir/etc/" "conf/mqtt-system-monitor.conf"
	install -Dm0755 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/${license}.txt"
}

check() {
	cd "${_build_dir}"

 	export RUSTUP_TOOLCHAIN=stable
	cargo clippy --frozen
	cargo test --frozen --all-features
}
