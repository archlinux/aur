# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_python=python
_pkgname=vdirsyncer
pkgname=${_python}-${_pkgname}-git
pkgver=0.6.0.r17.g1182350
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('i686' 'x86_64')
url="https://github.com/untitaker/vdirsyncer"
license=('MIT')
depends=("${_python}-click>=5.0"
         "${_python}-click-log" "${_python}-click-threading"
         "${_python}-lxml>=3.0"
         "${_python}-requests-toolbelt>=0.4.0" "${_python}-atomicwrites")
makedepends=("git" "${_python}-sphinx")
checkdepends=("${_python}-pytest-xprocess" "${_python}-pytest-localserver"
             "radicale"
             "${_python}-werkzeug" "${_python}-wsgi-intercept")
source=("git://github.com/untitaker/${_pkgname}.git")
md5sums=('SKIP')
conflicts=("${_python}-vdirsyncer" "vdirsyncer")
provides=("${_python}-vdirsyncer" "vdirsyncer")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # Build vdirsyncer
  cd "${srcdir}/${_pkgname}"
  ${_python} setup.py build

  # "Install" development stuff needed to build the man page
  rm -rf "${srcdir}/develop"
  mkdir "${srcdir}/develop"
  export PYTHONPATH="${srcdir}/develop":${PYTHONPATH}
  ${_python} setup.py develop --install-dir="${srcdir}/develop/"

  # Build man page
  cd docs
  make man SPHINXBUILD=sphinx-build
}

check(){
  cd "${srcdir}/${_pkgname}"

  py.test
}

package() {
  cd "${srcdir}/${_pkgname}"

  ${_python} setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/_build/man/${_pkgname}.1 \
    "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
