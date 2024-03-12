pkgname=kde-material-you-colors
pkgver=1.8.0
pkgrel=1
pkgdesc="Automatic Material You Colors Generator from your wallpaper for the Plasma Desktop"
arch=('x86_64')
url="https://github.com/luisbocanegra/kde-material-you-colors"
license=('GPL3')
depends=('python' 'python-dbus' 'python-numpy' 'python-material-color-utilities' 'plasma5support')
makedepends=('extra-cmake-modules' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'libplasma')
optdepends=('python-pywal: theme other programs using Material You Colors')
source=("${pkgname}-${pkgver}.zip::$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('f20b89403e7abc9925cdded36ac860d8b3a706dbd178fb63bf8d4e62f7b55031')

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  # backend
  python -m build --wheel --no-isolation
  # plasmoid & screenshot helper
  cmake -B build -S . \
    -DINSTALL_PLASMOID=ON
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  # backend
  python -m installer --destdir="$pkgdir" dist/*.whl
  # plasmoid & screenshot helper
  DESTDIR="$pkgdir" cmake --install build
}
