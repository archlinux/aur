pkgname=tea4cups-py3-git
_pkgname=tea4cups-py3
pkgver=1.0.0

pkgrel=1
pkgdesc="A unofficial python3 fork of Tea4cups"

url="https://gitlab.com/dadosch/tea4cups/tree/python3/"
license=('GPL2')
arch=('any')
provides=('tea4cups')
conflicts=('tea4cups-svn')
depends=(
  'cups'
  'python'
  'python-requests'
)
optdepends=(
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
)
backup=('etc/cups/tea4cups.conf')
install=tea4cups.install
_doc_debianwiki_url='http://wiki.debian.org/Tea4CUPS'
source=(
  "${_pkgname}::git+https://gitlab.com/dadosch/tea4cups#branch=python3"
  'doc_from_website.txt'
  "doc_debianwiki.html::${_doc_debianwiki_url}"
  "${install}"
)
sha256sums=(
  'SKIP'                                                             # svn+http://svn.pykota.com/tea4cups/trunk
  '6221890bbd1ab3806efeec8624161c80742d1c5fce24c9094e4f8f8466ba2923' # doc_from_website.txt
  'SKIP'                                                             # doc_debianwiki.html
  'ef3106de3e751109dcad9f3261fe608aff09fc6dea18451dfca2a4841ffccf7a' # "${install}"
)

prepare() {
  cd "${srcdir}"
  
  msg "creating 'doc_debianwiki.url' ..."
  cat > doc_debianwiki.url <<< "${_doc_debianwiki_url}"
  msg "Creating 'website.url' ..."
  cat > website.url <<< "${url}"
  
  cd "${srcdir}/${_pkgname}"
  
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
  install -v -m 644 -D "${srcdir}/website.url"  "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
  install -v -m 644 -D "${srcdir}/doc_debianwiki.html"   "${pkgdir}/usr/share/doc/${_pkgname}/doc_debianwiki.html"
  install -v -m 644 -D "${srcdir}/doc_debianwiki.url"   "${pkgdir}/usr/share/doc/${_pkgname}/doc_debianwiki.url"
  
  install -v -m 755 -D clean.sh         "${pkgdir}/usr/share/doc/${_pkgname}/clean.sh"
  
  install -v -m 644 -D "COPYING"        "${pkgdir}/usr/share/licenses/${pkgname}/GPL2.txt"
}
