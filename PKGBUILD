# Maintainer: Martin Rys <https://rys.rs/contact>
# Maintainer: Taiko2k <captain dot gxj at gmail dot com>

pkgname=tauon-music-box-git
_pkgname=tauonmb
_gitname=Tauon
pkgver=10.0.1.r43.8a349863
pkgrel=1
pkgdesc="A modern music player"
arch=("x86_64" "aarch64")
url="https://tauonmusicbox.rocks"
license=("GPL-3.0-or-later")
conflicts=("${pkgname%-git}")
depends=(
	"python-pillow"
	"python-pylast"
	"python-pysdl3"
	"python-send2trash"
	"python-musicbrainzngs"
	"python-mutagen"
	"python-unidecode"
	"python-setproctitle"
	"python-gobject"
	"python-cairo"
	"python-beautifulsoup4"
	"python-rapidfuzz"
	"python-requests"
	"python-dbus"
	"python-natsort"
	"python-websocket-client"
	"kissfft"
	"libnotify"
	"ffmpeg"
	"flac"
	"noto-fonts-extra"
	"noto-fonts"
	"xdg-utils"
	"mpg123"
	"opusfile"
	"wavpack"
	"libvorbis"
	"libayatana-appindicator"
	"libopenmpt"
	"libprojectm"
	"libsamplerate"
	"opencc"
	"libgme"
	"libpipewire"
	"sdl3_image"
)

makedepends=(
	"cargo"
	"git"
	"miniaudio"
	"pkgconf"
	"python-build"
	"python-installer")

optdepends=(
	"noto-fonts-cjk: Matching font for CJK characters"
	"picard: Recommended tag editor"
	"p7zip: 7z archive extraction support"
	"unrar: RAR archive extraction support"
	"python-plexapi: Plex streaming support"
	"python-pypresence: Discord status support"
	"python-pychromecast: Chromecast stream support"
	"python-jxlpy: JPEG XL image support"
	"python-tidalapi: Tidal feature support"
)

source=("${pkgname%-git}"::'git+https://github.com/Taiko2k/Tauon.git')

sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long --exclude "Pre-release*" | sed -e 's/\([^-]*-\)g/r\1/;s/-/./g' -e 's/^v//')"
}

prepare() {
	# Use system kissfft instead of the expected cloned repository
	cd "${pkgname%-git}"
	sed -i 's|"src/phazor/kissfft/kiss_fftr.c", "src/phazor/kissfft/kiss_fft.c", ||g' pyproject.toml
	sed -i 's|"samplerate"|"kissfft-float", "samplerate"|g' pyproject.toml

	cd src/lrclib-solver
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "${pkgname%-git}"
	python -m build --wheel

	# Tiny Rust binary that calculates LRCLIB challenges
	cd src/lrclib-solver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# LTO disabled due to https://github.com/briansmith/ring/issues/1444
	CFLAGS="$CFLAGS -fno-lto" cargo build --frozen --release --all-features
}

package() {
	cd "${pkgname%-git}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	for dir in src/tauon/locale/*; do
		install -Dm644 \
			"${dir}/LC_MESSAGES/"*.mo \
			-t "${pkgdir}/usr/share/locale/$(basename "${dir}")/LC_MESSAGES"
	done

	install -Dm644 "extra/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "extra/${_pkgname}-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
	install -Dm644 "extra/${_pkgname}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -Dm755 "extra/tauonmb.sh" "${pkgdir}/opt/${pkgname%-git}/tauonmb.sh"
	install -Dm755 "extra/tauonmb.sh" "${pkgdir}/usr/bin/tauon"

	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	install -Dm755 "src/lrclib-solver/target/release/lrclib-solver" "${pkgdir}${site_packages}/tauon/lrclib-solver"
}
