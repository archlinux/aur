# Maintainer: Mateusz Paluszkiewicz <aifam96@gmail.com>

pkgname=(veles-git python-veles-git)
pkgver=2017.2.0.YAGNI.r178.g80e57c2
pkgrel=1
pkgdesc='Binary data analysis and visualization tool'
url='https://codisec.com/veles'
license=('APLv2')
source=(
  'git+https://github.com/codilime/veles.git'
  'Veles.desktop'
  'veles.png'
)
sha256sums=(
  'SKIP'
  '7173aa5e8ef29125004b15051b8b978e181707294ea6b79784c2c586bc209260'
  'ab162fdeb9b99a47a5283b4b8644a1c75e15b74f62f5a78bdcc59580df562489'
)
arch=('x86_64')

pkgver() {
  cd "${srcdir}/veles"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  makedepends=('git' 'cmake' 'qt5-base' 'python' 'python-virtualenv' 'protobuf' 'zlib')

  mkdir -p "${srcdir}/veles/build"
  cd "${srcdir}/veles/build"

  cmake -D CMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" -D CMAKE_BUILD_TYPE=MinSizeRel ..
}

package_veles-git() {
  depends=('qt5-base' 'python' 'python-veles-git' 'protobuf' 'zlib')
  conflicts=('veles-bin' 'veles')

  # Install pixmap
  install -Dm644 veles.png "${pkgdir}/usr/share/pixmaps/veles.png"

  # Install launcher
  desktop-file-install Veles.desktop --dir "${pkgdir}/usr/share/applications"

  # Install license
  install -Dm644 "${srcdir}/veles/LICENSE-2.0" "${pkgdir}/usr/share/licenses/veles/LICENSE"

  cd "${srcdir}/veles/build"

  # Install the program
  make install
}

package_python-veles-git() {
  makedepends=('git' 'python' 'python-pbr' 'python-six' 'python-msgpack' 'python-buildtools')
  depends=('python' 'python-pbr' 'python-six' 'python-msgpack')
  conflicts=('python-veles')

  cd "${srcdir}/veles/python"

  python setup.py install --root="$pkgdir" --optimize=1
}
