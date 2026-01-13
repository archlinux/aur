# Maintainer: gonsolo@gmail.com
pkgname=python-wasmtime
pkgver=40.0.0
pkgrel=1
pkgdesc="Python 3 extension for interfacing with Wasmtime/Cranelift."
arch=('x86_64' 'aarch64')
url="https://github.com/bytecodealliance/wasmtime-py"
license=('Apache')
depends=('python' 'wasmtime')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}::git+https://github.com/bytecodealliance/wasmtime-py.git#tag=${pkgver}")
sha384sums=('c2e9fc4e18f7d87ffcae2f118c76a1b5614e500db7c55e5b1f3d0124267d7d5405e5b61e3f88af2c5bd4f2ac4ad74caf')

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

