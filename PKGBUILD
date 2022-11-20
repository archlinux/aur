# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: David Runge <dave@sleepmap.de>

_pkgname=khard
pkgname=khard-git
pkgver=0.16.1.r54.gef7e9d8
pkgrel=1
pkgdesc="Console CardDAV client"
arch=('any')
url="https://github.com/scheibler/khard"
license=('GPL3')
depends=('python-atomicwrites' 'python-configobj' 'python-ruamel-yaml'
'python-setuptools' 'python-unidecode' 'python-vobject')
makedepends=('python-sphinx-autoapi' 'python-sphinx-autodoc-typehints'
'python-setuptools-scm' 'python-sphinx' 'git')
checkdepends=('python-pytest')
optdepends=('vdirsyncer: Synchronization of address books with a DAV server'
            'diffutils: Using sdiff_khard_wrapper.sh')
provides=('khard')
conflicts=('khard')
source=("git+https://github.com/scheibler/khard.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python setup.py build
#  make -C doc singlehtml man
  make -C doc singlehtml
  make -C doc man
}

check() {
  cd "${_pkgname}"
  pytest -v
}

package() {
  cd "${_pkgname}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # additional wrapper script
  install -vDm 755 "misc/sdiff/sdiff_${_pkgname}_wrapper.sh" \
    "${pkgdir}/usr/lib/${_pkgname}/sdiff_${_pkgname}_wrapper.sh"
  # twinkle integration
  install -vDm 644 misc/twinkle/scripts/*.py \
    -t "${pkgdir}/usr/share/${_pkgname}/twinkle/scripts/"
  install -vDm 644 misc/twinkle/sounds/*.ogg \
    -t "${pkgdir}/usr/share/${_pkgname}/twinkle/sounds/"
  # zsh
  install -vDm 644 "misc/zsh/_"*"${_pkgname}" \
    -t "${pkgdir}/usr/share/zsh/site-functions/"
  # docs
  install -vDm 644 {CHANGES,CONTRIBUTING.rst,README.md} \
    -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  # man
  install -vDm 644 "doc/build/man/${_pkgname}.1" \
    -t "${pkgdir}/usr/share/man/man1"
  install -vDm 644 "doc/build/man/${_pkgname}.conf.5" \
    -t "${pkgdir}/usr/share/man/man5"
  # html
  install -vDm 644 "doc/build/singlehtml/index.html" \
    -t "${pkgdir}/usr/share/doc/${_pkgname}/html"
  install -vDm 644 "doc/build/singlehtml/_static/"*.{css,js,png} \
    -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static"
}
