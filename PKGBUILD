# Maintainer: Tony Lambiris <tony@critialstack.com>

pkgname=(veles-git python-veles-git)
pkgver=2018.05.0.r0.ge65de5a
pkgrel=1
pkgdesc='Binary data analysis and visualization tool'
url='https://codisec.com/veles'
license=('APLv2')
source=(
  'git+https://github.com/codilime/veles.git'
  'fix_qt5_use_modules.patch'
)
sha256sums=('SKIP'
            '13a352f860723304dc2ae664f0f2a4ba29f872e7cc65334409dbb6475f9473c0')
arch=('x86_64')

pkgver() {
  cd "${srcdir}/veles"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/veles"
  patch -Np1 -i ../fix_qt5_use_modules.patch
}

build() {
  makedepends=('git' 'cmake' 'qt5-base>=5.11.0' 'python' 'python-pbr' 'python-six' 'python-msgpack' 'python-buildtools' 'python-virtualenv' 'protobuf' 'zlib')

  mkdir -p "${srcdir}/veles/build"
  cd "${srcdir}/veles/build"

  cmake -Wno-dev .. \
	  -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" \
	  -DCMAKE_BUILD_TYPE=MinSizeRel
}

package_veles-git() {
  depends=('qt5-base' 'python' 'python-veles-git' 'protobuf' 'zlib' 'python-pyopenssl')
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
