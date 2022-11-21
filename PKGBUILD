# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpx
pkgname=python38-httpx
# https://github.com/encode/httpx/blob/master/CHANGELOG.md
pkgver=0.23.1
pkgrel=1
pkgdesc="A next generation HTTP client for Python 3.8"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python38-certifi' 'python38-httpcore' 'python38-idna' 'python38-rfc3986' 'python38-sniffio')
optdepends=(
  'python38-brotlicffi: for brotli response decompression'
  'python38-h2: HTTP/2 support'
  'python38-socksio: SOCKS proxy support'
  'python38-click: command line client support'
  'python38-rich: command line client support'
  'python38-trio: alternative async library'
)
makedepends=('python38-build' 'python38-installer' 'python38-hatchling' 'python38-hatch-fancy-pypi-readme')
checkdepends=('python38-pytest-asyncio' 'python38-pytest-trio' 'python38-typing_extensions' 'python38-brotlicffi' 'python38-h2' 'python38-trustme' 'uvicorn' 'python38-socksio'
              'python38-rich' 'python38-chardet' 'python38-multipart')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "uvicorn-test-server-use-h11.diff")
sha512sums=('3fe280b6d3cb1a12bdd502e7bd432588375f9cebfcd9e071acb6e851866a56d84a715428599a297f5df43d73997b2a0c02ba1a12b3e32d292b2051161a350751'
            'd86ec2b97ca0dda68f023f9d1fbed0cb143e4ae118ac71fe6651f8f65d7130f014c0cc14a9ab490fc09583370141d5827976c334bd1c58aaebcf1a00762214c9')
b2sums=('ee01771377bbfebbc4a9346280c8d59508c78295e61b6f9d60a07099e44dfb0fc208d37b68f511bbbacb48438cf6daa73ef82d7a7ae75470409c8346ddad0ad5'
        'b67493e9c8d38ae9b64d831b178d8b943a90a3382e381f08792a35c935fa702b094ea962eb653e5b6ad1b5990466d3d0814d166093aa7b9e921632e61d4ebd45')

prepare() {
  cd ${_pkgname}-${pkgver}

  # fix tests
  patch -Np1 -i ../uvicorn-test-server-use-h11.diff

  # disable -Werror, which often causes failures due to newer dependencies in Arch
  sed -i '/\berror\b/d' setup.cfg
}

build() {
  cd ${_pkgname}-${pkgver}

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}

  pytest
}

package() {
  cd ${_pkgname}-${pkgver}

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
