# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>

# TODO: invalid symlink /usr/lib/jvm/java-11-jdk/conf

set -u
pkgname='jre11'
pkgver='11.0.3'; _build='12'; _hash='37f5e150db5247ab9333b11c1dddcd30'
_major="${pkgver%%.*}"
pkgrel='1'
pkgdesc="Oracle Java ${_major} Development Kit"
arch=('x86_64')
url='https://www.oracle.com/java/'
license=('custom')
depends=('java-runtime-common' 'ca-certificates-utils' 'freetype2' 'libxtst'
         'libxrender' 'libnet')
optdepends=('alsa-lib: for basic sound support')
provides=("java-runtime=${_major}" "java-runtime-headless=${_major}"
          "java-runtime-jre=${_major}" "java-runtime-headless-jre=${_major}" "jre=${pkgver}")
backup=("etc/java${_major}-jre/management/jmxremote.access"
        "etc/java${_major}-jre/management/jmxremote.password.template"
        "etc/java${_major}-jre/management/management.properties"
        "etc/java${_major}-jre/security/policy/limited/default_US_export.policy"
        "etc/java${_major}-jre/security/policy/limited/default_local.policy"
        "etc/java${_major}-jre/security/policy/limited/exempt_local.policy"
        "etc/java${_major}-jre/security/policy/unlimited/default_US_export.policy"
        "etc/java${_major}-jre/security/policy/unlimited/default_local.policy"
        "etc/java${_major}-jre/security/policy/README.txt"
        "etc/java${_major}-jre/security/java.policy"
        "etc/java${_major}-jre/security/java.security"
        "etc/java${_major}-jre/logging.properties"
        "etc/java${_major}-jre/net.properties"
        "etc/java${_major}-jre/sound.properties")
install="${pkgname}.install"
_srcfil="jdk-${pkgver}_linux-x64_bin.tar.gz"
source=(
  "https://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/${_srcfil}"
  'readme.sh'
)
# from oracle-sqldeveloper
DLAGENTS+=("manual::${startdir:-}/readme.sh %o %u")
source[0]="manual://${_srcfil}"
if [ -s ~/"Downloads/${_srcfil}" ] && [ ! -e "${_srcfil}" ]; then
  if type msg > /dev/null 2>&1; then
    set +u
    msg "Scooping files from ~/Downloads"
    msg2 "${_srcfil}"
    set -u
    ln -sr ~/"Downloads/${_srcfil}"
  fi
fi
unset _srcfil
md5sums=('6d5fd10897d65e053bb69ed9a032211a'
         '4dda444d58a4d78ca6357228adbde8a2')
sha256sums=('d50908ea53c2ad154a797aa0930eafb7813247dae13d9d891116df889814ebf3'
            'd1b4b3161614d7620365a0528a86f7eec543de30ee756b1ad2dabd386e84f734')

PKGEXT='.pkg.tar.gz' # much faster than .xz

DLAGENTS=("${DLAGENTS[@]// -gqb \"\"/ -gq}")
DLAGENTS=("${DLAGENTS[@]//curl -/curl -b 'oraclelicense=a' -}")

package() {
  set -u
  cd "jdk-${pkgver}"

  local _jvmdir="/usr/lib/jvm/java-${_major}-jdk"

  install -d -m755 "${pkgdir}/etc"
  install -d -m755 "${pkgdir}/${_jvmdir}"
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"

  # conf
  cp -a 'conf' "${pkgdir}/etc/java${_major}-jre"
  ln -s "../../../../etc/java${_major}-${pkgname}" "${pkgdir}/${_jvmdir}/conf"

  # bin
  install -D -m755 bin/{java,jjs,jrunscript,keytool,pack200} -t "${pkgdir}/${_jvmdir}/bin"
  install -D -m755 bin/{rmid,rmiregistry,unpack200}          -t "${pkgdir}/${_jvmdir}/bin"

  # libs
  cp -a 'lib' "${pkgdir}/${_jvmdir}"
  rm -r "${pkgdir}/${_jvmdir}/lib/jfr"
  rm "${pkgdir}/${_jvmdir}/lib/"{ct.sym,libattach.so,libsaproc.so,src.zip}

  install -D -m644 'release' -t "${pkgdir}/${_jvmdir}"

  # replace JKS keystore with ca-certificates-utils
  rm "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -s '/etc/ssl/certs/java/cacerts' "${pkgdir}${_jvmdir}/lib/security/cacerts"

  # legal/licenses
  cp -a legal/* "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgname}" "${pkgdir}/usr/share/licenses/java${_major}-${pkgname}"
  ln -s "../../../share/licenses/${pkgname}" "${pkgdir}/${_jvmdir}/legal"
  set +u
}
set +u
