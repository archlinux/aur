# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer:  Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Steven She <mintcoffee@gmail.com>
# Contributor: vbPadre <vbPadre@gmail.com>

# cndrvcups-lb-bin
# Contributor: Allen Choong <allencch at hotmail dot com>
# Contributor: Indeed <fengjared at gmail dot com>

# mips64 arm64 available

_opt_RPM=1
_opt_ppdlevel=2 # no extra ppd, 1 extra ppd from source, 2 extra ppd from RPM/Debian

set -u
pkgbase='cnrdrvcups-lb'
pkgbase+='-bin'
pkgname="${pkgbase}"
# The download link changes with every version, try to keep changes in one place
#_pkgver='5.10';  _dl='8/0100007658/13'
#_pkgver='5.20';  _dl='8/0100007658/18';_suffix='05'
#_pkgver='5.30';  _dl='8/0100007658/20';_suffix='12'
_pkgver='5.40';  _dl='8/0100007658/25';_suffix='08'
#https://gdlp01.c-wss.com/gds/8/0100007658/20/linux-UFRII-drv-v530-uken-12.tar.gz
pkgver="${_pkgver}"
pkgrel='1'
pkgdesc='CUPS Canon UFR II LIPSLX CARPS2 printer driver for LBP iR MF ImageCLASS ImageRUNNER Laser Shot i-SENSYS ImagePRESS ADVANCE printers and copiers'
arch=('x86_64')
# Direct links to the download reference go bad on the next version. We want something that will persist for a while.
url='https://www.canon-europe.com/support/products/imagerunner/imagerunner-1730i.aspx'
license=('GPL2' 'MIT' 'custom')
# parts of the code are GPL or MIT licensed, some parts have a custom license
depends=('gcc-libs' 'libxml2' 'libglade')
optdepends=(
  'libjpeg6-turbo: improves printing results for color imageRUNNER/i-SENSYS LBP devices'
  'libjbig-shared: port of debian/fedora specific jbigkit funtionality that can prevent cpu hangs on some models'
  'gtk2: for cnsetuputil2'
)
makedepends=('jbigkit' 'gzip' 'gtk2')
provides=("cnrdrvcups-lb=${pkgver}")
conflicts=('cndrvcups-lb' 'cndrvcups-common-lb')
conflicts+=('cndrvcups-lb-bin' 'cnrdrvcups-lb')
options=('!emptydirs' '!strip' '!libtool')
source=(
  "http://gdlp01.c-wss.com/gds/${_dl}/linux-UFRII-drv-v${_pkgver//\./}-uken-${_suffix}.tar.gz"
)
md5sums=('79d4f933795528dc217c344d5aff079d')
sha256sums=('51cab752fad9bcd5379320c7d0d092b90e67c30b336c1776bfe4ea74b03c2634')
sha512sums=('c488fbaee081b3cd601282e737af0ce1d141a9ae940daa2335ef4da833cdb9fbdda3cc378f4e49b26700b36911dc7b142ef0665e1cacef505f91a666736e62dc')

#PKGEXT='.pkg.tar.gz'

build() {
  set -u
  shopt -s nullglob

  #declare -A _archd=([i686]='32-bit_Driver' [x86_64]='64-bit_Driver')
  declare -A _archd=([i686]='x86' [x86_64]='x64')
  if [ "${_opt_RPM}" -ne 0 ]; then
    declare -A _archf=([i686]='i386' [x86_64]='x86_64')
    local _p1='-'
    local _p2='.'
    local _archrpme='rpm'
    local _archrpmf='RPM'
  else
    declare -A _archf=([i686]='i386' [x86_64]='amd64')
    local _p1='_'
    local _p2='_'
    local _archrpme='deb'
    local _archrpmf='Debian'
  fi

  mkdir 'dta'
  cd 'dta'
  local _dta="${PWD}"
  cd "../linux-UFRII-drv-v${_pkgver//./}-uken"
  bsdtar -C "${_dta}" -xf "${_archd[${CARCH}]}/${_archrpmf}/cnrdrvcups-ufr2-uk${_p1}${_pkgver}-1${_p2}${_archf[${CARCH}]}.${_archrpme}"
  if [ "${_opt_RPM}" -eq 0 ]; then
    pushd "${_dta}" > /dev/null
    bsdtar -xf data.tar.?z
    rm data.tar.?z control.tar.?z
    rm -r 'usr/share/doc/'
    popd > /dev/null
  fi

  if [ "${_opt_ppdlevel}" -ge 1 ]; then
    # Get extra .ppd and .res from source
    mkdir "${_dta}/z"
    bsdtar -C "${_dta}/z" -xf "Sources/cnrdrvcups-lb-${pkgver}-1.tar.gz"
    mv "${_dta}/z/"cnrdrvcups-*/ppd/*.ppd "${_dta}/usr/share/cups/model/"
    mv "${_dta}/z/"cnrdrvcups-*/cngplp/files/*.res "${_dta}/usr/share/cngplp2/"
    rm -r "${_dta}/z"
  fi

  if [ "${_opt_ppdlevel}" -ge 2 ]; then
    # PPD/Debian PPD/RPM Sources/*.gz are all the same PPD files
    # even more ppd files, no res files to be seen
    if [ "${_opt_RPM}" -ne 0 ]; then
      local _f
      for _f in PPD/RPM/cnrcup*.noarch.rpm; do
        bsdtar -C "${_dta}" -xf "${_f}"
      done
    else
      mkdir "${_dta}/z"
      local _f
      for _f in PPD/Debian/cnrcups*.deb; do
        bsdtar -C "${_dta}/z" -xf "${_f}"
        pushd "${_dta}/z" > /dev/null
        bsdtar -xf data.tar.?z
        popd > /dev/null
      done
      mv "${_dta}/z/usr/share/cups/model"/*.ppd "${_dta}/usr/share/cups/model/"
      rm -r "${_dta}/z"
    fi
  fi

  # Cleanup
  if [ "${_opt_RPM}" -ne 0 ]; then
    mv "${_dta}/usr/"{lib64,lib}
  else
    rm "${_dta}/debian-binary"

    # Do we want this setup tool?
    rm -r "${_dta}/usr/share/applications" "${_dta}/usr/share/cnsetuputil2"
  fi

  # License info
  install -d "${_dta}/usr/share/doc/${pkgbase}/"
  mv Documents/*.html "${_dta}/usr/share/doc/${pkgbase}/"
  install -d "${_dta}/usr/share/licenses/${pkgbase}/"
  mv Documents/*.txt "${_dta}/usr/share/licenses/${pkgbase}/"

  shopt -u nullglob
  set +u
}

package() {
  set -u
  mv dta/* "${pkgdir}"
  # grep -he '^*ModelName:' "${pkgdir}/usr/share/cups/model"/*.ppd | sort -u > "${startdir}/models.${_pkgver}-ex${_opt_ppdlevel}.txt"
  set +u
}
set +u
