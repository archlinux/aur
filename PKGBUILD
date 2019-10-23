# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: Det
# Contributors: Ethan Hall, Guillaume ALAUX, Daniel J Griffiths, Jason Chu, Geoffroy Carrier, Thomas Dziedzic, Dan Serban

set -u
_pkgname='jre'
_major='6'
pkgname="${_pkgname}${_major}"
_minor='45'; _build='b06'
pkgver="${_major}u${_minor}"
pkgrel='4'
pkgdesc="Oracle Java ${_major} Runtime Environment (public release - end of support)"
arch=('x86_64')
url='https://www.oracle.com/technetwork/java/archive-139210.html'
url="https://www.java.com/en/download/faq/java_${_major}.xml"
license=('custom:Oracle')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java-runtime-common' 'nss' 'xdg-utils')
optdepends=(
  'alsa-lib: for basic sound support'
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
)

# Variables

_jname="${_pkgname}${_major}"
_jvmdir="/usr/lib/jvm/java-${_major}-${_pkgname}/${_pkgname}"

backup=(
  "etc/java-${_jname}/amd64/jvm.cfg"
  "etc/java-${_jname}/images/cursors/cursors.properties"
  "etc/java-${_jname}/management/jmxremote.access"
  "etc/java-${_jname}/management/management.properties"
  "etc/java-${_jname}/security/java.policy"
  "etc/java-${_jname}/security/java.security"
  "etc/java-${_jname}/security/javaws.policy"
  "etc/java-${_jname}/content-types.properties"
  "etc/java-${_jname}/flavormap.properties"
  "etc/java-${_jname}/fontconfig.properties.src"
  "etc/java-${_jname}/logging.properties"
  "etc/java-${_jname}/net.properties"
  "etc/java-${_jname}/psfont.properties.ja"
  "etc/java-${_jname}/psfontj2d.properties"
  "etc/java-${_jname}/sound.properties"
)
options=('!strip') # JDK debug-symbols
install="${pkgname}.install"
_srcfil="${_pkgname}-${pkgver}-linux-x64.bin"
source=(
  "https://download.oracle.com/otn-pub/java/jce_policy/${_major}/jce_policy-${_major}.zip"
  "https://download.oracle.com/otn/java/jdk/${pkgver}-${_build}/${_srcfil}" # Now /otn/, Oracle sso required
  "policytool-${_jname}.desktop"
  'javaws-launcher'
  'readme.sh'
)
# from oracle-sqldeveloper
DLAGENTS+=("manual::${startdir:-}/readme.sh %o %u")
source[1]="manual://${_srcfil}"
if [ ! -z "${HOME:-}" ]; then # block mksrcinfo
  XDG_DOWNLOAD_DIR=~/'Downloads'; source <(grep -Ee '^XDG_DOWNLOAD_DIR="[^"]+"$' ~/'.config/user-dirs.dirs' 2> /dev/null || :)
  if [ -s "${XDG_DOWNLOAD_DIR}/${_srcfil}" ] && [ ! -e "${_srcfil}" ]; then
    if type msg > /dev/null 2>&1; then
      set +u
      msg "Scooping files from ${XDG_DOWNLOAD_DIR}"
      msg2 "${_srcfil}"
      set -u
      ln -sr "${XDG_DOWNLOAD_DIR}/${_srcfil}"
    fi
  fi
fi
#unset _srcfil
unset XDG_DOWNLOAD_DIR
noextract=("${_srcfil}") # bsdtar does not extract everything
md5sums=('b20f9d6ed14e55d73a5ed204bca01e7a'
         '4a4569126f05f525f48bacf761f7185c'
         '1ae1bd8b6f12af6c30a2558a39da0fe4'
         '45c15a6b4767288f2f745598455ea2bf'
         '51c8839211cc53f09c9b11a8e28ed1ef')
sha256sums=('d0c2258c3364120b4dbf7dd1655c967eee7057ac6ae6334b5ea8ceb8bafb9262'
            '7f656c723a988b2f2f71d116bb572dd01b9b38f6394fc03f349d627c487199ff'
            'd822f6587ac9b1f3992303ecde3d2065d2c546dc2a153e19e35dc717fdb8b850'
            '5a43bf54553ea39c147a67935d68646806a5053fefd527bd69c546f4c884402e'
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
  local _srcdir="${_pkgname}1.${_major}.0_${_minor}"

  set +u; msg2 "Extracting SFX ${_srcfil}"; set -u
  rm -rf "${_srcdir}"
  RPM_NAME='' sh -u -e "${_srcfil}" | grep -Fve ':'
  cd "${_srcdir}"

  set +u; msg2 'Creating directory structure...'; set -u
  install -d "${pkgdir}/etc/.java/.systemPrefs"
  install -d "${pkgdir}/usr/lib/jvm/java-${_major}-${_pkgname}/${_pkgname}/bin"
  install -d "${pkgdir}/usr/lib/mozilla/plugins"
  install -d "${pkgdir}/usr/share/licenses/java${_major}-${_pkgname}"

  set +u; msg2 'Removing redundancies...'; set -u
  rm -r 'lib/desktop/icons/HighContrast/'
  rm -r 'lib/desktop/icons/HighContrastInverse/'
  rm -r 'lib/desktop/icons/LowContrast/'
  rm    lib/fontconfig.*.bfc
  rm    lib/fontconfig.*.properties.src
  rm -r 'plugin/'
  rm    'man/ja'

  set +u; msg2 'Moving contents...'; set -u
  mv * "${pkgdir}/${_jvmdir}"

  # Cd to the new playground
  cd "${pkgdir}/${_jvmdir}"

  # javaws-launcher
  install -m644 "${srcdir}/javaws-launcher" 'bin/'

  set +u; msg2 'Fixing directory structure...'; set -u
  # Suffix .desktops + icons (sun-java.png -> sun-java-${_jname}.png)
  local _i
  for _i in $(find 'lib/desktop/' -type 'f'); do
    rename -- '.' "-${_jname}." "${_i}"
  done

  # Fix .desktop files
  sed -e '/JavaWS/! s|Name=Java|Name=Java '"${_major}"'|' \
      -e "s|Name=JavaWS|Name=JavaWS ${_major}|" \
      -e "s|Comment=Java|Comment=Java ${_major}|" \
      -e "s|Exec=|Exec=${_jvmdir}/bin/|" \
      -e "s|.png|-${_jname}.png|" \
    -i 'lib/desktop/applications'/*

  # Move .desktops + icons to /usr/share
  mv 'lib/desktop'/* "${pkgdir}/usr/share/"
  install -m644 "${srcdir}"/*.desktop -t "${pkgdir}/usr/share/applications/"

  # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-${_jname}/lib -> /etc
  local _new_etc_path
  for _new_etc_path in "${backup[@]}"; do
    # Old location
    local _old_usr_path="lib/${_new_etc_path#*${_jname}/}"

    # Move
    install -Dm644 "${_old_usr_path}" "${pkgdir}/${_new_etc_path}"
    ln -sf "/${_new_etc_path}" "${_old_usr_path}"
  done

  # Link NPAPI plugin
  ln -s "${_jvmdir}/lib/amd64/libnpjp2.so" "${pkgdir}/usr/lib/mozilla/plugins/libnpjp2-${_jname}.so"

  # Replace JKS keystore with 'ca-certificates-java'
  ln -sf '/etc/ssl/certs/java/cacerts' 'lib/security/cacerts'

  # Suffix man pages
  for _i in $(find 'man/' -type 'f'); do
    mv "${_i}" "${_i/.1}-${_jname}.1"
  done

  # Move man pages
  mv 'man/ja_JP.eucJP/' 'man/ja'
  mv 'man/' "${pkgdir}/usr/share"

  # Move/link licenses
  mv 'COPYRIGHT' 'LICENSE' 'README' *.txt "${pkgdir}/usr/share/licenses/java${_major}-${_pkgname}/"
  ln -s "/usr/share/licenses/java${_major}-${_pkgname}/" "${pkgdir}/usr/share/licenses/${pkgname}"

  set +u; msg2 'Installing Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files...'; set -u
  # Replace default "strong", but limited, cryptography to get an "unlimited strength" one for
  # things like 256-bit AES. Enabled by default in OpenJDK:
  # - http://suhothayan.blogspot.com/2012/05/how-to-install-java-cryptography.html
  # - http://www.eyrie.org/~eagle/notes/debian/jce-policy.html
  install -m644 "${srcdir}/jce"/*.jar 'lib/security/'
  install -Dm644 "${srcdir}/jce/README.txt" \
                 "${pkgdir}/usr/share/doc/${pkgname}/README_-_Java_JCE_Unlimited_Strength.txt"

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
