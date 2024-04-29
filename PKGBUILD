# Maintainer: BrainDamage

pkgname=python-libdecsync
pkgver=2.2.1
pkgrel=5
pkgdesc="python wrapper around libdecsync"
arch=('any')
url="https://github.com/39aldo39/libdecsync-bindings-python3"
license=('GPL')
depends=('python' 'libdecsync')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('68e0452c128306981dc8e7aa58248cc57855a2de241326b37fbeb5469446d10e')

_basename='libdecsync'
_dirname="libdecsync-bindings-python3-${pkgver}"

prepare() {
  cd "${srcdir}/${_dirname}"
  # delete the builtin binary .so
  find "${_basename}/libs" -delete
  _libName=$(pacman -Qlq "${_basename}" | grep '\.so$' | xargs basename -a)
  _sedFrom='os_name = platform.system().*not supported")'
  _sedTo=$(printf 'import os\rlibpath = os.path.join(sys.prefix,sys.platlibdir,"%s")' "${_libName}")
  # change the object loading path from hardcoded builtin one to the system lib
  cat "${_basename}/__init__.py" \
  | tr $'\n' $'\r' \
  | sed "s#${_sedFrom}#${_sedTo}#" \
  | tr $'\r' $'\n' \
    > "${srcdir}/__init__.py"
  mv "${srcdir}/__init__.py" "${_basename}/__init__.py"
}

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
  _systemSitePackages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  # not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
  rm -rf "${pkgdir}/${_systemSitePackages}/tests/"
}
