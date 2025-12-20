# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.31.1
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites'
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
source=(git+"${url}".git#tag=v"${pkgver}"?signed)
validpgpkeys=(3E09F5908333DD83DBDCE7375680CA389D365A88) #Mike Fährmann
sha512sums=('a6c71361ecf3329fd0e924053629a81ac6477e8afd8ce1b32ad80c904531534d1b50532f121b36603b1e0d61f5c60e84d42dcb302c5b30e0b12cee26918a074f')

prepare() {
    # Clean out old wheels etc.
    git -C "${pkgname}" clean -dfx
}

build() {
    cd ${pkgname}
    make
    python -m build --wheel --no-isolation
}

check() {
    make -C ${pkgname} test
}

package() {
    cd ${pkgname}
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" docs/{configuration.rst,formatting.md,gallery-dl-example.conf} CHANGELOG.md
}
