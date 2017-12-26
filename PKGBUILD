# Maintainer: Tony Lambiris <tony@critialstack.com>

pkgname=(veles-git python-veles-git)
pkgver=2017.06.0.1.r146.g41a1bde
pkgrel=2
pkgdesc='Binary data analysis and visualization tool'
url='https://codisec.com/veles'
license=('APLv2')
source=(
  'git+https://github.com/codilime/veles.git'
)
sha256sums=('SKIP')
arch=('x86_64')

pkgver() {
  cd "${srcdir}/veles"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  makedepends=('git' 'cmake' 'qt5-base' 'python' 'python-pbr' 'python-six' 'python-msgpack' 'python-buildtools' 'python-virtualenv' 'protobuf' 'zlib')

  mkdir -p "${srcdir}/veles/build"
  cd "${srcdir}/veles/build"

  cmake -D CMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" -D CMAKE_BUILD_TYPE=MinSizeRel ..
}

package_veles-git() {
  depends=('qt5-base' 'python' 'python-veles-git' 'protobuf' 'zlib')
  conflicts=('veles-bin' 'veles')
  provides=('veles')

  # Install license
  install -Dm644 "${srcdir}/veles/LICENSE-2.0" "${pkgdir}/usr/share/licenses/veles/LICENSE"

  cd "${srcdir}/veles/build"

  # Install the program
  make install
}

package_python-veles-git() {
  depends=('python' 'python-pbr' 'python-six' 'python-msgpack')
  conflicts=('python-veles')

  cd "${srcdir}/veles/python"

  python setup.py install --root="$pkgdir" --optimize=1
}
