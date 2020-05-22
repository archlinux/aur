# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Det <nimetonmaili g-mail>

set -u
_pkgname='jdk'
_major='10'
pkgname="${_pkgname}${_major}"
_minor='0.2'; _build='13'; _hash='19aef61b38124481863b1413dce1855f'
pkgver="${_major}.${_minor}"
pkgrel='1'
pkgdesc="Oracle Java ${_major} Development Kit"
pkgdesc+=' (public release - end of support)'
arch=('x86_64')
url='https://www.oracle.com/java/technologies/java-archive-javase10-downloads.html'
license=('custom:Oracle')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java-runtime-common' 'nss' 'xdg-utils')
depends+=('java-environment-common')
optdepends=(
  'alsa-lib: for basic sound support'
  'eclipse-java: to use "Oracle Java Mission Control" plugins in Eclipse'
  'gtk2: for Gtk+ look and feel (desktop)'
)
makedepends=('awk')
provides=(
  "java-runtime=${_major}"
  "java-runtime-headless=${_major}"
  "java-web-start=${_major}"
  "java-runtime-jre=${_major}"
  "java-runtime-headless-jre=${_major}"
  "java-web-start-jre=${_major}"
  "java-openjfx=${_major}"
  "java-environment-jdk=${_major}"
  "java-environment=${_major}"
)

# Variables

_jname="${_pkgname}${_major}"
_jvmdir="/usr/lib/jvm/java-${_major}-${_pkgname}"

#provides+=("${_jname}")
#conflicts=("${_jname}")

backup=(
  "etc/java-${_jname}/management/jmxremote.access"
  "etc/java-${_jname}/management/management.properties"
  "etc/java-${_jname}/security/java.policy"
  "etc/java-${_jname}/security/java.security"
  "etc/java-${_jname}/security/javaws.policy"
  "etc/java-${_jname}/logging.properties"
  "etc/java-${_jname}/net.properties"
  "etc/java-${_jname}/sound.properties"
)
options=('!strip') # JDK debug-symbols
install="${pkgname}.install"
_srcfil="${_pkgname}-${pkgver}_linux-x64_bin.tar.gz"
source=(
  'jconsole.desktop'
  "https://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/${_srcfil}"
  'jmc.desktop'
  'policytool.desktop'
  'readme.sh'
)
# from oracle-sqldeveloper
DLAGENTS+=("manual::${startdir:-}/readme.sh %o %u")
source[1]="manual://${_srcfil}"
if [ ! -z "${HOME:-}" ]; then # block mksrcinfo
  XDG_DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD 2>/dev/null)" || :
  if [ -z "${XDG_DOWNLOAD_DIR}" ]; then
    XDG_DOWNLOAD_DIR=~/'Downloads'
  fi
  if [ -s "${XDG_DOWNLOAD_DIR}/${_srcfil}" ] && [ ! -e "${_srcfil}" ]; then
    if type msg > /dev/null 2>&1; then
      set +u
      msg "Scooping files from ${XDG_DOWNLOAD_DIR}" 1>&2
      msg2 "${_srcfil}" 1>&2
      set -u
      ln -sr "${XDG_DOWNLOAD_DIR}/${_srcfil}"
    fi
  fi
fi
unset _srcfil
unset XDG_DOWNLOAD_DIR

md5sums=('ed1e8801db16b149247819c68fda97b1'
         '1cc0fa1d7f059978ae22a688dabcdc0b'
         '0a3c4277ac6aec5c633af98d54986fa9'
         'da29ac8f2d6b813ada985f6ee898005e'
         '51c8839211cc53f09c9b11a8e28ed1ef')
sha256sums=('7fd81eced792aa76dac697b3daaa5d2699b15e8c6768ed4690a331e9f616b034'
            '6633c20d53c50c20835364d0f3e172e0cbbce78fff81867488f22a6298fa372b'
            'bef07cdacef3e25137ac6ec394f09bb683c3ceb30b894f4b0c5ea40b0f87e4d5'
            '79fdffd1c3d6c0826a95d21e59392213c3a2e32709909629cfb4d222d349f2e1'
            'f1081b08cfbb467277e95b3794191c9963398579733fa8832425b308b5917711')

PKGEXT='.pkg.tar.gz' # much faster than .xz
## Alternative mirror, if your local one is throttled:
## Posting new sites does no good. They get taken down by the admin
## from too much traffic or complaints from Oracle.
#source[1]=???

DLAGENTS=("${DLAGENTS[@]// -gqb \"\"/ -gq}")
DLAGENTS=("${DLAGENTS[@]//curl -/curl -b 'oraclelicense=a' -}")

package() {
  set -u
  cd "${_pkgname}-${pkgver}"

  set +u; msg2 'Creating directory structure...'; set -u
  install -d "${pkgdir}/etc/.java/.systemPrefs"
  install -d "${pkgdir}/usr/lib/jvm/java-${_major}-${_pkgname}/bin"
  install -d "${pkgdir}/usr/lib/mozilla/plugins"
  install -d "${pkgdir}/usr/share/licenses/java${_major}-${_pkgname}"

  set +u; msg2 'Removing redundancies...'; set -u
  rm -r 'lib/desktop/icons/HighContrast'
  rm -r 'lib/desktop/icons/HighContrastInverse'
  rm -r 'lib/desktop/icons/LowContrast'
  rm    lib/fontconfig.*.bfc
  rm    lib/fontconfig.*.properties.src

  set +u; msg2 'Moving contents...'; set -u
  mv * "${pkgdir}/${_jvmdir}"

  # Cd to the new playground
  cd "${pkgdir}/${_jvmdir}"

  set +u; msg2 'Fixing directory structure...'; set -u
  # Create a placeholder 'jre' link
  ln -s . 'jre'

  # Fix .desktop paths
  sed -e "s|Exec=|Exec=${_jvmdir}/bin/|" \
      -e "s|.png|-${_jname}.png|" \
    -i 'lib/desktop/applications'/*

  # Move .desktops + icons to /usr/share
  mv 'lib/desktop'/* "${pkgdir}/usr/share/"
  install -m644 "${srcdir}"/*.desktop -t "${pkgdir}/usr/share/applications/"

  # Suffix .desktops + icons (sun-jcontrol.png -> sun-jcontrol-${_jname}.png)
  local _i
  for _i in $(find "${pkgdir}"/usr/share/ -type f); do
    rename -- "." "-${_jname}." "${_i}"
  done

  # Write versions to .desktops + .install
  sed -i "s/<version>/${_major}/" "${pkgdir}/usr/share/applications"/* "${startdir}/${pkgname}.install"

  # Link missing icons
  for _i in $(find "${pkgdir}"/usr/share/icons/ -name "sun-jcontrol-${_jname}.png" -type f); do
    ln -s "sun-jcontrol-${_jname}.png" "${_i/jcontrol/java}"
    ln -s "sun-jcontrol-${_jname}.png" "${_i/jcontrol/javaws}"
  done

  # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-${_jname}/conf -> /etc
  local _sub_path
  local _new_etc_path
  for _sub_path in $(find conf/ -type f); do
    # New location
    _new_etc_path="/etc/java-${_jname}/${_sub_path/conf\/}"

    # Move
    install -Dm644 "${_sub_path}" "${pkgdir}/${_new_etc_path}"
    ln -sf "${_new_etc_path}" "${_sub_path}"
  done

  # Link NPAPI plugin
  ln -s "${_jvmdir}/lib/libnpjp2.so" "${pkgdir}/usr/lib/mozilla/plugins/libnpjp2-${_jname}.so"

  # Replace JKS keystore with 'ca-certificates-java'
  ln -sf '/etc/ssl/certs/java/cacerts' 'lib/security/cacerts'

  # Move/link licenses
  mv legal/ "${pkgdir}/usr/share/licenses/java${_major}-${_pkgname}/"
  ln -s "/usr/share/licenses/java${_major}-${_pkgname}/" "${pkgdir}/usr/share/licenses/${pkgname}"

  set +u; msg2 'Enabling copy+paste in unsigned applets...'; set -u
  # Copy/paste from system clipboard to unsigned Java applets has been disabled since 6u24:
  # - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java
  # - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html
  local _text='\
         // (AUR) Allow unsigned applets to read system clipboard, see:
         // - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java
         // - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html
         permission java.awt.AWTPermission "accessClipboard";'
  local _lf=$'\n'
  _text="${_text//${_lf}/\\n}"
  local _line
  _line="$(awk '/permission/{a=NR}; END{print a}' "${pkgdir}/etc/java-${_jname}/security/java.policy")"
  sed -e "${_line} a ${_text}" -i "${pkgdir}/etc/java-${_jname}/security/java.policy"
  set +u
}
set +u
