# Maintainer:  dreieck
# Contributor: vinvin

_pkgname='eos-movrec'
pkgname="${_pkgname}-svn"
_svnname="${_pkgname}"
epoch=1
pkgver=r141
pkgrel=1
pkgdesc="Write short movies with your Canon EOS directly to computer using the live view mode."
url="http://sourceforge.net/projects/eos-movrec/"
arch=(
  'i686'
  'x86_64'
)
license=('GPL2')
depends=(
  'libgphoto2'
  'qt5-base'
)
optdepends=(
  'mencoder:  To use the provided x264 encoding example script.'
  'x264:      To use the provided x264 encoding example script.'
)
makedepends=(
  'cmake'
  'gcc'
  'subversion'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::svn+https://svn.code.sf.net/p/${_svnname}/code/trunk")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  svn log > "${srcdir}/svnlog.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _rev="$(svnversion)"
  _date="$()"
  
  printf "r%s" "${_rev}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  
  install -v -m644 -D "${srcdir}/svnlog.log" "${pkgdir}/usr/share/doc/${_pkgname}/svnlog.log"
  for _docfile in INSTALL TODO tools/*; do
    install -v -m644 -D "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  
  install -v -m644 -D "License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/License.GPL2.txt"
}
