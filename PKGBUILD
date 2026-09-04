# Maintainer: gonsolo@gmail.com
pkgname=python-wasmtime
pkgver=48.0.0
pkgrel=1
pkgdesc="Python 3 extension for interfacing with Wasmtime/Cranelift."
arch=('x86_64' 'aarch64')
url="https://github.com/bytecodealliance/wasmtime-py"
license=('Apache')
depends=('python' 'wasmtime')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-git-versioning')
source=("${pkgname}-${pkgver}::git+https://github.com/bytecodealliance/wasmtime-py.git#tag=${pkgver}")
sha384sums=('b6225addff2a7e1e4b045f5ddaaa14ff7acdf2e438c8d0c134891e62a81558293f9d913661c7870045f563f39ea6abcd')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git submodule update --init --recursive

  # Arch ships setuptools-git-versioning 3.x, upstream pins <3
  sed -i 's/setuptools-git-versioning>=2.0,<3/setuptools-git-versioning>=2.0/' pyproject.toml
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

