# Maintainer: gonsolo@gmail.com
pkgname=python-wasmtime
pkgver=35.0.0
pkgrel=1
pkgdesc="Python 3 extension for interfacing with Wasmtime/Cranelift."
arch=('x86_64' 'aarch64')
url="https://github.com/bytecodealliance/wasmtime-py"
license=('Apache')
depends=('python' 'wasmtime')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}::git+https://github.com/bytecodealliance/wasmtime-py.git#tag=${pkgver}")
sha384sums=('ccb7f95828aa37cc9963efd1d470a646d6876b2897103598128dca023d29a07407e787e926f020627a969c277d1b3b67')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink libwasmtime into expected subdir for binary extension
  local plat_dir="$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')"
  local target="${pkgdir}${plat_dir}/wasmtime/linux-$(uname -m)"
  mkdir -p "${target}"
  #ln -s "/usr/lib/libwasmtime.so" "${target}/_libwasmtime.so"
}

