pkgname=kde-material-you-colors
pkgver=2.1.0
pkgrel=1
pkgdesc="Automatic Material You Colors Generator from your wallpaper for the Plasma Desktop"
arch=('x86_64')
url="https://github.com/luisbocanegra/kde-material-you-colors"
license=('GPL3')
makedepends=('extra-cmake-modules' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'libplasma')
depends=('python' 'python-dbus' 'python-numpy' 'python-materialyoucolor' 'plasma5support' 'python-pillow' 'python-pywal16' 'python-magic')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dfb27f1cb60a13379c175edf64b0cbb5bbaaad6786b3a1e92b03eafe8fbfe39d')

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
