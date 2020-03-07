pkgname=tea4cups-py3-git
_pkgname=tea4cups-py3
pkgver=3.15+r130.edae902

pkgrel=1
pkgdesc="Tea4cups with Python3"

url="https://codeberg.org/dadosch/tea4cups"
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
  "${_pkgname}::git+https://codeberg.org/dadosch/tea4cups"
  "tea4cups-spool-directory.patch"
  "doc_debianwiki.html::${_doc_debianwiki_url}"
  "${install}"
)
sha256sums=('SKIP'
            '47524f08e3f3e261a7d4c0e0e57b487a6bcba3497435d45d6d3b0d4c5f9f3e05'
            '86248a453eacec27ac9491599b7264bfef261ba3fee5b039d4620a260b444370'
            '315c82e6e9d352ecb32d511c9290790ac2a52e60e82d4727bff350fcf03aacf0')

_tea4cups_spool='/var/spool/tea4cups' # Should match that which get's defined by applying "${srcdir}/tea4cups-spool-directory.patch".

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(cat tea4cups | sed -n -E 's|^[[:space:]]*__version__[[:space:]]*=[[:space:]]*(.*)$|\1|p' | tr -d \"\' | tr '-' '_')"
  _git=`printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"`

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


  msg2 "Patching tea4cups.conf to use the spool directory '${_tea4cups_spool}' ..."
  patch -N -p1 --follow-symlinks -i "${srcdir}/tea4cups-spool-directory.patch"  
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  _backend_name="$(./tea4cups | awk '{print $2}' | awk -F ':' '{print $1}')"
  install -v -m 755 -D "tea4cups"       "${pkgdir}/usr/lib/cups/backend/${_backend_name}"
  
  install -v -m 644 -D "tea4cups.conf"  "${pkgdir}/etc/cups/tea4cups.conf"

  for _docfile in CREDITS NEWS README.md TODO; do
    install -v -m 644 -D "${_docfile}"  "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  
  install -v -m 644 -D "${srcdir}/website.url"  "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
  install -v -m 644 -D "${srcdir}/doc_debianwiki.html"   "${pkgdir}/usr/share/doc/${_pkgname}/doc_debianwiki.html"
  install -v -m 644 -D "${srcdir}/doc_debianwiki.url"   "${pkgdir}/usr/share/doc/${_pkgname}/doc_debianwiki.url"
  
  install -v -m 755 -D clean.sh         "${pkgdir}/usr/share/doc/${_pkgname}/clean.sh"
  
  install -v -m 644 -D "COPYING"        "${pkgdir}/usr/share/licenses/${pkgname}/GPL2.txt"

  msg2 "Creating our own spool directory '${_tea4cups_spool}' ..."
  install -v -d -m775 "${pkgdir}${_tea4cups_spool}"
  chown cups:cups "${pkgdir}${_tea4cups_spool}"
}
