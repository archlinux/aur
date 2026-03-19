# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ntsc-rs
pkgver=0.9.4
pkgrel=1
pkgdesc="Free, open-source VHS effect. Standalone application."
arch=('x86_64')
url="https://github.com/ntsc-rs/ntsc-rs"
license=('Apache-2.0 AND ISC AND MIT')
depends=('glibc' 'gst-plugins-base-libs' 'libwebp' 'glib2' 'libgcc' 'gstreamer' 'hicolor-icon-theme')
makedepends=('cargo' 'git' 'gendesk')
provides=("${pkgname}-gui")
conflicts=("${pkgname}-gui")
source=("git+$url.git#tag=v${pkgver}"
	"git+https://github.com/AcademySoftwareFoundation/openfx.git")
sha256sums=('48337ccbe5616d858c11431ac8fff85fce1bac7a9e5371f4fc1fbbec591615b2'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	git submodule init
	git config submodule.crates/openfx-plugin/vendor/openfx.url "$srcdir/openfx"
	git -c protocol.file.allow=always submodule update
	
	cd "$srcdir"
	gendesk -n -f \
	--pkgname=${pkgname} \
	--pkgdesc="${pkgdesc}" \
	--name=${pkgname} \
	--icon=${pkgname} \
	--exec=${pkgname}-standalone
}

build() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname/target/release"
	install -Dm755 {ntsc-rs-cli,ntsc-rs-standalone} -t "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/$pkgname"/LICENSE-{APACHE-2.0,ISC,MIT} -t "$pkgdir/usr/share/licenses/${pkgname}"
	install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "$srcdir/${pkgname}/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
	install -Dm644 "$srcdir/${pkgname}/assets/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
