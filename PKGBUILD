# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=yt-dlp-git
pkgver=2022.08.19.r10.g07275b708
pkgrel=1
pkgdesc='A youtube-dl fork with additional features and fixes (git)'
arch=(any)
url=https://github.com/yt-dlp/yt-dlp
license=(Unlicense)
depends=(python-certifi)
makedepends=(python-build python-installer python-setuptools python-wheel pandoc git)
checkdepends=(python-pytest)
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'aria2: for using aria2 as external downloader'
            'python-mutagen: For embedding thumbnail in certain formats'
            'python-pycryptodomex: For decrypting AES-128 HLS streams and various other data'
            'python-websockets: For downloading over websocket')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
sha256sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    make pypi-files
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname%-git}"
    # Skip test_escaping as it breaks with ffmpeg 5.1, see https://github.com/yt-dlp/yt-dlp/issues/4604
    pytest -v -m "not download" -k "not test_escaping"
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
