pkgname=kde-material-you-colors
pkgver=1.10.1
pkgrel=1
pkgdesc="Automatic Material You Colors Generator from your wallpaper for the Plasma Desktop"
arch=('x86_64')
url="https://github.com/luisbocanegra/kde-material-you-colors"
license=('GPL3')
depends=('python' 'python-dbus' 'python-numpy' 'python-materialyoucolor' 'plasma5support' 'python-pillow' 'python-pywal16')
makedepends=('extra-cmake-modules' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'libplasma')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('da4b348cf28aa58c348c7cb5963783df43c2308e4bbf2078a4efe34ee294151d')

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
