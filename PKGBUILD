# Maintainer:  Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Laurent Soest <laurent.soest@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Armando M. Baratti <amblistas@ajato.com.br>
# Contributor: Florian Richter <Florian_Richter@gmx.de>

pkgname='python2-cherrypy'
_pkgname="${pkgname#python2-}"
pkgver=17.4.2
pkgrel=1
pkgdesc='A pythonic, object-oriented web development framework'
arch=('any')
url='https://cherrypy.org'
license=('BSD')
depends=('python2' 'python2-six' 'python2-cheroot' 'python2-more-itertools'
  'python2-portend' 'python2-jaraco' 'python2-contextlib2' 'python2-zc.lockfile')
makedepends=('python2-setuptools' 'python2-setuptools-scm' 'python2-six'
  'python2-cheroot' 'python2-portend' 'python2-more-itertools'
  'python2-contextlib2' 'python2-zc.lockfile')
checkdepends=('python2-tox')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('193b5b69b41d1651216795cc81556c90541cd54e125ae8a64ec00e1ad839a061a8af0330722ff6752f7c6a6505670cb36c082448854f1a380b5faafe135103f0')

prepare() {
  # fix python interpreter for python2 stuff
  find "${srcdir}/${_pkgname}-${pkgver}" -type f -name '*.py' \
    -exec sed -i 's|^#!/usr/bin/python$|#!/usr/bin/env python2|1' {} +
}

build() {
  # setuptools wont find version from git tag
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 ./setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  tox2
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 ./setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}/usr/bin/cherryd" "${pkgdir}/usr/bin/cherryd2"

  install -Dm644 LICENSE.md \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
