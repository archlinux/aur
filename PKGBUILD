# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.32.20
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites'
arch=(any)
url=https://codeberg.org/mikf/gallery-dl
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
sha512sums=('8426803e1248f38e46ac0b92f0099e850a1d40e15c5b65168a50416bad94048430679ce545d309c15676aa02024d4a279ff96b8ef4804ecdca72b2e516b753a5')

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
