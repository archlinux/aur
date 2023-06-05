# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2023-06-05.

_pkgname=bahn-regio-entfernungsrechner
pkgname="${_pkgname}-bin"
epoch=0
_programdate=220106
pkgver="3.2d_${_programdate}"
pkgrel=1
pkgdesc="Calculates fare kilometres for subscription tickets for DB regio. Upstream name: 'Entfernungsrechner für Fahrvergünstigungen.'"
arch=(
  'i686'
  'x86_64'
)
url="https://www.evg-online.org/deine-vorteile/services/service-meldungen/entfernungsrechner-fuer-fahrverguenstigungen/"
license=('custom')

groups=()

depends=(
  "wine"
)
makedepends=()
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-latest"
)
replaces=(
  "${_pkgname}-latest<=3d_20180202"
  "${_pkgname}<=1:3.2d_20210104"
)


source=(
  "entfernungsrechner_${_programdate}.zip::https://www.evg-online.org/fileadmin/Service/Entfernungsrechner/${_programdate}_Entfernungsrechner.zip"
  "entfernungsrechner.sh"
  "Entfernungsrechner_Benutzerhandbuch.pdf::https://www.evg-online.org/fileadmin/Service/Entfernungsrechner/handbuch_entfernungsrechner-data.pdf"
  "license-dummy.txt"
)

sha256sums=(
  "6c5e9a44f9e9d9a4afa29b2c63f977f129ceb30a1a97881ec2f5ab26db9babc5"  # entfernungsrechner_${_programdate}_${_programdate}.zip
  "8347288b3a402c8075e5ccc24d23f3ae123ebebedd4116ed5e2352cf1a7b24ac"  # entfernungsrechner.sh
  "f3a566dec531484b4d3b864c958cff554e006362921d971704817f8fd60e814b"  # Entfernungsrechner_Benutzerhandbuch.pdf
  "b90a755ef3db2a12766725c1f5e0d31bebb08a700d240b4304624768c38ed9eb"  # license-dummy.txt
)

noextract=(
  "entfernungsrechner_${_programdate}.zip"
)

options=(
  "emptydirs"
)

# pkgver() {
#   _ver="$(curl -s -L ${url} | grep Version | sed -n 's|^.*Version \([^ ]*\) .*$|\1|p')"
#   _datestr="$(curl -s -L ${url} | grep Version | sed -n 's|^.*Version \([^ ]*\) vom \([^ )]*\).*|\2|p')"
#   _date="$(echo "${_datestr}" | awk -F . '{print $3$2$1}')"
#
#   if [ -z "${_ver}" ]; then
#     {
#       echo ""
#       echo "pkgver() Error: Could not determine version."
#       echo ""
#     } > /dev/stderr
#     return 1
#   elif [ -z "${_date}" ]; then
#     {
#       echo ""
#       echo "pkgver() Error: Could not determine datestamp."
#       echo ""
#     } > /dev/stderr
#     return 2
#   else
#     echo "${_ver}_${_date}"
#   fi
# }


package() {
  _instdirbase='/opt/entfernungsrechner'
  _instdir="${pkgdir}/${_instdirbase}"
  _execdirbase='/usr/bin'
  _execdir="${pkgdir}/${_execdirbase}"
  _docdirbase="/usr/share/doc/${_pkgname}"
  _docdir="${pkgdir}/${_docdirbase}"
  _licensedirbase="/usr/share/licenses/${pkgname}"
  _licensedir="${pkgdir}/${_licensedirbase}"

  install -v -d -m755 "${_instdir}"
  install -v -d -m755 "${_instdir}/doc"
  install -v -d -m755 "${_execdir}"
  install -v -d -m755 "${_docdir}"

  (
    cd "${_instdir}"
    bsdtar -x -v -f "${srcdir}/entfernungsrechner_${_programdate}.zip"
    chmod 644 *
    chmod 755 *.[eE][xX][eE]
  )

  install -v -D -m755 "${srcdir}/entfernungsrechner.sh" "${_execdir}/entfernungsrechner"

  install -v -D -m644 "${srcdir}/Entfernungsrechner_Benutzerhandbuch.pdf" "${_instdir}/doc/Entfernungsrechner_Benutzerhandbuch.pdf"
  echo "${url}" > "${_instdir}/doc/info.url"
  chmod 644 "${_instdir}/doc/info.url"

  install -v -D -m644 "${srcdir}/license-dummy.txt" "${_licensedir}/license-dummy.txt"

  (
    cd "${_docdir}"
    ln -v -s "${_instdirbase}/doc/Entfernungsrechner_Benutzerhandbuch.pdf" .
    ln -v -s "${_instdirbase}/doc/info.url" .
  )

  chmod 755 "${_docdir}"
  chmod 755 "${_instdir}"
  chmod 755 "${_instdir}/doc"
}
