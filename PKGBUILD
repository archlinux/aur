# Maintainer: Slavi Pantaleev <slavi@devture.com>
#
# Upstream location: https://github.com/etkecc/komai/blob/main/etc/packaging/archlinux/komai/PKGBUILD
# Komai develops this PKGBUILD in-tree. The copy submitted to AUR
# (aur.archlinux.org:komai.git) is kept in sync from the upstream file above.
# Patches are welcome at the upstream repository, not against the AUR copy.
pkgname=komai
pkgver=2026.07.07.1
pkgrel=1
pkgdesc="A fine Matrix chat app you can get to love"
arch=('x86_64')
url="https://github.com/etkecc/komai"
license=('GPL-3.0-or-later')
# LTO interacts badly with the bundled sqlite3 inside libkomai_rust.a
# (matrix-sdk's bundled-sqlite feature compiles sqlite3 into the Rust
# static archive). With -flto, the linker fails to pull sqlite3.o
# when resolving sqlite3_* symbols referenced by other objects in the
# same archive, producing undefined-reference errors. Disable LTO.
options=(!lto)
depends=(
	gst-plugins-bad-libs
	hicolor-icon-theme
	kdsingleapplication
	'org.freedesktop.secrets'
	qt6-base
	qt6-declarative
	qt6-imageformats
	qt6-multimedia
	qt6-svg
	# QtWebEngine hosts the Element Call web bundle (ELEMENT_CALL is ON by
	# default). On Arch this single package provides the libraries, headers,
	# cmake config and the QtWebEngineProcess helper, so it is both a build
	# and runtime dependency. Build with -DELEMENT_CALL=OFF to drop it.
	qt6-webengine
	qtkeychain-qt6
)
makedepends=(
	asciidoctor
	cargo
	cmake
	fontconfig
	git
	python
	qt6-tools
)
optdepends=(
	'kimageformats: Support for additional image formats (AVIF, JXL, HEIC, etc.)'
	'gst-plugins-base-libs: VoIP/Video calls'
	'gst-plugins-good: VoIP/Video calls'
	'gst-plugins-bad: VoIP/Video calls'
	'libnice: VoIP/Video calls'
	'gst-libav: Video messages'
	'gst-plugin-qml6: Video calls support'
	'gst-plugin-pipewire: Screen sharing on Wayland (xdg-desktop-portal)'
)
source=("git+https://github.com/etkecc/komai.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	# Build against the distro Rust toolchain rather than upstream's
	# rustup channel pin. The removal opts out of both surfaces (Komai's
	# CMake glue and rustup's shim auto-install); see README.md for why
	# both matter.
	rm -f "$pkgname/rust-toolchain.toml"
}

build() {
	# Pin to the stable rustup channel for this build. Per Arch's Rust
	# package guidelines, this is the defensive default for AUR users
	# whose rustup default may have been changed (or is absent in
	# sandboxed builders such as `rua`, where the host's ~/.rustup is
	# not visible). Ignored when cargo is provided by Arch's `rust`
	# package (no rustup shim involved).
	export RUSTUP_TOOLCHAIN=stable
	cmake \
		-B build \
		-S "$pkgname" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR='lib' \
		-DBUILD_TESTING=OFF \
		-DMAN=ON \
		-DCPM_USE_LOCAL_PACKAGES=ON \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
