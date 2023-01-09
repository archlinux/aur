# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.24.2
pkgrel=2
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites'
arch=(any)
url=https://github.com/mikf/gallery-dl
license=(GPL2)
depends=(python python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel git)
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
            'youtube-dl: Download videos'
            'python-pysocks: SOCKS support'
            'python-brotli: for brotli decompression')
_tag=5e22b13aa3dcb51fc58227f7e0fcf59cffdf265e # git rev-parse v${pkgver}
source=(git+"${url}".git#tag="${_tag}"?signed
        https://github.com/mikf/gallery-dl/commit/dfe4f00ca2b9da6128b04ff32ba50910d07cf183.patch)
validpgpkeys=(3E09F5908333DD83DBDCE7375680CA389D365A88) #Mike Fährmann
sha512sums=('SKIP'
            'c44adfcfcc79013547d847a8c501e68d0a587055a5a511178cd3e0e82fa20ee6769cdadebdb6ad187402b61fd8cf86eff093ff962026f7f1da8c53fe4a89840f')

pkgver() {
    git -C ${pkgname} describe --tags | sed 's/^v//'
}

prepare() {
    patch --directory=${pkgname} --forward --strip=1 --input="${srcdir}/dfe4f00ca2b9da6128b04ff32ba50910d07cf183.patch"
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
