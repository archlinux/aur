# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=spotdl
pkgver=4.2.6
pkgrel=1
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
	'python-typing_extensions'
	'python-ytmusicapi'
	'uvicorn'
	'yt-dlp'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
checkdepends=('python-pytest-asyncio' 'python-pytest-mock')
provides=('python-spotdl')
replaces=('python-spotdl')
conflicts=('python-spotdl')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-2120.patch::$url/pull/2120.patch")
b2sums=('81f5e9be6e78309376e8104464bc02f11d2ea89e7eb45c815464a8050873f48d94b6764bf068d4b92ce390fc34ae3fc2ea41a2a4b261000ebfa14af7b249b56e'
        '2ea10536e919bb94f2ca743d2b893698e7635d19cb18786d5af98d6762c36405275df8a15e090e8394d5e2bf0b3f2aee4444d75383b5fb926f2557ecc217243b')

prepare() {
	cd "spotify-downloader-$pkgver"
	# fix python-syncedlyrics 1.0.0 compatibility
	patch -Np1 -i "../$pkgname-2120.patch"
}

# Document: https://wiki.archlinux.org/title/Python_package_guidelines
build() {
	cd spotify-downloader-$pkgver
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
