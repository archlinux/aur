# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2018-04-20.

_pkgname=pentaxpj-filter
pkgname="${_pkgname}"
epoch=0
_pkgver=1.0.0
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Printer filter for Pentax PocketJet 200 and PocketJet II printers. Needed in addition to the PPDs/ files that come with foomatic-db/ CUPS."
arch=('i686' 'x86_64')
url="http://ww1.pragana.net/gdiprinters.html#pentaxpj"
license=('GPL')

# groups=(
#         "pentaxpj"
#        )

depends=(
  "ghostscript"
)

makedepends=(
  "gzip"
  # "tk"
)

optdepends=(
  "tk: For GUI to change config file for LPD usage."
)

# provides=(
  # "${_pkgname}=${pkgver}"
# )

# conflicts=(
  # "${_pkgname}"
# )

# replaces=(
  # "${_pkgname}<=${pkgver}"
# )

backup=(
  "etc/pentaxpj.conf"
)

_target="pentaxpj-${_pkgver}.tar.gz"

source=(
  "${_target}::http://ww1.pragana.net/pentaxpj-${_pkgver}.tar.gz"
  "pentaxpj.conf.a4"
  "pentaxpj.conf.letter"
)

sha256sums=(
  "e1ea36e1cdfcc733c69709717fb1ed97f2fd0f3e3a12197309277007df1b819b"
  "402f62fef43ca1738d7ba8e7729864326ca138fa5a57fb0b46611f05585ed4c4"
  "a2e25b291591b31b215a7001308f76b1ea7ece2eb803a7258f821bae1223c51a"
)

build() {
  cd "${srcdir}/pentaxpj"
  
  make
  
  gunzip test-page.ps.gz
  gzip -9 test-page.ps
}

package() {
  _instdirbase="/opt/${_pkgname}"
  _instdir="${pkgdir}/${_instdirbase}"
  _bindirbase="/usr/bin"
  _bindir="${pkgdir}/${_execdirbase}"
  _filterdirbase="/usr/lib/cups/filter"
  _filterdir="${pkgdir}/${_filterdirbase}"
  _spooldirbase="/var/spool/lpd"
  _spooldir="${pkgdir}/${_spooldirbase}"
  _etcdirbase="/etc"
  _etcdir="${pkgdir}/${_etcdirbase}"
  _docdirbase="/usr/share/doc/${_pkgname}"
  _docdir="${pkgdir}/${_docdirbase}"
  
  cd "${_srcdir}"
  
  install -v -d -m755 "${_instdir}"
  (
    cd pentaxpj
    for _target in BWidget-* pentax.xpm pentaxpj pentaxpj_sh pentaxsetup test-page.ps.gz; do
      cp -av "${_target}" "${_instdir}"/
    done
    chown root:lp "${_instdir}"/{pentaxsetup,pentaxpj,pentaxpj_sh}
    chmod 754 "${_instdir}"/pentaxsetup
    chmod 755 "${_instdir}"/{pentaxpj,pentaxpj_sh}

    install -v -D -m644 README "${_docdir}"/README
  )
  
  for _docfile in pentaxpj.conf.*; do
    install -v -D -m644 "${srcdir}/${_docfile}" "${_docdir}/${_docfile}"
  done
  
  install -v -D -m664 -g lp pentaxpj.conf.a4 "${_etcdir}"/pentaxpj.conf
  
  (
    cd "${_docdir}"
    ln -sv "${_instdirbase}"/test-page.ps.gz .
  )
  
  install -v -d -m755 "${_bindir}"
  (
    cd "${_bindir}"
    ln -sv "${_instdirbase}"/pentaxpj_sh pentaxpj_sh
    ln -sv "${_instdirbase}"/pentaxpj pentaxpj
    ln -sv "${_instdirbase}"/pentaxsetup .
  )
  
  install -v -d -m755 "${_filterdir}"
  (
    cd "${_filterdir}"
    ln -sv "${_instdirbase}"/pentaxpj_sh pentaxpj
  )
  
  install -v -d -m775 -g lp "${_spooldir}"
}
