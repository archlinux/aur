# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

pkgname=python-vdirsyncer-git
_pkgname=vdirsyncer
pkgver=0.5.2.r9.g6fa3b1d
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('i686' 'x86_64')
url="https://github.com/untitaker/vdirsyncer"
license=('MIT')
depends=('python-click>=3.1' 'python-lxml>=3.0'
         'python-requests-toolbelt>=0.4.0' 'python-atomicwrites')
makedepends=('git' 'python-sphinx')
source=("git://github.com/untitaker/${_pkgname}.git")
md5sums=('SKIP')
conflicts=('python-vdirsyncer' 'vdirsyncer')
provides=('python-vdirsyncer' 'vdirsyncer')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # Build vdirsyncer
  cd "${srcdir}/${_pkgname}"
  python setup.py build

  # "Install" development stuff needed to build the man page
  rm -rf develop
  mkdir develop
  export PYTHONPATH=${srcdir}/${_pkgname}/develop/
  python setup.py develop --install-dir=${srcdir}/${_pkgname}/develop/

  # Build man page
  cd docs
  make man SPHINXBUILD=sphinx-build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/_build/man/${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}

