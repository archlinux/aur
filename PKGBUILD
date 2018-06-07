# Maintainer: dreieck

_pkgname=tea4cups
pkgname="${_pkgname}-svn"
pkgver=3.13alpha_unofficial+3574
pkgrel=2
pkgdesc="CUPS backend wrapper which can capture print datas before they are sent to a printer and process, duplicate or dispatch them in a number of ways. Swiss army's knife of the CUPS' Administrator."
arch=('any')
depends=(
  'cups'
  'python2'
)
install=tea4cups.install
url="http://www.pykota.com/software/tea4cups/"
license=('GPL2')
source=(
  # "http://www.pykota.com/software/tea4cups/download/tarballs/tea4cups-${pkgver}_official.tar.gz"
  "${_pkgname}::svn+http://svn.pykota.com/tea4cups/trunk"
  'doc_from_website.txt'
  "${install}"
)
optdepends=(
)
provides=("${_pkgname}-doc=${pkgver}")
backup=('etc/cups/tea4cups.conf')
sha256sums=(
  'SKIP'
  '6221890bbd1ab3806efeec8624161c80742d1c5fce24c9094e4f8f8466ba2923'
  '315c82e6e9d352ecb32d511c9290790ac2a52e60e82d4727bff350fcf03aacf0'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  
  msg "Patching executable to use 'python2' interpreter ..."
  sed -i '1s|python[[:space:]]*|python2|' tea4cups
}


pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(cat tea4cups | sed -n -E 's|^[[:space:]]*__version__[[:space:]]*=[[:space:]]*(.*)$|\1|p' | tr -d \"\')"
  _svn="$(svn info | grep '^Revision' | cut -d' ' -f2)"

  if [ -z ${_ver} ]; then
    echo "Error: Could not determine software version. Aborting." >&2
    exit 1
  fi
  if [ -z ${_svn} ]; then
    echo "Error: Could not determine SVN revision. Aborting." >&2
    exit 1
  fi

  echo "${_ver}+${_svn}"
}


package() {
  cd "${srcdir}/${_pkgname}"
  
  _backend_name="$(./tea4cups | awk '{print $2}' | awk -F ':' '{print $1}')"
  install -v -m 755 -D "tea4cups"       "${pkgdir}/usr/lib/cups/backend/${_backend_name}"
  
  install -v -m 644 -D "tea4cups.conf"  "${pkgdir}/etc/cups/tea4cups.conf"
  
  for _docfile in CREDITS NEWS README TODO; do
    install -v -m 644 -D "${_docfile}"  "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  
  install -v -m 644 -D "${srcdir}/doc_from_website.txt"  "${pkgdir}/usr/share/doc/${_pkgname}/doc_from_website.txt"
  
  install -v -m 755 -D clean.sh         "${pkgdir}/usr/share/doc/${_pkgname}/clean.sh"
  
  install -v -m 644 -D "COPYING"        "${pkgdir}/usr/share/licenses/${pkgname}/GPL2.txt"
}
