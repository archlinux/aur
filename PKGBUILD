# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=filesystem_spec
pkgname=python38-fsspec
pkgver=2022.5.0
pkgrel=1
pkgdesc="Specification that python filesystems should adhere to."
arch=(any)
url="https://github.com/intake/filesystem_spec"
license=(BSD)
makedepends=(python38-setuptools)
depends=(python38)
checkdepends=(git
    python38-pytest
    python38-pytest-asyncio
    python38-pytest-mock
    python38-pytest-vcr
    python38-aiohttp
    python38-dask
    python38-distributed
#    python38-fusepy
    python38-libarchive-c
    python38-paramiko
    python38-pyarrow
    python38-pygit2
    python38-requests
    python38-smbprotocol
    python38-cloudpickle
    python38-jinja
    python38-lz4
    python38-msgpack
    python38-numpy
    python38-pandas
    python38-pyftpdlib
    python38-snappy
    python38-tomli
    python38-tqdm
    python38-zstandard
    jupyter-notebook
)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f7279e8ab31700c231c82d0abf0fdd082f7f087854e87d660bcaa82c3bbe336c')

build() {
  cd ${_pkg}-${pkgver}
  python38 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  # These tests do not work on CI, neither on our build server
  pytest -vv --color=yes -rs --deselect fsspec/implementations/tests/test_http.py::test_processes
}

package() {
  cd ${_pkg}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  # Install license file
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
