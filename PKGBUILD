# Maintainer: Clover Yan <i at cloveryan dot com>

_pkgname=rune-player
pkgname=$_pkgname-git
pkgver=2.0.0.alpha.16.r1.gc62c1df
pkgrel=1
pkgdesc='The player that blends classic design with modern technology'
arch=('x86_64' 'aarch64')
url='https://github.com/Losses/rune'
# The upstream project is MPL-2.0; some bundled dependencies are MIT/Apache-2.0.
license=('MPL-2.0')
depends=(
	'alsa-lib'
	'at-spi2-core'
	'ayatana-ido'
	'cairo'
	'dbus'
	'fontconfig'
	'gcc-libs'
	'gdk-pixbuf2'
	'glib2'
	'glibc'
	'gtk3'
	'harfbuzz'
	'hicolor-icon-theme'
	'libayatana-appindicator'
	'libayatana-indicator'
	'libdbusmenu-glib'
	'libepoxy'
	'libnotify'
	'openssl'
	'pango'
	'zlib'
)
makedepends=(
	'clang'
	'cmake'
	'fvm'
	'git'
	'lmdb'
	'ninja'
	'patchelf'
	'pkgconf'
	'rustup'
	'unzip'
	'xz'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# Arch enables LTO by default; the mixed Rust/C/C++ toolchain pulled in by
# CargoKit is not tested with it, so keep it disabled. !strip keeps Flutter's
# AOT snapshot intact and !debug avoids a debug package for the prebuilt
# engine.
options=(!lto !strip !debug)

# Flutter SDK version used for the build. pubspec.lock currently requires
# Flutter >= 3.38.0; upstream CI builds with 3.47.4, so pin the same version.
_flutter_version=3.47.4
# rinf_cli has to match the `rinf` crate version in Cargo.lock.
_rinf_version=8.7.1
# Change this to your fork if you want to build your own tree.
_repo='https://github.com/Losses/rune.git'

source=("$_pkgname::git+$_repo")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 \
		| sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
	cd "$_pkgname"

	# fluent_ui declares `uses-material-design: true`; newer Flutter refuses to
	# build a project that disables it.
	sed -i 's/^  uses-material-design: false$/  uses-material-design: true/' pubspec.yaml

	# Newer clang enables -Wunused-but-set-global in -Wall, and upstream builds
	# the Linux runner with -Werror. Drop -Werror instead of patching each new
	# warning.
	sed -i 's/target_compile_options(${TARGET} PRIVATE -Wall -Werror)/target_compile_options(${TARGET} PRIVATE -Wall)/' \
		linux/CMakeLists.txt

	# Arch links with --as-needed, which drops the -lhub dependency because the
	# runner does not reference its symbols directly. rinf looks its @Native
	# symbols up in the process-global scope, so libhub.so has to stay a
	# DT_NEEDED entry of the executable.
	if ! grep -q 'LINKER:--no-as-needed' linux/CMakeLists.txt; then
		sed -i 's|^include(flutter/generated_plugins.cmake)$|include(flutter/generated_plugins.cmake)\n\ntarget_link_options(${BINARY_NAME} PRIVATE "LINKER:--no-as-needed")|' \
			linux/CMakeLists.txt
	fi
	grep -q 'LINKER:--no-as-needed' linux/CMakeLists.txt \
		|| error "Could not patch linux/CMakeLists.txt to keep libhub.so linked"

	# Keep the Flutter SDK download next to the package sources instead of in
	# the user's home directory.
	export FVM_CACHE_PATH="${SRCDEST:-$srcdir}/fvm-cache"

	# CargoKit (used by rinf to compile the Rust code) requires rustup-managed
	# toolchains, so make sure a stable toolchain is present.
	if ! rustup toolchain list | grep -q '^stable'; then
		rustup toolchain install stable --profile minimal
	fi

	# Fetch and pin the Flutter SDK through fvm.
	fvm install "$_flutter_version" --skip-pub-get
	fvm use "$_flutter_version" --force --skip-pub-get

	# rinf_cli is not packaged by Arch; build it into a private install root so
	# it does not pollute the user's Cargo bin directory.
	CARGO_INSTALL_ROOT="$srcdir/cargo-install" \
		cargo install --version "$_rinf_version" rinf_cli
}

build() {
	cd "$_pkgname"

	export FVM_CACHE_PATH="${SRCDEST:-$srcdir}/fvm-cache"
	export PATH="$srcdir/cargo-install/bin:$PATH"
	export RUSTUP_TOOLCHAIN=stable
	# opusic-sys builds Opus through CMake, which inherits CFLAGS but does not
	# enable position-independent code itself. Without -fPIC the static Opus
	# objects cannot be linked into CargoKit's cdylib.
	export CFLAGS="${CFLAGS:-} -fPIC"
	export CXXFLAGS="${CXXFLAGS:-} -fPIC"

	fvm flutter --no-version-check pub get
	# Generates lib/bindings (gitignored) from the Rust message definitions.
	rinf gen
	fvm flutter --no-version-check build linux --release --no-pub
}

package() {
	cd "$_pkgname"

	case "$CARCH" in
		x86_64) _flutter_arch=x64 ;;
		aarch64) _flutter_arch=arm64 ;;
		*) error "Unsupported architecture: $CARCH" ;;
	esac

	local bundle="build/linux/$_flutter_arch/release/bundle"

	# The bundle has to keep its layout because the executable locates
	# lib/ and data/ relative to /proc/self/exe.
	install -d "$pkgdir/usr/lib/rune"
	cp -a "$bundle/." "$pkgdir/usr/lib/rune/"

	# Some Flutter plugins are linked with a RUNPATH pointing at the build
	# directory. Point it at the bundle itself (also avoids an "insecure
	# RUNPATH" warning).
	local lib
	for lib in "$pkgdir/usr/lib/rune/lib"/*.so; do
		[[ -z $(patchelf --print-rpath "$lib") ]] && continue
		[[ $(patchelf --print-rpath "$lib") == '$ORIGIN' ]] && continue
		patchelf --set-rpath '$ORIGIN' "$lib"
	done

	install -d "$pkgdir/usr/bin"
	ln -s /usr/lib/rune/rune "$pkgdir/usr/bin/rune"

	install -Dm644 assets/source/linux/rune.desktop \
		"$pkgdir/usr/share/applications/rune.desktop"
	install -Dm644 assets/source/linux/rune.metainfo.xml \
		"$pkgdir/usr/share/metainfo/rune.metainfo.xml"

	local size
	for size in 16 22 24 28 32 36 48 64 72 96 128 192 256 480 512 1024; do
		install -Dm644 "assets/icons/Papirus/${size}x${size}/apps/rune.png" \
			"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/rune.png"
	done

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
