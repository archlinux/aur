# Maintainer: Mateusz Paluszkiewicz <aifam96@gmail.com>

pkgname=(veles python-veles)
pkgver=2017.2.0.YAGNI
pkgrel=1
pkgdesc='Binary data analysis and visualization tool'
url='https://codisec.com/veles'
license=('APLv2')
source=(
  "git+https://github.com/codilime/veles.git#tag=${pkgver}"
  'Veles.desktop'
  'veles.png'
)
sha256sums=(
  'SKIP'
  '7173aa5e8ef29125004b15051b8b978e181707294ea6b79784c2c586bc209260'
  'ab162fdeb9b99a47a5283b4b8644a1c75e15b74f62f5a78bdcc59580df562489'
)
arch=('x86_64')

build() {
  makedepends=('git' 'cmake' 'qt5-base' 'python' 'python-virtualenv' 'protobuf' 'zlib')

  mkdir -p "${srcdir}/veles/build"
  cd "${srcdir}/veles/build"

  cmake -D CMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" -D CMAKE_BUILD_TYPE=MinSizeRel ..
}

package_veles() {
  depends=('qt5-base' 'python' 'python-virtualenv' 'python-veles' 'protobuf' 'zlib')
  conflicts=('veles-bin' 'veles-git')

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

package_python-veles() {
  makedepends=('git' 'python' 'python-buildtools')
  depends=('python' 'protobuf')
  conflicts=('python-veles-git')

  cd "${srcdir}/veles/python"

  python setup.py install --root="$pkgdir" --optimize=1
}
