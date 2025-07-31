# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl-git
pkgver=1.30.2.r20.g952fcb1
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites (git)'
arch=(any)
url=https://github.com/mikf/gallery-dl
license=(GPL-2.0-or-later)
depends=(python python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel git)
checkdepends=(yt-dlp)
optdepends=(
    'yt-dlp: HLS/DASH video downloads, ytdl integration'
    'youtube-dl: HLS/DASH video downloads, ytdl integration'
    'ffmpeg: Pixiv Ugoira conversion'
    'mkvtoolnix-cli: Accurate Ugoira frame timecodes'
    'python-pysocks: SOCKS proxy support'
    'python-brotli: Brotli compression support'
    'python-brotlicffi: Brotli compression support'
    'python-zstandard: Zstandard compression support'
    'python-yaml: YAML configuration file support'
    'python-toml: TOML configuration file support for Python<3.11'
    'python-secretstorage: GNOME keyring passwords for --cookies-from-browser'
    'python-psycopg: PostgreSQL support'
    'python-truststore: Support using system certificates'
    'python-jinja: Jinja template support'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Clean out old wheels etc.
    git -C "${pkgname%-git}" clean -dfx
}

build() {
    cd "${pkgname%-git}"
    make
    python -m build --wheel --no-isolation
}

check() {
    make -C "${pkgname%-git}" test
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" docs/{configuration.rst,formatting.md,gallery-dl-example.conf}
}
