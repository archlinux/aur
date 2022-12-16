# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>

set -u
pkgname='jdk11'
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
pkgdesc="Oracle Java ${_major} Development Kit"
pkgdesc+=' LTS'
arch=('x86_64')
url='https://www.oracle.com/technetwork/java/javase/downloads/index.html'
license=('custom')
depends=('java-environment-common' "jre${_major}>=${pkgver}" 'zlib' 'hicolor-icon-theme')
provides=(
  "java-environment=${_major}"
  "java-environment-jdk=${_major}"
  "jdk=${pkgver}"
)
options=('!strip') # JDK debug-symbols
install="${pkgname}.install"
_srcfil="jdk-${pkgver}_linux-x64_bin.tar.gz"
source=(
  "https://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/${_srcfil}" # Now /otn/, Oracle sso required
  'java.desktop'
  'jconsole.desktop'
  'jshell.desktop'
  'java_16.png'
  'java_48.png'
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
         '985d0d81ece57d0ea633ccc1d3fd78ed'
         'fbd4ddd9069e48a65da6e0cb33db9bc1'
         'e59149780f4d1124f6e339611da9c70b'
         '6181f1ef1e5aeb637ef4cd593106beef'
         '1db7eb33e844d1a41bce196ab622da40'
         '51c8839211cc53f09c9b11a8e28ed1ef')
sha256sums=('ec4e2d98dae4a5342543b8c37cc764f9c0069d358522919c70ccde374fbe199a'
            '1052634cdcbf50ca14b864b58f3afa53de1706bdc9c593667c29974146212c54'
            '9a84d1b4dd969e867b2dbb6df0d0c44814729e0f1d0c61ab6c54d676eae83b3b'
            '73d686fd6e478a887a51451d7ada7c045f31ce299f65f45e50a793820ee99d85'
            'd27fec1d74f7a3081c3d175ed184d15383666dc7f02cc0f7126f11549879c6ed'
            '7cf8ca096e6d6e425b3434446b0835537d0fc7fe64b3ccba7a55f7bd86c7e176'
            'f1081b08cfbb467277e95b3794191c9963398579733fa8832425b308b5917711')

#PKGEXT='.pkg.tar.gz' # much faster than .xz

DLAGENTS=("${DLAGENTS[@]// -gqb \"\"/ -gq}")
DLAGENTS=("${DLAGENTS[@]//curl -/curl -b 'oraclelicense=a' -}")

package() {
  set -u
  cd "jdk-${pkgver}"

  local _jvmdir="/usr/lib/jvm/java-${_major}-jdk"

  install -d -m755 "${pkgdir}/${_jvmdir}"
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"

  # bin
  cp -a 'bin' "${pkgdir}/${_jvmdir}"
  rm "${pkgdir}/${_jvmdir}/bin/"{java,jjs,jrunscript,keytool,pack200}
  rm "${pkgdir}/${_jvmdir}/bin/"{rmid,rmiregistry,unpack200}

  # libs
  install -D -m644 'lib/ct.sym'       -t "${pkgdir}/${_jvmdir}/lib"
  install -D -m644 'lib/libattach.so' -t "${pkgdir}/${_jvmdir}/lib"
  install -D -m644 'lib/libsaproc.so' -t "${pkgdir}/${_jvmdir}/lib"
  cp -a 'lib/jfr' "${pkgdir}/${_jvmdir}/lib"

  cp -a 'include' "${pkgdir}/${_jvmdir}"
  cp -a 'jmods'   "${pkgdir}/${_jvmdir}"

  install -D -m644 'lib/src.zip' -t "${pkgdir}/${_jvmdir}/lib"

  # desktop and icons
  install -D -m644 "${srcdir}/java.desktop"     "${pkgdir}/usr/share/applications/java-java${_major}-jdk.desktop"
  install -D -m644 "${srcdir}/jconsole.desktop" "${pkgdir}/usr/share/applications/jconsole-java${_major}-jdk.desktop"
  install -D -m644 "${srcdir}/jshell.desktop"   "${pkgdir}/usr/share/applications/jshell-java${_major}-jdk.desktop"
  install -D -m644 "${srcdir}/java_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/java${_major}-jdk.png"
  install -D -m644 "${srcdir}/java_48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/java${_major}-jdk.png"

  # legal/licenses
  cp -a legal/* "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgname}" "${pkgdir}/usr/share/licenses/java${_major}-${pkgname}"
  set +u
}
set +u
