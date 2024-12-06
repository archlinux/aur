# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=tauon-music-box-git
_pkgname=tauonmb
_gitname=Tauon
pkgver=7.8.3.r105.3617679e
pkgrel=1
_kissfftver=131.1.0
_miniaudiocommit=4a5b74bef029b3592c54b6048650ee5f972c1a48
pkgdesc='A modern music player'
arch=('x86_64' 'aarch64')
url='https://tauonmusicbox.rocks'
license=('GPL-3.0-or-later')

conflicts=("${pkgname%-git}")
depends=(
	'python-pillow'
	'python-pylast'
	'python-pysdl2' # AUR
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
	'noto-fonts-extra'
	'noto-fonts'
	'sdl2_image'
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
	'kissfft' # AUR, only -git is packaged
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
	'python-pypresence: Discord status support'
	'python-pychromecast: Chromecast stream support'
	'python-jxlpy: JPEG XL image support'    # AUR
	'python-tekore: Spotify feature support' # AUR
	'python-tidalapi: Tidal feature support' # AUR
	'librespot: Spotify audio playback'      # AUR
)

source=(
	"${pkgname%-git}"::'git+https://github.com/Taiko2k/Tauon.git'
	"kissfft-${_kissfftver}.tar.gz::https://github.com/mborgerding/kissfft/archive/refs/tags/${_kissfftver}.tar.gz")
#	"miniaudio-${_miniaudiocommit}.tar.gz::https://github.com/mackron/miniaudio/archive/${_miniaudiocommit}.tar.gz"


sha256sums=('SKIP'
            '76c1aac87ddb7258f34b08a13f0eebf9e53afa299857568346aa5c82bcafaf1a')
#	'aacb63f571608210e69c5562eb8a9e3d1cb936bdee7a2eb8ffbc40f63888d8e8')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed -e 's/\([^-]*-\)g/r\1/;s/-/./g' -e 's/^v//')"
}

prepare() {
	cp -r kissfft-${_kissfftver}/* ${pkgname%-git}/src/phazor/kissfft/
#	cp -r miniaudio-${_miniaudiocommit}/* ${pkgname%-git}/src/phazor/miniaudio/
#	cd "${pkgname%-git}"
#	patch -Np1 -i "${srcdir}"/phazor.patch
#	patch -Rp1 -i "${srcdir}"/phazor.patch
}

build() {
	cd "${pkgname%-git}"
	python -m compile_translations
	python -m build --wheel
#	bash compile-phazor.sh
#	bash compile-phazor-pipewire.sh
}

package() {
	cd "${pkgname%-git}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
#	install -Dm755 tauon.py -t "${pkgdir}/opt/${pkgname%-git}"

#	cp -r assets templates theme t_modules "${pkgdir}/opt/${pkgname%-git}"

#	for t in cs de es fr_FR fi hu id ja_JP nb_NO pl pt pt_BR pt_PT ru sv tr zh_CN; do
#		install -Dm644 locale/${t}/LC_MESSAGES/*.mo -t "${pkgdir}/usr/share/locale/${t}/LC_MESSAGES"
#	done

	install -Dm644 "extra/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "extra/${_pkgname}-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
	install -Dm644 "extra/${_pkgname}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -Dm755 "extra/tauonmb.sh" "${pkgdir}/opt/${pkgname%-git}/tauonmb.sh"
	install -Dm755 "extra/tauonmb.sh" "${pkgdir}/usr/bin/tauon"
}
