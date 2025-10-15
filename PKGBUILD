# Maintainer: Taiko2k <captain dot gxj at gmail dot com>
# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=tauon-music-box
_pkgname=tauonmb
_gitname=Tauon
pkgver=8.2.0
pkgrel=1
pkgdesc="A modern music player"
arch=('x86_64' 'aarch64')
url="https://tauonmusicbox.rocks"
license=('GPL-3.0-or-later')

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
	'kissfft' # AUR, only -git is packaged
	'libnotify'
	'ffmpeg'
	'flac'
	'noto-fonts-extra'
	'noto-fonts'
	'xdg-utils'
	'mpg123'
	'opusfile'
	'wavpack'
	'libvorbis'
	'libayatana-appindicator'
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
	'python-lynxpresence: Discord status support' # AUR
	'python-pychromecast: Chromecast stream support'
	'python-jxlpy: JPEG XL image support'    # AUR
	'python-tekore: Spotify feature support' # AUR
	'python-tidalapi: Tidal feature support' # AUR
	'librespot: Spotify audio playback'      # AUR
)

source=("${_gitname}-${pkgver}.tar.gz::https://github.com/Taiko2k/Tauon/archive/v${pkgver}.tar.gz")

sha256sums=('93950233a06a10f9d122a685893cd541e13b89fc36956dc3d18f5b97ebf6ec64')

prepare() {
	# Use system kissfft instead of the expected cloned repository
	cd "${_gitname}-${pkgver}"
	sed -i 's|"src/phazor/kissfft/kiss_fftr.c", "src/phazor/kissfft/kiss_fft.c", ||g' pyproject.toml
	sed -i 's|"samplerate"|"kissfft-float", "samplerate"|g' pyproject.toml
}

build() {
	cd "${_gitname}-${pkgver}"
	python -m compile_translations
	python -m build --wheel
}

package() {
	cd "${_gitname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	for t in cs de es fr_FR fi hu id ja_JP nb_NO pl pt pt_BR pt_PT ru sv tr zh_CN; do
		install -Dm644 src/tauon/locale/${t}/LC_MESSAGES/*.mo -t "${pkgdir}/usr/share/locale/${t}/LC_MESSAGES"
	done

	install -Dm644 "extra/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "extra/${_pkgname}-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
	install -Dm644 "extra/${_pkgname}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -Dm755 "extra/tauonmb.sh" "${pkgdir}/opt/${pkgname}/tauonmb.sh"
	install -Dm755 "extra/tauonmb.sh" "${pkgdir}/usr/bin/tauon"
}
