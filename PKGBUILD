# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname='python-preprocess-cancellation'
_name=${pkgname#python-}
_name_source=${_name/-/_}
pkgver=0.2.1
pkgrel=4
pkgdesc="GCode processor to add klipper cancel-object markers"
arch=(any)
url="https://github.com/kageurufu/cancelobject-preprocessor"
license=('GPL3')
makedepends=('python-poetry' 'python-installer' 'python-wheel')
optdepends=('python-shapely')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name_source-$pkgver.tar.gz" 0001-support-orcaslicer.patch)
sha256sums=('e2f1224e1ba1603bdfdbf6937caaf91082dc849e5122e80a5328aa999433ce79'
            'f47570787158453b734732155ef6580f04a13c837d651e811b321e12716f0ad2')

prepare() {
    cd "${srcdir}/${_name_source}-${pkgver}"

    patch -Np1 -i ../0001-support-orcaslicer.patch

    # create poetry.toml in project dir
    poetry config --local virtualenvs.in-project true
}

build() {
  cd "${srcdir}/${_name_source}-${pkgver}"

  poetry build --no-cache --format wheel
}

package() {
  cd "${srcdir}/${_name_source}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
