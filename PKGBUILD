# Maintainer: Martin Rys <https://rys.rs/contact>
# Maintainer: Taiko2k <captain dot gxj at gmail dot com>

pkgname=tauon-music-box-git
_pkgname=tauonmb
_gitname=Tauon
pkgver=8.1.3.r7.8d64bef5
pkgrel=1
pkgdesc='A modern music player'
arch=('x86_64' 'aarch64')
url='https://tauonmusicbox.rocks'
license=('GPL-3.0-or-later')

conflicts=("${pkgname%-git}")
depends=(
	'python-pillow'
	'python-pylast'
	'python-pysdl3' # AUR
	'python-send2trash'
	'python-musicbrainzngs'
	'python-mutagen'
	'python-unidecode'
	'python-setproctitle'
	'python-gobject'
	'python-cairo'
	'python-beautifulsoup4'
	'python-requests'
	'python-dbus'
	'python-natsort'
	'python-websocket-client'
	'libayatana-appindicator'
	'libnotify'
	'ffmpeg'
	'flac'
	'gtk3'
	'kissfft' # AUR, only -git is packaged
	'noto-fonts-extra'
	'noto-fonts'
	'sdl3_image'
	'xdg-utils'
	'mpg123'
	'opusfile'
	'wavpack'
	'libvorbis'
	'libopenmpt'
	'libsamplerate'
	'opencc'
	'libgme'
	'libpipewire'
)

makedepends=(
	'miniaudio' # AUR, only -git is packaged, which happens to be identical to the latest available release as of 2024-11-22 since it's a year old
	'git'
	'pkg-config'
	'python-build'
	'python-installer')

optdepends=(
	'noto-fonts-cjk: Matching font for CJK characters'
	'picard: Recommended tag editor'
	'p7zip: 7z archive extraction support'
	'unrar: RAR archive extraction support'
	'python-plexapi: Plex streaming support'
	'python-lynxpresence: Discord status support'
	'python-pychromecast: Chromecast stream support'
	'python-jxlpy: JPEG XL image support'    # AUR
	'python-tekore: Spotify feature support' # AUR
	'python-tidalapi: Tidal feature support' # AUR
	'librespot: Spotify audio playback'      # AUR
)

source=("${pkgname%-git}"::'git+https://github.com/Taiko2k/Tauon.git')

sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long --exclude "Pre-release*" | sed -e 's/\([^-]*-\)g/r\1/;s/-/./g' -e 's/^v//')"
}

prepare() {
	# Use system kissfft instead of the expected cloned repository
	sed -i 's|"src/phazor/kissfft/kiss_fftr.c", "src/phazor/kissfft/kiss_fft.c", ||g' tauon-music-box/pyproject.toml
	sed -i 's|"samplerate"|"kissfft-float", "samplerate"|g' tauon-music-box/pyproject.toml
}

build() {
	cd "${pkgname%-git}"
	python -m compile_translations
	python -m build --wheel
}

package() {
	cd "${pkgname%-git}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 "extra/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "extra/${_pkgname}-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
	install -Dm644 "extra/${_pkgname}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -Dm755 "extra/tauonmb.sh" "${pkgdir}/opt/${pkgname%-git}/tauonmb.sh"
	install -Dm755 "extra/tauonmb.sh" "${pkgdir}/usr/bin/tauon"
}
