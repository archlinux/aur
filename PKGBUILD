# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=4.2.5
pkgrel=3

pkgdesc='Download your Spotify playlists and songs along with album art and metadata (from YouTube if a match is found).'
arch=('any')
url='https://github.com/spotDL/spotify-downloader'
# url='https://spotdl.readthedocs.io/en/latest/'
license=('MIT')

# https://github.com/spotDL/spotify-downloader/blob/master/pyproject.toml
depends=(
	'ffmpeg'
	'python'
	'python-bandcamp-api'
	'python-beautifulsoup4'
	'python-dacite'
	'python-demjson3'
	'python-fastapi'
	'python-mutagen'
	'python-platformdirs'
	'python-pydantic'
	'python-pykakasi'
	'python-pytube'
	'python-rapidfuzz'
	'python-requests'
	'python-rich'
	'python-soundcloud-v2'
	'python-slugify'
	'python-spotipy'
	'python-syncedlyrics'
	'python-typing-extensions'
	'python-ytmusicapi'
	'uvicorn'
	'yt-dlp'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
checkdepends=('python-pytest-asyncio' 'python-pytest-mock')
provides=("$pkgname" 'spotdl')
options=(strip emptydirs zipman)

source=("https://github.com/spotDL/spotify-downloader/archive/refs/tags/v$pkgver.zip")
b2sums=('bad96199ae1768e85efbc992603b911b3967624b26b65e1e3d7de0cbdcba193bbc04f64210c390017cb8b08d4a277907ebf8d9236e5247a2e56e4e2d50fb8c1b')

# Document: https://wiki.archlinux.org/title/Python_package_guidelines
build() {
	cd spotify-downloader-$pkgver
	# https://github.com/python-poetry/poetry/issues/5547
	python -m build --wheel --no-isolation
}

check() {
	cd spotify-downloader-$pkgver
	pytest || echo 'Tests failed!'
}

package() {
	cd spotify-downloader-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
