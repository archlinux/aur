pkgname=kde-material-you-colors
pkgver=1.10.0
pkgrel=1
pkgdesc="Automatic Material You Colors Generator from your wallpaper for the Plasma Desktop"
arch=('x86_64')
url="https://github.com/luisbocanegra/kde-material-you-colors"
license=('GPL3')
depends=('python' 'python-dbus' 'python-numpy' 'python-materialyoucolor' 'plasma5support' 'python-pillow' 'python-pywal16')
makedepends=('extra-cmake-modules' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'libplasma')
source=("${pkgname}-${pkgver}.zip::$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('16fd2fd0600f25f46d55e20d845bb068d460d497d4c251c28ac6065db15d7ee3')

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
