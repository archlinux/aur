# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ray
pkgver=1.3.0
pkgrel=1
pkgdesc='A fast and simple framework for building and running distributed
applications.'
arch=('x86_64')
url='https://ray.io'
license=('Apache-2.0')
depends=(psmisc python python-aiohttp python-aiohttp-cors python-aioredis
         python-click python-colorama python-filelock python-gpustat
         python-grpcio python-jsonschema python-msgpack python-numpy
         python-protobuf py-spy python-pyaml python-requests python-redis
         python-opencensus python-prometheus_client)
optdepends=(
            'python-colorful: for ray[default]'
            'uvicorn: for ray[serve] module'
            'python-flask: for ray[serve] module'
            'python-pydantic: for ray[serve] module'
            'python-starlette: for ray[serve] module'
            'python-fastapi: for ray[serve] module'
            'python-pandas: for ray[tune] and ray[rllib] module'
            'python-tabulate: for ray[tune] and ray[rllib] module'
            'python-tensorboardx: for ray[tune] and ray[rllib] module'
            'python-kubernetes: for ray[k8s]'
            'python-atari-py: for ray[rllib] module'
            'python-dm-tree: for ray[rllib] module'
            'python-gym: for ray[rllib] module'
            'python-lz4: for ray[rllib] module'
            'opencv: for ray[rllib] module'
            'python-pyaml: for ray[rllib] module'
            'python-scipy: for ray[rllib] module'
           )
makedepends=(python python-setuptools python-wheel python-pip cython bazel)
_pkgname=ray
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ray-project/ray/archive/${_pkgname}-$pkgver.tar.gz"
        "bazel-protobuf.patch::https://patch-diff.githubusercontent.com/raw/ray-project/ray/pull/15756.patch")
sha256sums=('66c65a6b7f5838726c908ebcc9d6c985f59ddbb0f22a700730422dde997d48d2'
            'SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"

  # https://github.com/ray-project/ray/pull/12613
  sed -i "s/8)/8), (3, 9)/g" python/setup.py

  # https://aur.archlinux.org/packages/py-spy#comment-781521
  sed -i "/py-spy/d" python/setup.py

  # https://github.com/ray-project/ray/pull/15756
  patch --forward --strip=1 --input="${srcdir}/bazel-protobuf.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
