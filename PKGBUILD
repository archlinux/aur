# Maintainer: Jaeho Cho <jaeho2025@gmail.com>
pkgname=battery-log-git
_pkgname=battery-log
pkgver=0.1.0.r8.ga3e7a3f
pkgrel=1
pkgdesc="What the battery did, and why: a sampler daemon and a desktop dashboard"
arch=('x86_64')
url="https://github.com/jaehho/battery-log"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
makedepends=('git' 'rustup')
optdepends=('power-profiles-daemon: record which power profile each sample was taken under')
provides=('battery-log')
conflicts=('battery-log')
options=('!lto' '!debug')
source=("git+https://github.com/jaehho/battery-log.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	local desc
	if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
		# tagged: v1.2.3-4-gabcdef -> 1.2.3.r4.gabcdef
		printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	# Keep the volatile build path out of the binary (reproducible, no $srcdir leak).
	export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/"
	# The frontend is static and embedded by tauri-build at compile time, so a
	# plain cargo build produces a self-contained binary -- no tauri-cli, no npm.
	cargo build --release --locked --workspace
}

check() {
	cd "$_pkgname"
	cargo test --release --locked -p battery-log-core
}

package() {
	cd "$_pkgname"
	install -Dm755 target/release/battery-log "$pkgdir/usr/bin/battery-log"
	install -Dm755 target/release/battery-logd "$pkgdir/usr/bin/battery-logd"
	install -Dm644 packaging/battery-logd.service \
		"$pkgdir/usr/lib/systemd/user/battery-logd.service"
	install -Dm644 packaging/battery-log.desktop \
		"$pkgdir/usr/share/applications/battery-log.desktop"
	install -Dm644 src-tauri/icons/128x128.png \
		"$pkgdir/usr/share/icons/hicolor/128x128/apps/battery-log.png"
	install -Dm644 src-tauri/icons/32x32.png \
		"$pkgdir/usr/share/icons/hicolor/32x32/apps/battery-log.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
