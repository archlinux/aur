pkgname=kde-material-you-colors
pkgver=1.9.3
pkgrel=1
pkgdesc="Automatic Material You Colors Generator from your wallpaper for the Plasma Desktop"
arch=('x86_64')
url="https://github.com/luisbocanegra/kde-material-you-colors"
license=('GPL3')
depends=('python' 'python-dbus' 'python-numpy' 'python-materialyoucolor' 'plasma5support' 'python-pillow' 'python-pywal')
makedepends=('extra-cmake-modules' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'libplasma')
source=("${pkgname}-${pkgver}.zip::$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('d91de9ddadc5c5795f912530b0a742960e898ccc25048b7ba8c8bbb67a35ca7d')

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
