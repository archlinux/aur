# Maintainer: BrainDamage

pkgname=python-libdecsync
pkgver=2.2.1
pkgrel=3
pkgdesc="python3 wrapper around libdecsync"
arch=('any')
url="https://github.com/39aldo39/libdecsync-bindings-python3"
license=('GPL')
depends=('python' 'libdecsync')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('68e0452c128306981dc8e7aa58248cc57855a2de241326b37fbeb5469446d10e')

_dirname="libdecsync-bindings-python3-${pkgver}"
_libPath="libdecsync/libs"

prepare() {
  cd "${srcdir}/${_dirname}"
  find "${_libPath}" -delete
  cat "libdecsync/__init__.py" | tr $'\n' $'\r' \
  | sed 's#os_name = platform.system().*not supported")#libpath = resource_filename(__name__, "libs/libdecsync.so")#' \
  | tr $'\r' $'\n' > "${srcdir}/__init__.py.new"
  mv "${srcdir}/__init__.py.new" 'libdecsync/__init__.py'
}

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
  _systemSitePackages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  mkdir -p "${pkgdir}/${_systemSitePackages}/${_libPath}"
  ln -sv "/usr/lib/libdecsync.so" "${pkgdir}/${_systemSitePackages}/${_libPath}/libdecsync.so"
  # not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
  rm -rf "${pkgdir}/${_systemSitePackages}/tests/"
}
