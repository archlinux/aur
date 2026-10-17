# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=slycot
pkgname=python-$_name
pkgver=0.7.1
pkgrel=1
pkgdesc="A wrapper for the SLICOT control and systems library."
arch=('x86_64' 'aarch64')
url="https://github.com/python-control/Slycot"
license=('GPL-2.0 AND BSD-3-Clause AND GPL-3.0-with-GCC-exception AND BSD-2-Clause')
depends=('python'
         'python-numpy'
         'glibc'
         'libgcc'
         'blas'
         'lapack'
         'gcc-fortran')
makedepends=('python-scikit-build-core'
             'python-numpy'
             'python-setuptools-scm'
             'python-build'
             'python-installer'
             'gcc'
             'git')
checkdepends=('python-scipy'
              'python-pytest')
options=(!strip)
source=("$_name::git+$url.git#tag=v$pkgver"
        "git+https://github.com/python-control/SLICOT-Reference#commit=795051cbc2a1d4766753e9ab3bac13eaf731f8d6")
sha256sums=('57242e0605b969ee77e82c7808bac4c76671ea752bcfe5e49d45c8e4562b291c'
            'e8166b45c0450befe28ef22e8261fd7ed9a9ab04f98cbd30fb52bbf98f261cad')

prepare() {
  cd "$_name"
  # Remove stale build artifacts
  git clean -dfx
  git submodule init slycot/src/SLICOT-Reference
  git config submodule.slycot/src/SLICOT-Reference.url "$srcdir"/SLICOT-Reference
  git -c protocol.file.allow=always submodule update slycot/src/SLICOT-Reference
}

build() {
  cd "$_name"
  export BLA_VENDOR=Generic
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}"
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 slycot/src/SLICOT-Reference/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-SLICOT
}
