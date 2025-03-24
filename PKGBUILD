# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=yt-dlp-git
pkgver=2025.03.21.r6.g9d5e6de
pkgrel=1
pkgdesc='A youtube-dl fork with additional features and fixes (git)'
arch=(any)
url=https://github.com/yt-dlp/yt-dlp
license=(Unlicense)
depends=(python python-certifi python-requests python-urllib3)
makedepends=(pandoc python-build python-hatchling python-installer git)
checkdepends=(python-pytest)
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'aria2: for using aria2 as external downloader'
            'python-mutagen: for embedding thumbnail in certain formats'
            'python-pycryptodome: for decrypting AES-128 HLS streams and various other data'
            'python-pycryptodomex: for decrypting AES-128 HLS streams and various other data'
            'python-websockets: for downloading over websocket'
            'python-brotli: brotli content encoding support'
            'python-brotlicffi: brotli content encoding support'
            'python-xattr: for writing xattr metadata'
            'python-pyxattr: for writing xattr metadata (alternative option)'
            'phantomjs: for extractors with javascript code'
            'python-secretstorage: For -cookies-from-browser to access the GNOME keyring while decrypting cookies of Chromium-based browsers'
            'python-curl-cffi: for impersonating browsers')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
sha256sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long --tags --abbrev=7 --exclude=nightly | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Clean out old wheels etc.
    git -C "${pkgname%-git}" clean -dfx
}

build() {
    cd "${pkgname%-git}"
    make pypi-files
    python devscripts/make_lazy_extractors.py
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname%-git}"
    pytest -v -m "not download" -k 'not Websockets' # revert when extra/python-websockets updates to 13
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
