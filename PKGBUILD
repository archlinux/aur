# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2018-04-20.

_pkgname=pentaxpj-filter
pkgname="${_pkgname}"
epoch=0
_pkgver=1.0.0
pkgver="${_pkgver}"
pkgrel=6
pkgdesc="Printer filter for Pentax PocketJet 200 and PocketJet II printers. Needed in addition to the PPDs/ files that come with foomatic-db/ CUPS. Includes printer documentation."
arch=('i686' 'x86_64')
url="http://ww1.pragana.net/gdiprinters.html#pentaxpj"
license=(
  'GPL'
  'custom:proprietary'
)

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

provides=(
  # "${_pkgname}=${pkgver}"
  "pentax-pocketjet-2-manual=2004"
)

# conflicts=(
  # "${_pkgname}"
# )

# replaces=(
  # "${_pkgname}<=${pkgver}"
# )

backup=(
  "etc/pentaxpj.conf"
)

install="${_pkgname}.install"

_target="pentaxpj-${_pkgver}.tar.gz"

source=(
  "${_target}::http://ww1.pragana.net/pentaxpj-${_pkgver}.tar.gz"
  "pentaxpj.conf.a4"
  "pentaxpj.conf.letter"
  "Pentax_PocketJet_II_and_PocketJet_200_users_guide.pdf::http://web.archive.org/web/20071017093018/http://www.megatron.fr/imprimantes/pdf/manuels/thermal/pentax/doc_pocketjet_II-200_user_guide_e.pdf"
  "${install}"
  "license_users-guide_info.txt"
)

sha256sums=(
  "e1ea36e1cdfcc733c69709717fb1ed97f2fd0f3e3a12197309277007df1b819b"
  "402f62fef43ca1738d7ba8e7729864326ca138fa5a57fb0b46611f05585ed4c4"
  "a2e25b291591b31b215a7001308f76b1ea7ece2eb803a7258f821bae1223c51a"
  "ab714ff7dac4cf61261b63836cc238873936c0816b5978d265acf49ffcb3cfcc"
  "348c4ba58e0dfaf49db9bee73f55f6ac049d084e9cc19df81950c0cf1f65eecc"
  "385590851fdc8464f0cb844f0d93e2b625ee46772ce8fad9d287d640db7e9fc2"
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
  _bindir="${pkgdir}/${_bindirbase}"
  _filterdirbase="/usr/lib/cups/filter"
  _filterdir="${pkgdir}/${_filterdirbase}"
  _spooldirbase="/var/spool/lpd"
  _spooldir="${pkgdir}/${_spooldirbase}"
  _etcdirbase="/etc"
  _etcdir="${pkgdir}/${_etcdirbase}"
  _docdirbase="/usr/share/doc/${_pkgname}"
  _docdir="${pkgdir}/${_docdirbase}"
  _licensedirbase="/usr/share/licenses/${pkgname}"
  _licensedir="${pkgdir}/${_licensedirbase}"
  
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
  
  for _docfile in pentaxpj.conf.* Pentax_PocketJet_II_and_PocketJet_200_users_guide.pdf; do
    install -v -D -m644 "${srcdir}/${_docfile}" "${_docdir}/${_docfile}"
  done
  
  install -v -d -m755 "${_docdir}"
  ln -sv "${_instdirbase}"/test-page.ps.gz "${_docdir}"/test-page.ps.gz
  
  install -v -D -m664 pentaxpj.conf.a4 "${_etcdir}"/pentaxpj.conf
  
  install -v -d -m755 "${_bindir}"
  ln -sv "${_instdirbase}"/pentaxpj_sh "${_bindir}"/pentaxpj_sh
  ln -sv "${_instdirbase}"/pentaxpj "${_bindir}"/pentaxpj
  ln -sv "${_instdirbase}"/pentaxsetup "${_bindir}"/pentaxsetup
  
  install -v -d -m755 "${_filterdir}"
  ln -sv "${_instdirbase}"/pentaxpj_sh "${_filterdir}"/pentaxpj_sh
  
  install -v -D -m644 license_users-guide_info.txt ${_licensedir}/license_users-guide_info.txt
  
  install -v -d -m775 -g lp "${_spooldir}"
}
