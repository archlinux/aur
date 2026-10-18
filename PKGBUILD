# Maintainer: Snowy-Fluffy <snowy.lnnk@gmail.com>

# prevent excessive memory usage
export DEBUG_CFLAGS="-g1"
export DEBUG_CXXFLAGS="-g1"

: ${_branch:=main}
: ${_commit=}

_pkgname=freshgram
pkgname="$_pkgname-git"
pkgver=7.5.5.r85.g26d2291
pkgrel=1
pkgdesc='Telegram Desktop fork with the AyuGram features and a Material look (git version)'
arch=('x86_64')
url='https://github.com/Snowy-Fluffy/freshGram'
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
	'cmake'
	'git'
	'glib2-devel'
	'gobject-introspection'
	'gperf'
	'libtg_owt'
	'microsoft-gsl'
	'ninja'
	'python'
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
conflicts=("$_pkgname" "$_pkgname-bin")
options=('!lto')

_pkgsrc=freshGram
_pkgsrc_td=telegram-tdlib
# The commit of tdlib with the tde2e library that the project builds against,
# see Telegram/build/docker/centos_env/Dockerfile.
_td_commit=51743dfd01dff6179e2d8f7095729caa4e2222e9

source=(
	"$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}${_commit:-${_branch:+#branch=$_branch}}"
	"$_pkgsrc_td"::"git+https://github.com/tdlib/td.git#commit=$_td_commit"
)
sha256sums=('SKIP'
            'SKIP')

prepare() {
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
	printf '%s.r%s.g%s' \
		"$(awk '/^AppVersionStr /{print $2}' Telegram/build/version)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

build() {
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
		-DCMAKE_PREFIX_PATH="$srcdir/deps/usr" \
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
	install -Dm644 "$_pkgsrc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
