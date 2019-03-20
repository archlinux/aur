# Maintainer: dreieck

_pkgname=tea4cups
pkgname="${_pkgname}-svn"
pkgver=3.14alpha_unofficial+3578
pkgrel=2
pkgdesc="CUPS backend wrapper which can capture print datas before they are sent to a printer and process, duplicate or dispatch them in a number of ways. Swiss army's knife of the CUPS' Administrator."
url="http://www.pykota.com/software/tea4cups/"
license=('GPL2')
arch=('any')
depends=(
  'cups'
  'python2'
  'python2-configparser'
  'python2-urllib3'
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
  # "http://www.pykota.com/software/tea4cups/download/tarballs/tea4cups-${pkgver}_official.tar.gz"
  "${_pkgname}::svn+http://svn.pykota.com/tea4cups/trunk"
  "tea4cups-spool-directory.patch"
  'doc_from_website.txt'
  "doc_debianwiki.html::${_doc_debianwiki_url}"
  "${install}"
)
sha256sums=(
  'SKIP'                                                             # svn+http://svn.pykota.com/tea4cups/trunk
  '47524f08e3f3e261a7d4c0e0e57b487a6bcba3497435d45d6d3b0d4c5f9f3e05' # tea4cups-spool-directory.patch
  '6221890bbd1ab3806efeec8624161c80742d1c5fce24c9094e4f8f8466ba2923' # doc_from_website.txt
  'SKIP'                                                             # doc_debianwiki.html
  '315c82e6e9d352ecb32d511c9290790ac2a52e60e82d4727bff350fcf03aacf0' # "${install}"
)

_tea4cups_spool='/var/spool/tea4cups' # Should match that which get's defined by applying "${srcdir}/tea4cups-spool-directory.patch".

prepare() {
  cd "${srcdir}"

  msg2 "creating 'doc_debianwiki.url' ..."
  cat > doc_debianwiki.url <<< "${_doc_debianwiki_url}"
  msg2 "Creating 'website.url' ..."
  cat > website.url <<< "${url}"


  cd "${srcdir}/${_pkgname}"

  msg2 "Patching tea4cups.conf to use the spool directory '${_tea4cups_spool}' ..."
  patch -N -p1 --follow-symlinks -i "${srcdir}/tea4cups-spool-directory.patch"

  msg2 "Patching executable to use 'python2' interpreter, if not already patched ..."
  sed -E -i '1s|python[[:space:]]*$|python2|' tea4cups
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
  install -v -m 644 -D "${srcdir}/website.url"  "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
  install -v -m 644 -D "${srcdir}/doc_debianwiki.html"   "${pkgdir}/usr/share/doc/${_pkgname}/doc_debianwiki.html"
  install -v -m 644 -D "${srcdir}/doc_debianwiki.url"   "${pkgdir}/usr/share/doc/${_pkgname}/doc_debianwiki.url"

  install -v -m 755 -D clean.sh         "${pkgdir}/usr/share/doc/${_pkgname}/clean.sh"

  install -v -m 644 -D "COPYING"        "${pkgdir}/usr/share/licenses/${pkgname}/GPL2.txt"

  msg2 "Creating our own spool directory '${_tea4cups_spool}' ..."
  install -v -d -m775 "${pkgdir}${_tea4cups_spool}"
  chown cups:cups "${pkgdir}${_tea4cups_spool}"
}
