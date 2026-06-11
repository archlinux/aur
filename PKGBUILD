# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
pkgname=llama-benchy
pkgver=0.3.8
pkgrel=1
pkgdesc="A simple CLI tool for benchmarking llama.cpp and other LLM inference engines"
arch=('any')
url="https://github.com/eugr/llama-benchy"
license=('MIT')
depends=('python' 'python-tabulate' 'python-aiohttp' 'python-requests' 'python-pydantic' 'python-numpy' 'python-transformers')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
provides=("llama-benchy")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eugr/llama-benchy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5bd1510b175ae59976164114344ffbb711aa6ced8a83ad921964e09933812bc7')

prepare() {
  ln -sf "${pkgname}-${pkgver}" "${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"

  # hatch 需要通过环境变量配置版本号
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  export HATCH_BUILD_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # 安装许可证文件
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
