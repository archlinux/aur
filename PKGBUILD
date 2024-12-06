# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
_base=ray
pkgname=python-${_base}
pkgver=2.40.0
pkgrel=1
pkgdesc="A fast and simple framework for building and running distributed applications"
arch=(x86_64)
url="https://github.com/${_base}-project/${_base}"
license=(Apache-2.0)
depends=(psmisc python-click python-filelock python-jsonschema python-msgpack python-packaging
  python-protobuf python-pyaml python-aiosignal python-frozenlist python-requests)
makedepends=(python-build python-installer python-setuptools-scm python-wheel cython bazel) # python-pip
optdepends=('python-pandas: for ray[data, tune, rllib]'
  'python-fsspec: for ray[data, tune, rllib]'
  'python-aiohttp: for ray[default, serve]'
  'python-aiohttps-cors: for ray[default, serve]'
  'python-colorful: for ray[default, serve]'
  'py-spy: for ray[default, serve]'
  'python-opencensus: for ray[default, serve]'
  'python-prometheus_client: for ray[default, serve]'
  'python-smart-open: for ray[default, serve]'
  'python-virtualenv: for ray[default, serve]'
  'uvicorn: for ray[serve]'
  'python-starlette: for ray[serve]'
  'python-fastapi: for ray[serve]'
  'python-tensorboardx: for ray[tune, rllib]'
  'python-opentelemetry-api: for ray[observability]'
  'python-opentelemetry-sdk: for ray[observability]'
  'python-opentelemetry-exporter-otlp: for ray[observability]'
  'python-dm-tree: for ray[rllib]'
  'python-gymnasium: for ray[rllib]'
  'python-lz4: for ray[rllib]'
  'python-scikit-image: for ray[rllib]'
  'python-scipy: for ray[rllib]'
  'python-typer: for ray[rllib]'
  'python-rich: for ray[rllib]'
)
conflicts=(mesa-demos)
source=(${_base}-${_base}-${pkgver}.tar.gz::${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('27cf687bffb0a1599928be1e0eeddb92789dbcf743e865d43b402a077d2958d03ecb0c7a12a6346c65798189bb8fa36a072b4df2fef51b6e768309a939fe75b2')

prepare() {
  local _bazelversion=$(pacman -Q bazel | sed -e 's/.* //; s/-.*//g')
  sed -i "s|6.5.0|${_bazelversion}|" ${_base}-${_base}-${pkgver}/.bazelversion
  sed -i '/    runtime_env_agent_pip_packages/,+11 s/^/#/' ${_base}-${_base}-${pkgver}/python/setup.py
}

build() {
  cd ${_base}-${_base}-${pkgver}/python
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  SKIP_THIRDPARTY_INSTALL=1 python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
