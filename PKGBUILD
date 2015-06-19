# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=trac-narcissus
pkgver=87
pkgrel=1
pkgdesc="Team reflection plugin for Trac"
arch=('any')
url="http://trac-hacks.org/wiki/NarcissusPlugin"
license=('BSD')
depends=('python-imaging' 'trac>=0.12')
makedepends=('mercurial' 'python2-distribute')

_hgroot=http://vandor.it.usyd.edu.au/hg/
_hgrepo=narcissus-plugin

build() {
  cd "${srcdir}"
  msg "Connecting to Mercurial server...."

  if [[ -d "${_hgrepo}" ]]; then
    cd "${_hgrepo}"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "${_hgrepo}"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_hgrepo}-build"
  cp -r "${srcdir}/${_hgrepo}" "${srcdir}/${_hgrepo}-build"
  cd "${srcdir}/${_hgrepo}-build/0.12"

  python2 setup.py build
}

package() {
  cd "${srcdir}/${_hgrepo}-build/0.12"
  python2 setup.py install --root="${pkgdir}" -O1
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  python2 setup.py --license > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
