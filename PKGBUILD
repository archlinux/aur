# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Det <nimetonmaili g-mail>
# Contributors: Charles Ghislain, Guillaume ALAUX, Daniel J Griffiths, Jason Chu, Geoffroy Carrier,
#               Army, kfgz, Thomas Dziedzic, Dan Serban, jjacky, EasySly

set -u
_pkgname='jre'
_major='8'
pkgname="${_pkgname}${_major}"
_minor='201'; _build='b09'; _hash='42970487e3af4f5aa5bca3f542482c60'
pkgver="${_major}u${_minor}"
pkgrel='1'
pkgdesc="Oracle Java ${_major} Runtime Environment"
arch=('x86_64')
url='http://www.oracle.com/technetwork/java/javase/downloads/index.html'
license=('custom:Oracle')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java-runtime-common' 'nss' 'xdg-utils')
optdepends=('alsa-lib: for basic sound support'
            'gtk2: for Gtk+ look and feel (desktop)')
provides=("java-runtime=${_major}" "java-runtime-headless=${_major}" "java-web-start=${_major}"
          "java-runtime-jre=${_major}" "java-runtime-headless-jre=${_major}" "java-web-start-jre=${_major}"
          "java-openjfx=${_major}")

# Variables
DLAGENTS=("${DLAGENTS[@]//curl -/curl -b 'oraclelicense=a' -}")
_jname="${_pkgname}${_major}"
_jvmdir="/usr/lib/jvm/java-${_major}-${_pkgname}/${_pkgname}"

backup=("etc/java-${_jname}/amd64/jvm.cfg"
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
        "etc/java-${_jname}/sound.properties")
options=('!strip')
install="${pkgname}.install"
source=(
  "https://download.oracle.com/otn-pub/java/jce/${_major}/jce_policy-${_major}.zip"
  "https://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/${_hash}/${_pkgname}-${pkgver}-linux-x64.tar.gz"
  "policytool-${_jname}.desktop"
)
md5sums=('b3c7031bc65c28c2340302065e7d00d3'
         '2514535d8bca385cc349c5d8a8cf9957'
         'ef3ff483db5d38ed106e0b819006bdae')
sha256sums=('f3020a3922efd6626c2fff45695d527f34a8020e938a49292561f18ad1320b59'
            '12c745fbb8735bf450b8c6ba6f649bebe19915f05742975e443bdc8566170352'
            '614b2a74b53728b7914c1407126a7ecfed781a79fb11e9963528c7cad39dbca8')
## Alternative mirror, if your local one is throttled:
#source[0]=("http://ftp.wsisiz.edu.pl/pub/pc/pozyteczne%20oprogramowanie/java/${_pkgname}-${pkgver}-linux-x64.gz")

package() {
  set -u
  cd "${_pkgname}1.${_major}.0_${_minor}"

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

  set +u; msg2 'Fixing directory structure...'; set -u
  # Suffix .desktops + icons (sun-java.png -> sun-java-${_jname}.png)
  local _i
  for _i in $(find 'lib/desktop/' -type 'f'); do
    rename -- '.' "-${_jname}." "${_i}"
  done

  # Fix .desktop paths
  sed -e "s|Exec=|Exec=${_jvmdir}/bin/|" \
      -e "s|.png|-${_jname}.png|" \
    -i 'lib/desktop/applications'/*

  # Move .desktops + icons to /usr/share
  mv 'lib/desktop'/* "${pkgdir}/usr/share/"
  install -m644 "${srcdir}"/*.desktop "${pkgdir}/usr/share/applications/"

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
    rename -- '.1' "-${_jname}.1" "${_i}"
  done

  # Move man pages
  mv 'man/ja_JP.UTF-8/' 'man/ja'
  mv 'man/' "${pkgdir}/usr/share"

  # Move/link licenses
  mv 'COPYRIGHT' 'LICENSE' 'README' *.txt "${pkgdir}/usr/share/licenses/java${_major}-${_pkgname}/"
  ln -s "/usr/share/licenses/java${_major}-${_pkgname}/" "${pkgdir}/usr/share/licenses/${pkgname}"

  set +u; msg2 'Installing Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files...'; set -u
  # Replace default "strong", but limited, cryptography to get an "unlimited strength" one for
  # things like 256-bit AES. Enabled by default in OpenJDK:
  # - http://suhothayan.blogspot.com/2012/05/how-to-install-java-cryptography.html
  # - http://www.eyrie.org/~eagle/notes/debian/jce-policy.html
  install -m644 "${srcdir}/UnlimitedJCEPolicyJDK${_major}"/*.jar 'lib/security/'
  install -Dm644 "${srcdir}/UnlimitedJCEPolicyJDK${_major}/README.txt" \
                 "${pkgdir}/usr/share/doc/${_pkgname}/README_-_Java_JCE_Unlimited_Strength.txt"

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
