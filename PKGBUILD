# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=yt-dlp-git
pkgver=2023.07.06.r43.gbbeacff7f
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
source=(git+"${url}".git
        "${pkgname%-git}"-fix-ssl_load_certs-tests.patch::https://patch-diff.githubusercontent.com/raw/yt-dlp/yt-dlp/pull/7675.patch)
sha256sums=('SKIP'
            '077ee0259ac65bbf6cba68cc4e6657e2aa5633437cff57e34022e14414bbf35f')

pkgver() {
    git -C "${pkgname%-git}" describe --long --tags --exclude=nightly | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Clean out old wheels etc.
    git -C "${pkgname%-git}" clean -dfx

    # Fix ssl_load_certs tests https://github.com/yt-dlp/yt-dlp/pull/7675
    patch --directory="${pkgname%-git}" --forward --strip=1 --input="${srcdir}/${pkgname%-git}-fix-ssl_load_certs-tests.patch"
}

build() {
    cd "${pkgname%-git}"
    make pypi-files
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname%-git}"
    pytest -v -m "not download"
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
