# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='spacedrive-git'
pkgver=r4800.4d87617
pkgrel=1
pkgdesc='Spacedrive is an open source cross-platform file explorer, powered by a virtual distributed filesystem written in Rust.'
arch=('x86_64')
url='https://spacedrive.com/'
license=('AGPL3')
source=('spacedrive::git+https://github.com/spacedriveapp/spacedrive.git')
depends=('ffmpeg' 'libheif' 'gtk3' 'webkit2gtk-4.1' 'pango' 'gdk-pixbuf2' 'cairo' 'libsoup' 'glib2' 'xdotool')
conflicts=('spacedrive')
makedepends=('cargo' 'bun' 'git' 'clang' 'mold')
sha256sums=('SKIP')
options=(!lto)

pkgver() {
	cd "${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${pkgname%-git}"

	cargo fetch --locked --target $(rustc --print host-tuple)
	bun install
}

build() {
	cd "${pkgname%-git}"

	export CARGO_TARGET_DIR=target
	export RUSTFLAGS+=' -Clinker=clang -Clink-arg=-fuse-ld=mold'
	export CC=clang
	export LDFLAGS+=' -fuse-ld=mold'

	cargo build --release --package sd-core --bin sd-daemon --no-default-features
	(cd apps/tauri && bunx tauri build --no-bundle -- --no-default-features)
}

package() {
	cd "${pkgname%-git}"

	install -Dm0755 "apps/tauri/src-tauri/target/release/Spacedrive" "${pkgdir}/usr/bin/spacedrive"
	install -Dm0755 -t "${pkgdir}/usr/bin/" target/release/sd-daemon
	install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
