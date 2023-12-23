# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.26.5
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites'
arch=(any)
url=https://github.com/mikf/gallery-dl
license=(GPL2)
depends=(python python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel git)
optdepends=('ffmpeg: Pixiv Ugoira conversion'
            'yt-dlp: Video downloads'
            'youtube-dl: Video downloads'
            'python-pysocks: SOCKS proxy support'
            'python-brotli: Brotli compression support'
            'python-brotlicffi: Brotli compression support'
            'python-yaml: YAML configuration file support'
            'python-toml: TOML configuration file support for Python<3.11'
            'python-secretstorage: GNOME keyring passwords for --cookies-from-browser')
_tag=87eba9bf6a223f10a2173ad549bc6921fa8a0936 # git rev-parse v${pkgver}
source=(git+"${url}".git#tag="${_tag}"?signed)
validpgpkeys=(3E09F5908333DD83DBDCE7375680CA389D365A88) #Mike Fährmann
sha512sums=('SKIP')

pkgver() {
    git -C ${pkgname} describe --tags | sed 's/^v//'
}

prepare() {
    # Clean out old wheels etc.
    git -C "${pkgname%-git}" clean -dfx
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
}
