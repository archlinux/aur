# Maintainer: Floofy <floofyiv9@proton.me>
pkgname=python-dracopy
pkgver=2.0.0
pkgrel=1
pkgdesc="Python wrapper for Google's Draco 3D mesh compression library"
arch=('x86_64')
url="https://github.com/seung-lab/DracoPy"
license=('Apache-2.0')
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'cmake' 'python-scikit-build' 'cython' 'python-scikit-build-core' 'git')
options=(!strip)
source=(
  "git+https://github.com/seung-lab/DracoPy.git#tag=${pkgver}"
  "draco::git+https://github.com/google/draco.git#commit=7d2af85eb76906b0b485a0644675e4827e4571f5"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "DracoPy"
  git submodule init
  git config submodule.draco.url "$srcdir/draco"
  git -c protocol.file.allow=always submodule update

  sed -i "s|'-std=c++11','-O3'|'-std=c++11', '-O3', '-fno-lto'|" setup.py
  sed -i "s|f'-l:{lib}' for lib in ('libdraco.a',)|'-Wl,--whole-archive', '-l:libdraco.a', '-Wl,--no-whole-archive'|" setup.py
}

build() {
  cd "DracoPy"
  python -m setup bdist_wheel
}

package() {
  cd "DracoPy"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
