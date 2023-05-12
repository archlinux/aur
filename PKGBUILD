# Maintainer: Yardena Cohen <yardenack@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-httpx-git
_pkgname=httpx
# https://github.com/encode/httpx/blob/master/CHANGELOG.md
pkgver=0.24.0.r19.gee432c0d
pkgrel=1
pkgdesc="A next generation HTTP client for Python"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python-certifi' 'python-httpcore' 'python-idna' 'python-rfc3986' 'python-sniffio')
optdepends=(
  'python-brotlicffi: for brotli response decompression'
  'python-h2: HTTP/2 support'
  'python-socksio: SOCKS proxy support'
  'python-click: command line client support'
  'python-rich: command line client support'
  'python-trio: alternative async library'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-fancy-pypi-readme' 'git')
checkdepends=('python-pytest-asyncio' 'python-pytest-trio' 'python-typing_extensions' 'python-brotlicffi' 'python-h2' 'python-trustme' 'uvicorn' 'python-socksio' python-brotli
              'python-rich' 'python-chardet')
provides=(python-httpx=$pkgver)
conflicts=(python-httpx)
replaces=(python-httpx)
source=("git+${url}.git"
        "uvicorn-test-server-use-h11.diff")
sha512sums=('SKIP'
            'd3e6a9df365aff5e4e7b724469672c6da9c7e95cc5d79339ebd1ea249236802d81b8792efb0826f89747424fa1bef20d4965ddb75b3b67e9cd320b5fcc738f18')
b2sums=('SKIP'
        'f7fc5aa67d59dfbf544ea2668a5df6449d1cb30f5adf1433d92ebbc0fd10d46fec592f1befe829e126d72240666b9c3ea1f69a9f2cca6f3f4e135a7e454be25d')

pkgver() {
    cd ${_pkgname}
    git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}

  # fix tests
  patch -Np1 -i ../uvicorn-test-server-use-h11.diff

  # disable -Werror, which often causes failures due to newer dependencies in Arch
  #sed -i '/\berror\b/d' setup.cfg
}

build() {
  cd ${_pkgname}

  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}

  pytest
}

package() {
  cd ${_pkgname}

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
