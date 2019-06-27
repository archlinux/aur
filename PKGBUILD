pkgname=tea4cups-py3-git
_pkgname=tea4cups-py3
pkgver=3.1.5_alpha+65b5c3a

pkgrel=1
pkgdesc="A unofficial python3 fork of Tea4cups"

url="https://gitlab.com/dadosch/tea4cups/tree/python3/"
license=('GPL2')
arch=('any')
conflicts=('tea4cups-svn')
depends=(
  'cups'
  'python'
  'python-requests'
)
optdepends=(
)
provides=(
  "tea4cups=${pkgver}"
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
  '315c82e6e9d352ecb32d511c9290790ac2a52e60e82d4727bff350fcf03aacf0' # "${install}"
)

_tea4cups_spool='/var/spool/tea4cups' # Should match that which get's defined by applying "${srcdir}/tea4cups-spool-directory.patch".

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(cat tea4cups | sed -n -E 's|^[[:space:]]*__version__[[:space:]]*=[[:space:]]*(.*)$|\1|p' | tr -d \"\' | tr '-' '_')"
  _git="$(git rev-parse --short HEAD)"

  if [ -z ${_ver} ]; then
    echo "Error: Could not determine software version. Aborting." >&2
    exit 1
  fi
  if [ -z ${_git} ]; then
    echo "Error: Could not determine Git revision. Aborting." >&2
    exit 1
  fi
  # Get the version number.
  echo "${_ver}+${_git}"
}


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

  msg2 "Creating our own spool directory '${_tea4cups_spool}' ..."
  install -v -d -m775 "${pkgdir}${_tea4cups_spool}"
  chown cups:cups "${pkgdir}${_tea4cups_spool}"
}
