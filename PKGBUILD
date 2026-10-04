# Maintainer: Kyle Yasuda <suda@sudacode.com>

pkgname=subminer-bin
pkgver=0.20.1
pkgrel=1
pkgdesc='All-in-one sentence mining overlay with AnkiConnect and dictionary integration'
arch=('x86_64')
url='https://github.com/ksyasuda/SubMiner'
license=('GPL-3.0-or-later' 'MIT' 'LGPL-2.0-only' 'LGPL-2.1-only' 'Apache-2.0' 'BSD-3-Clause')
options=('!strip' '!debug')
depends=(
	'fuse2'
	'glibc'
	'mpv'
	'zlib-ng-compat'
)
optdepends=(
	'ffmpeg: media extraction and screenshot generation'
	'ffmpegthumbnailer: faster thumbnail previews in the launcher'
	'fzf: terminal media picker in the subminer wrapper'
	'rofi: GUI media picker in the subminer wrapper'
	'chafa: image previews in the fzf picker'
	'yt-dlp: YouTube playback and subtitle extraction'
	'mecab: optional Japanese metadata enrichment'
	'mecab-ipadic: dictionary for MeCab metadata enrichment'
	'python-guessit: improved AniSkip title and episode inference'
	'alass-git: preferred subtitle synchronization engine'
	'python-ffsubsync: fallback subtitle synchronization engine'
)
provides=("subminer=${pkgver}")
conflicts=('subminer')
source=(
	"SubMiner-${pkgver}.AppImage::https://github.com/ksyasuda/SubMiner/releases/download/v${pkgver}/SubMiner-${pkgver}.AppImage"
	"subminer-${pkgver}::https://github.com/ksyasuda/SubMiner/releases/download/v${pkgver}/subminer"
	"subminer-assets-${pkgver}.tar.gz::https://github.com/ksyasuda/SubMiner/releases/download/v${pkgver}/subminer-assets.tar.gz"
)
sha256sums=(
'85225bcbd6f15b9ea7adc508f20907b4364f01dccfb0ea45dfac949c1ec0cb4d'
'4d1c8c4ffbecf514cbf009b0f26ef10f0f42b41417ed3c46a9fdeebea67015e8'
'14a1eb12cee6fe010f67ce97522ced023d56320168e2d1ea82c39d888742b978'
)
noextract=("SubMiner-${pkgver}.AppImage")

package() {
	install -dm755 "${pkgdir}/usr/bin"

	install -Dm755 "${srcdir}/SubMiner-${pkgver}.AppImage" \
		"${pkgdir}/opt/SubMiner/SubMiner.AppImage"
	install -dm755 "${pkgdir}/opt/SubMiner"
	ln -s '/opt/SubMiner/SubMiner.AppImage' "${pkgdir}/usr/bin/SubMiner.AppImage"

	install -Dm755 "${srcdir}/subminer-${pkgver}" "${pkgdir}/usr/bin/subminer"

	install -Dm644 "${srcdir}/config.example.jsonc" \
		"${pkgdir}/usr/share/SubMiner/config.example.jsonc"
	install -Dm644 "${srcdir}/plugin/subminer.conf" \
		"${pkgdir}/usr/share/SubMiner/plugin/subminer.conf"
	install -Dm644 "${srcdir}/assets/themes/subminer.rasi" \
		"${pkgdir}/usr/share/SubMiner/themes/subminer.rasi"
	install -Dm644 "${srcdir}/assets/thumbnailers/subminer-ffmpegthumbnailer.thumbnailer" \
		"${pkgdir}/usr/share/SubMiner/thumbnailers/subminer-ffmpegthumbnailer.thumbnailer"

	install -dm755 "${pkgdir}/usr/share/SubMiner/plugin/subminer"
	cp -a "${srcdir}/plugin/subminer/." "${pkgdir}/usr/share/SubMiner/plugin/subminer/"

	# Bundled Bun runtime notices: MIT and BSD texts are not in the licenses package.
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 "${srcdir}"/resources/bun/licenses/* \
		"${pkgdir}/usr/share/licenses/${pkgname}/"
}
