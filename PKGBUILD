# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>

set -u
pkgname='jre11'
#pkgver='11.0.3'; _build='12'; _hash='37f5e150db5247ab9333b11c1dddcd30'
#pkgver='11.0.4'; _build='10'; _hash='cf1bbcbf431a474eb9fc550051f4ee78'
#pkgver='11.0.5'; _build='10'; _hash='e51269e04165492b90fa15af5b4eb1a5'
#pkgver='11.0.6'; _build='8'; _hash='90eb79fb590d45c8971362673c5ab495'
#pkgver='11.0.7'; _build='8'; _hash='8c7daf89330c48f0b9e32f57169f7bac'
#pkgver='11.0.8'; _build='10'; _hash='dc5cf74f97104e8eac863698146a7ac3'
#pkgver='11.0.9'; _build='7'; _hash='eec35ebefb3f4133bd045b891f05db94'
#pkgver='11.0.10'; _build='8'; _hash='020c4a6d33b74f6a9d2bc6fbf189da81'
#pkgver='11.0.11'; _build='9'; _hash='ab2da78f32ed489abb3ff52fd0a02b1c'
#pkgver='11.0.12'; _build='8'; _hash='f411702ca7704a54a79ead0c2e0942a3'
#pkgver='11.0.13'; _build='10'; _hash='bdde8881e2e3437baa70044f884d2d67'
#pkgver='11.0.14'; _build='8'; _hash='7e5bbbfffe8b45e59d52a96aacab2f04'
#pkgver='11.0.15.1'; _build='2'; _hash='d76aabb62f1c47aa8588b9ae5a8a5b46'
pkgver='11.0.17'; _build='10'; _hash='8bd089539add49a9b99e2f27eb0c4329'
_major="${pkgver%%.*}"
pkgrel='1'
pkgdesc="Oracle Java ${_major} Runtime Environment"
pkgdesc+=' LTS'
arch=('x86_64')
url='https://www.oracle.com/technetwork/java/javase/downloads/index.html'
license=('custom')
depends=('java-runtime-common' 'ca-certificates-utils' 'freetype2' 'libxtst'
         'libxrender' 'libnet')
optdepends=(
  'alsa-lib: for basic sound support'
)
provides=(
  "java-runtime=${_major}"
  "java-runtime-headless=${_major}"
  "java-runtime-jre=${_major}"
  "java-runtime-headless-jre=${_major}"
  "jre=${pkgver}"
)
backup=(
  "etc/java${_major}-jre/management/jmxremote.access"
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
  "etc/java${_major}-jre/sound.properties"
)
options=('!strip') # JDK debug-symbols
install="${pkgname}.install"
_srcfil="jdk-${pkgver}_linux-x64_bin.tar.gz"
source=(
  "https://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/${_srcfil}" # Now /otn/, Oracle sso required
  'readme.sh'
)
# from oracle-sqldeveloper
DLAGENTS+=("manual::${startdir:-}/readme.sh %o %u")
source[0]="manual://${_srcfil}"
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

md5sums=('292acca92d6ed9677ccc481254ae052b'
         '51c8839211cc53f09c9b11a8e28ed1ef')
sha256sums=('ec4e2d98dae4a5342543b8c37cc764f9c0069d358522919c70ccde374fbe199a'
            'f1081b08cfbb467277e95b3794191c9963398579733fa8832425b308b5917711')

#PKGEXT='.pkg.tar.gz' # much faster than .xz

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
  ln -s "../../../../etc/java${_major}-jre" "${pkgdir}/${_jvmdir}/conf"

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
