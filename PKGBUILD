# Maintainer: BrainDamage

pkgname=python-libdecsync
pkgver=2.2.1
pkgrel=2
pkgdesc="python3 wrapper around libdecsync"
arch=('any')
url="https://github.com/39aldo39/libdecsync-bindings-python3"
license=('GPL')
depends=('python' 'libdecsync')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('68e0452c128306981dc8e7aa58248cc57855a2de241326b37fbeb5469446d10e')

_dirname="libdecsync-bindings-python3-${pkgver}"
_libPath="${pkgname#python-}/libs"

prepare() {
  cd "${srcdir}/${_dirname}"
  find "${_libPath}" \( -name '*.so' -o -name '*.dll' -o  -name '*.dylib' \) -delete
  cat "${pkgname#python-}/__init__.py" | tr $'\n' $'\r' \
  | sed 's#os_name = platform.system().*not supported")#libpath = resource_filename(__name__, "libs/libdecsync.so")#' \
  | tr $'\r' $'\n' > "${pkgname#python-}/__init__.py.new"
  mv "${pkgname#python-}/__init__.py.new" "${pkgname#python-}/__init__.py"
}

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
  _systemSitePackages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  ln -sv "/usr/lib/${pkgname#python-}.so" "${pkgdir}/${_systemSitePackages}/${_libPath}"
  # not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
  rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
}
