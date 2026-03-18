# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ntsc-rs-git
pkgver=0.9.3.r94.gbddab2d
pkgrel=1
pkgdesc="Free, open-source VHS effect. Standalone application."
arch=('x86_64')
url="https://github.com/ntsc-rs/ntsc-rs"
license=('Apache-2.0 AND ISC AND MIT')
depends=('glibc' 'gst-plugins-base-libs' 'libwebp' 'glib2' 'libgcc' 'gstreamer' 'hicolor-icon-theme' 'openssl')
makedepends=('cargo' 'git' 'gendesk')
provides=("${pkgname::-4}-gui" "${pkgname::-4}")
conflicts=("${pkgname::-4}-gui" "${pkgname::-4}")
source=("git+$url.git"
	"git+https://github.com/AcademySoftwareFoundation/openfx.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/${pkgname::-4}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
	cd "$srcdir/${pkgname::-4}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	git submodule init
	git config submodule.crates/openfx-plugin/vendor/openfx.url "$srcdir/openfx"
	git -c protocol.file.allow=always submodule update
	
	cd "$srcdir"
	gendesk -n -f \
	--pkgname=${pkgname::-4} \
	--pkgdesc="${pkgdesc}" \
	--name=${pkgname::-4} \
	--icon=${pkgname::-4} \
	--exec=${pkgname::-4}-standalone
}

build() {
	cd "$srcdir/${pkgname::-4}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${pkgname::-4}/target/release"
	install -Dm755 {ntsc-rs-cli,ntsc-rs-standalone} -t "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/${pkgname::-4}"/LICENSE-{APACHE-2.0,ISC,MIT} -t "$pkgdir/usr/share/licenses/${pkgname}"
	install -Dm644 "$srcdir/${pkgname::-4}.desktop" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
	install -Dm644 "$srcdir/${pkgname::-4}/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname::-4}.png"
	install -Dm644 "$srcdir/${pkgname::-4}/assets/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname::-4}.svg"
}
