# Maintainer: Snowy-Fluffy <snowy.lnnk@gmail.com>

# prevent excessive memory usage
export DEBUG_CFLAGS="-g1"
export DEBUG_CXXFLAGS="-g1"

: ${_branch:=main}
: ${_commit=}

_pkgname=exdesktop
pkgname="$_pkgname-git"
pkgver=7.4.3.1.r4.g048bba9
pkgrel=1
pkgdesc='Unofficial Telegram Desktop fork with exteraGram features, channel feed and Python plugins (git version)'
arch=('x86_64')
url='https://github.com/metawka/exDesktop'
license=('GPL-3.0-or-later WITH OpenSSL-exception')
depends=(
	'abseil-cpp'
	'ada'
	'cairo'
	'ffmpeg'
	'fontconfig'
	'glib2'
	'glibc'
	'hicolor-icon-theme'
	'hunspell'
	'kcoreaddons'
	'libavif'
	'libfido2'
	'libgcc'
	'libheif'
	'libjpeg-turbo'
	'libjxl'
	'libpipewire'
	'libsrtp'
	'libstdc++'
	'libvpx'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxkbcommon'
	'libxrandr'
	'libxtst'
	'lz4'
	'minizip'
	'openal'
	'openh264'
	'openssl'
	'opus'
	'pango'
	'pipewire'
	'python'
	'qt6-base'
	'qt6-declarative'
	'qt6-imageformats'
	'qt6-svg'
	'qt6-wayland'
	'rnnoise'
	'tlottie'
	'xxhash'
	'zlib'
)
makedepends=(
	'boost'
	'boost-libs'
	'cargo'
	'cmake'
	'git'
	'glib2-devel'
	'gobject-introspection'
	'gperf'
	'just'
	'libtg_owt'
	'microsoft-gsl'
	'ninja'
	'qt6-shadertools'
	'range-v3'
	'tl-expected'
	'vulkan-headers'
)
optdepends=(
	'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1 (gtk3)'
	'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (gtk4)'
	'xdg-desktop-portal: desktop integration'
)
provides=("$_pkgname=${pkgver%%.r*}")
# Ships the same org.telegram.desktop files and /usr/bin/Telegram as these.
conflicts=("$_pkgname" "$_pkgname-bin" 'telegram-desktop')
options=('!lto')

_pkgsrc=exDesktop
_pkgsrc_td=telegram-tdlib
_pkgsrc_we=wallet-engine
# The commit of tdlib with the tde2e library that the project builds against,
# see Telegram/build/docker/centos_env/Dockerfile.
_td_commit=51743dfd01dff6179e2d8f7095729caa4e2222e9
# The wallet-engine commit and the desktop-app/patches commit that carries
# its patch, both pinned the same way in that Dockerfile.
_we_commit=e59e0d89d7ee90c388bf36e3334c5b276f396697
_patches_commit=a895fef40eaa7d66481cff542c623b039b7ce494

source=(
	"$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}${_commit:-${_branch:+#branch=$_branch}}"
	"$_pkgsrc_td"::"git+https://github.com/tdlib/td.git#commit=$_td_commit"
	"$_pkgsrc_we"::"git+https://github.com/i582/wallet-engine.git#commit=$_we_commit"
	"wallet-engine-$_patches_commit.patch::https://github.com/desktop-app/patches/raw/$_patches_commit/wallet-engine.patch"
)
sha256sums=('SKIP'
            '142098b7cb73193e14c5b37b014ee8f95e92ceceb4558cf5a89b7f8292d8b0c9'
            'b930f701b1ab75075f3239b8bcdd3896eaa560f22e98d878bc0d5c846e8e895c'
            'b40aba82c39a42d0526a85ecfa40d613baa57b1a2d6600e601a42a1576b3b822')

prepare() {
	# tdesktop requires a massive patch against wallet-engine.
	cd "$_pkgsrc_we"
	patch -Np1 -i "$srcdir/wallet-engine-$_patches_commit.patch"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
	cd ..

	cd "$_pkgsrc"

	# These come from the system packages.
	local lib
	for lib in GSL expected hunspell kcoreaddons libfido2 lz4 range-v3 xxHash; do
		git submodule deinit -f "Telegram/ThirdParty/$lib" 2>/dev/null || true
		git config "submodule.Telegram/ThirdParty/$lib.update" none
	done
	git submodule update --init --recursive --depth=1
}

pkgver() {
	cd "$_pkgsrc"
	git describe --long --tags --match 'v[0-9]*' \
		| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	# Build wallet-engine
	pushd "$_pkgsrc_we"
	just build
	just bindings-cpp
	install -Dm644 target/release/libwallet_engine.a -t "$srcdir/deps/lib/"
	install -Dm644 bindings/cpp-experimental/* -t "$srcdir/deps/include/wallet_engine/"
	popd

	# Build tde2e
	cmake -S "$_pkgsrc_td" -B build_tde2e \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DTD_E2E_ONLY=ON \
		-DBUILD_SHARED_LIBS=OFF \
		-DBUILD_TESTING=OFF \
		-Wno-dev
	cmake --build build_tde2e
	DESTDIR="$srcdir/deps" cmake --install build_tde2e

	# The official API key that Telegram uses for its snap builds, the same one
	# the telegram-desktop package in the official repositories uses:
	# https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
	cmake -S "$_pkgsrc" -B build \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_PREFIX_PATH="$srcdir/deps/usr;$srcdir/deps" \
		-Dtde2e_DIR="$srcdir/deps/usr/lib/cmake/tde2e" \
		-DDESKTOP_APP_DISABLE_AUTOUPDATE=ON \
		-DDESKTOP_APP_DISABLE_CRASH_REPORTS=ON \
		-DTDESKTOP_API_ID=611335 \
		-DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	# The Python plugin engine looks for its host scripts here.
	install -d "$pkgdir/usr/share/exDesktop/python/extera"
	cp -r --no-preserve=ownership "$_pkgsrc/Telegram/SourceFiles/extera/python/." \
		"$pkgdir/usr/share/exDesktop/python/extera/"
	find "$pkgdir/usr/share/exDesktop" -name __pycache__ -type d -prune -exec rm -rf {} +

	install -Dm644 "$_pkgsrc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
