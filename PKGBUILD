# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

pkgname=python2-vdirsyncer-git
_pkgname=vdirsyncer
pkgver=0.4.4.r45.g9f650e9
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('i686' 'x86_64')
url="https://github.com/untitaker/vdirsyncer"
license=('MIT')
depends=('python2-click>=3.1' 'python2-lxml>=3.0'
         'python2-requests-toolbelt>=0.4.0' 'python2-atomicwrites')
makedepends=('git' 'python2-sphinx')
source=("git://github.com/untitaker/${_pkgname}.git")
md5sums=('SKIP')
conflicts=('python2-vdirsyncer')
provides=('python2-vdirsyncer')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # Build vdirsyncer
  cd "${srcdir}/${_pkgname}"
  python2 setup.py build

  # "Install" development stuff needed to build the man page
  rm -rf develop
  mkdir develop
  export PYTHONPATH=${srcdir}/${_pkgname}/develop/
  python2 setup.py develop --install-dir=${srcdir}/${_pkgname}/develop/

  # Build man page
  cd docs
  make man SPHINXBUILD=sphinx-build2
}

package() {
  cd "${srcdir}/${_pkgname}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  # To avoid conflicts with the python3 version
  mv "${pkgdir}/usr/bin/vdirsyncer" "${pkgdir}/usr/bin/vdirsyncer2"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/_build/man/${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}2.1"
}

