# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ray
pkgver=1.7.1
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
        "limit.patch::https://patch-diff.githubusercontent.com/raw/ray-project/ray/pull/19108.patch"
        "memory.patch::https://github.com/ray-project/ray/commit/b897b7b3be47da4a498ee1fabd78543faeb7f04f.patch"
        "uninit.patch::https://patch-diff.githubusercontent.com/raw/ray-project/ray/pull/19103.patch")
sha256sums=('3451bf648978d056d1d0545abb0554e72fbaefe5c3eeb5c6a4def5abcdc4b403'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"

  # https://aur.archlinux.org/packages/py-spy#comment-781521
  sed -i "/py-spy/d" python/setup.py

  # https://github.com/ray-project/ray/pull/19108
  patch -Np1 -i "${srcdir}/limit.patch"

  # https://github.com/ray-project/ray/pull/19083
  patch -Np1 -i "${srcdir}/memory.patch"

  # https://github.com/ray-project/ray/pull/19103
  patch -Np1 -i "${srcdir}/uninit.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
