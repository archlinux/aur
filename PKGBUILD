# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.30.10
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
sha512sums=('00ef5878a1845e3176c4074dc75fd039cea270f911f9e49265bab3dab9693527603c177f9190163c9f67b2374b2280a9e8b6d55486a48d52064de96c941c3aeb')

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
