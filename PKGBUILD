# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_python=python2
_pkgname=vdirsyncer
pkgname=${_python}-${_pkgname}-git
pkgver=0.6.0.r0.gd59b310
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('i686' 'x86_64')
url="https://github.com/untitaker/vdirsyncer"
license=('MIT')
depends=("${_python}-click>=5.0"
         "${_python}-click-log" "${_python}-click-threading"
         "${_python}-requests-toolbelt>=0.4.0" "${_python}-atomicwrites")
makedepends=("git" "${_python}-sphinx")
checkdepends=("${_python}-pytest-xprocess" "${_python}-pytest-localserver"
             "${_python}-radicale"
             "${_python}-werkzeug" "${_python}-wsgi-intercept")
source=("git://github.com/untitaker/${_pkgname}.git")
md5sums=('SKIP')
conflicts=("${_python}-vdirsyncer")
provides=("${_python}-vdirsyncer")

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
  make man SPHINXBUILD=sphinx-build2
}

check(){
  cd "${srcdir}/${_pkgname}"

  py.test2
}

package() {
  cd "${srcdir}/${_pkgname}"

  ${_python} setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/_build/man/${_pkgname}.1 \
    "${pkgdir}/usr/share/man/man1/${_pkgname}2.1"

  # To avoid conflicts with the python3 version
  mv "${pkgdir}/usr/bin/vdirsyncer" "${pkgdir}/usr/bin/vdirsyncer2"
}
