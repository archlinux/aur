# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: isiachi <isiachi@rhyeworld.it>

set -u
_pkgname='jdk'
_major='7'
pkgname="${_pkgname}${_major}"
_minor='80'; _build='b15'
pkgver="${_major}u${_minor}"
pkgrel='1'
pkgdesc="Oracle Java ${_major} Development Kit (public release - end of support)"
arch=('x86_64')
#url='https://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html'
url='https://www.oracle.com/technetwork/java/archive-139210.html'
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
_srcfil="${_pkgname}-${pkgver}-linux-x64.tar.gz"
source=(
  "https://download.oracle.com/otn-pub/java/jce/${_major}/UnlimitedJCEPolicyJDK${_major}.zip"
  "https://download.oracle.com/otn/java/jdk/${pkgver}-${_build}/${_srcfil}" # Now /otn/, Oracle sso required
  "jconsole-${_jname}.desktop"
  "jmc-${_jname}.desktop"
  "jvisualvm-${_jname}.desktop"
  "policytool-${_jname}.desktop"
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
unset _srcfil
unset XDG_DOWNLOAD_DIR

md5sums=('c47e997b90ddfd0d813a37ccc97fb933'
         '6152f8a7561acf795ca4701daa10a965'
         'c72336327d7cefadf4ffd74c014c7c2e'
         'ac3f149795f62cdf5bdfdd6061fb8184'
         '1b692eac219a0b34fd7ec13f09cea078'
         'daf7f23efea899b8c575145d1eb73aab'
         '51c8839211cc53f09c9b11a8e28ed1ef')
sha256sums=('7a8d790e7bd9c2f82a83baddfae765797a4a56ea603c9150c87b7cdb7800194d'
            'bad9a731639655118740bee119139c1ed019737ec802a630dd7ad7aab4309623'
            'd7a0a1eb18c0ba53b2e3b82e9e0f8b92b13cea87fe760d6152d375ed6dbac872'
            '6af8c0099bb66443adfe7ababe110abec0c3ed1fa06b1d9704e92c5d3b7b5a4c'
            '52fc7afe1bfb5fc899153fe105bf61b42be7d187a1703b8ef18979441450a6c3'
            '1a0d1c832612c9f52f703f8cf69ce117ea900d2b1f28ed9324e08e73482c8262'
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
  cd "${_pkgname}1.${_major}.0_${_minor}"

  set +u; msg2 'Creating directory structure...'; set -u
  install -d "${pkgdir}/etc/.java/.systemPrefs"
  install -d "${pkgdir}/usr/lib/jvm/java-${_major}-${_pkgname}/bin"
  install -d "${pkgdir}/usr/lib/mozilla/plugins"
  install -d "${pkgdir}/usr/share/licenses/java${_major}-${_pkgname}"

  set +u; msg2 'Removing redundancies...'; set -u
  rm    db/bin/*.bat
  rm    'db/3RDPARTY'
  rm    'db/LICENSE'
  pushd 'jre' > /dev/null
  rm -r 'lib/desktop/icons/HighContrast/'
  rm -r 'lib/desktop/icons/HighContrastInverse/'
  rm -r 'lib/desktop/icons/LowContrast/'
  rm    lib/fontconfig.*.bfc
  rm    lib/fontconfig.*.properties.src
  rm    *.txt
  rm    'COPYRIGHT'
  rm    'LICENSE'
  rm    'README'
  rm -r 'plugin/'
  popd > /dev/null
  rm    'man/ja'

  set +u; msg2 'Moving contents...'; set -u
  mv * "${pkgdir}/${_jvmdir}"

  # Cd to the new playground
  cd "${pkgdir}/${_jvmdir}"

  set +u; msg2 'Fixing directory structure...'; set -u
  # Replace duplicate binaries in bin/ with links to jre/bin/
  local _i
  for _i in jre/bin/*; do
    ln -sf "${_jvmdir}/jre/bin/${_i##*/}" "bin/${_i##*/}"
  done

  # Suffix .desktops + icons (sun-java.png -> sun-java-${_jname}.png)
  local _i
  for _i in $(find 'jre/lib/desktop/' -type 'f'); do
    rename -- '.' "-${_jname}." "${_i}"
  done

  # Fix .desktop files
  sed -e '/JavaWS/! s|Name=Java|Name=Java '"${_major}"'|' \
      -e "s|Name=JavaWS|Name=JavaWS ${_major}|" \
      -e "s|Comment=Java|Comment=Java ${_major}|" \
      -e "s|Exec=|Exec=${_jvmdir}/bin/|" \
      -e "s|.png|-${_jname}.png|" \
    -i 'jre/lib/desktop/applications'/*

  # Move .desktops + icons to /usr/share
  mv 'jre/lib/desktop'/* "${pkgdir}/usr/share/"
  install -m644 "${srcdir}"/*.desktop -t "${pkgdir}/usr/share/applications/"

  # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-${_jname}/jre/lib -> /etc
  local _new_etc_path
  for _new_etc_path in "${backup[@]}"; do
    # Old location
    local _old_usr_path="jre/lib/${_new_etc_path#*${_jname}/}"

    # Move
    install -Dm644 "${_old_usr_path}" "${pkgdir}/${_new_etc_path}"
    ln -sf "/${_new_etc_path}" "${_old_usr_path}"
  done

  # Link NPAPI plugin
  ln -s "${_jvmdir}/jre/lib/amd64/libnpjp2.so" "${pkgdir}/usr/lib/mozilla/plugins/libnpjp2-${_jname}.so"

  # Replace JKS keystore with 'ca-certificates-java'
  ln -sf '/etc/ssl/certs/java/cacerts' 'jre/lib/security/cacerts'

  # Suffix man pages
  for _i in $(find 'man/' -type 'f'); do
    mv "${_i}" "${_i/.1}-${_jname}.1"
  done

  # Move man pages
  mv 'man/ja_JP.UTF-8/' 'man/ja'
  mv 'man/' "${pkgdir}/usr/share"

  # Move/link licenses
  mv 'db/NOTICE' 'COPYRIGHT' 'LICENSE' *.txt "${pkgdir}/usr/share/licenses/java${_major}-${_pkgname}/"
  ln -s "/usr/share/licenses/java${_major}-${_pkgname}/" "${pkgdir}/usr/share/licenses/${pkgname}"

  set +u; msg2 'Installing Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files...'; set -u
  # Replace default "strong", but limited, cryptography to get an "unlimited strength" one for
  # things like 256-bit AES. Enabled by default in OpenJDK:
  # - http://suhothayan.blogspot.com/2012/05/how-to-install-java-cryptography.html
  # - http://www.eyrie.org/~eagle/notes/debian/jce-policy.html
  install -m644 "${srcdir}/UnlimitedJCEPolicy"/*.jar 'jre/lib/security/'
  install -Dm644 "${srcdir}/UnlimitedJCEPolicy/README.txt" \
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
