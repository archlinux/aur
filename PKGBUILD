# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

_mirthhome='/var/lib/mirthconnect'
_mirthgroup='mirthcon'
_mirthuser='mirthcon'
#_JVM='/usr/lib/jvm/java-8-jre/jre'; _JRE='jre8'
#_JVM='/usr/lib/jvm/java-11-openjdk'; _JRE='jre11-openjdk-headless' # errors
#_JVM='/usr/lib/jvm/java-11-openjdk'; _JRE='jdk11-openjdk-headless'
#_JVM='/usr/lib/jvm/java-16-openjdk'; _JRE='jre16-openjdk-headless' # too hard, not an LTS release
#_JVM='/usr/lib/jvm/java-18-openjdk';  _JRE='jre-openjdk-headless' # can't track with version changes

_source=()
if :; then
  _jsch_libname='jsch'
  _jsch_oldver='0.1.55'
  if :; then
    _JVM='/usr/lib/jvm/java-17-openjdk';  _JRE='jdk17-openjdk' # needed for all functionality of JSCH-0.2.0
    _jsch_pkgver='0.2.8'
    _jsch_srcdir="${_jsch_libname}-${_jsch_libname}-${_jsch_pkgver}"
    #_jsch_srcdir="${_jsch_libname}-${_jsch_srcdir}"
    _source=("https://github.com/mwiede/jsch/archive/refs/tags/${_jsch_libname}-${_jsch_pkgver}.tar.gz")
    makedepends+=('maven')
    # optdepends+=('bcprov: AEAD cipher chacha20-poly1305') # included in Mirth
  else
    _JVM='/usr/lib/jvm/java-8-openjdk'; _JRE='jdk8-openjdk' # sufficient for JSCH-0.1.55
    _jsch_pkgver='0.1.55'
    _jsch_srcdir="${_jsch_libname}-${_jsch_pkgver}"
    _source=("https://downloads.sourceforge.net/project/${_jsch_libname}/${_jsch_libname}/${_jsch_pkgver}/${_jsch_srcdir}.zip")
    makedepends+=('ant')
  fi
else
  _JVM='/usr/lib/jvm/java-8-openjdk/jre'; _JRE='jre8-openjdk-headless'
fi

set -u
pkgname='mirthconnect'
#pkgname+='-git'
#pkgver='3.12.0.b2650'
#pkgver='4.0.1.b293'
#pkgver='4.1.0.b2777'
#pkgver='4.1.1.b303'
#pkgver='4.2.0.b2825'
pkgver='4.3.0.b2886'
# JSCH Updates https://github.com/mwiede/jsch/releases
pkgrel='1'
pkgdesc='hl7 connector by Nextgen'
arch=('x86_64')
url='https://www.nextgen.com/products-and-services/integration-engine'
_giturl='https://github.com/nextgenhealthcare/connect'
license=('MPL')
depends=("${_JRE}")
optdepends+=(
  {mariadb,postgresql}': alternate database to derby'
)
backup=(
  "${_mirthhome#/}/conf/dbdrivers.xml"
  "${_mirthhome#/}/conf/log4j-cli.properties"
  "${_mirthhome#/}/conf/log4j.properties"
  "${_mirthhome#/}/conf/mirth-cli-config.properties"
  "${_mirthhome#/}/conf/mirth.properties"
)
options=('!strip')
install="${pkgname}.install"
_srcdir='Mirth Connect'
source=(
  "https://s3.amazonaws.com/downloads.mirthcorp.com/connect/${pkgver}/mirthconnect-${pkgver}-unix.tar.gz"
  '0000-mirth-disable-tls11.patch'
  '0000b-mirth-disable-SSLv2Hello.patch'
  "${_source[@]}"
)
md5sums=('a1df17adde65e1f8b60e7c5431fe9d9f'
         '426de9435b21e90df7ae044510938270'
         'f1b18ae896b93be65a2e9b276f12c16f'
         'fe9cfd419b481b805dc04c6df79d5597'
         'b9e1b8f9395622ba548d7fd07cfd7c26'
         '15600619ce3917f4443ddf610d553da2')
sha256sums=('22c153a199b021cdf6c75fc8e36298d955667ad36f86aa8c279fc6c758c6241e'
            '4dc37b7ed9db5c9fcd74f45cd6197f6b631d74d3a30022bda6fda1c5900b7099'
            '254c858572a4949c09726859d3f790d7bee535b8dbea184e4f6679d3b7c3b269'
            '8f7640becc127d15de4981feb48dd027a6e5094fc3666ff6143ab75cd21cdafc'
            'f754da4581b5e390e13fc407ab9fc4cdc7f139585081929626be8569dae99ad9'
            '28485f80f3a32ce73e063fb1efea9eef0df900f362ef8fae535b2f9ecb605088')

source+=(
  '0000-jsch-disable-md5-3des-cbc-dss-arcfour.patch'
  '0000-jsch-disable-enable-ssh-rsa.patch'
)
if [ ! -z "${_jsch_oldver:-}" ]; then
_jsch_prepare() {
  pushd "${srcdir}/${_jsch_srcdir}" > /dev/null

  if [ "$(vercmp "${_jsch_pkgver}" "0.1.55")" -le 0 ]; then
    #cd "${srcdir}"; cp -pr "${_jsch_srcdir}" 'a'; ln -s "${_jsch_srcdir}" 'b'; false
    # diff -pNaru5 'a' 'b' > '0000-jsch-disable-md5-3des-cbc-dss-arcfour.patch'
    patch -Nup1 -i "${srcdir}/0000-jsch-disable-md5-3des-cbc-dss-arcfour.patch"

    #pushd 'src/main/java/com/jcraft/jsch/jce' > /dev/null
    #rm -f *CBC* *TripleDES* 'KeyPairGenDSA.java' *ARCFOUR* *Blowfish* *MD5* 'SignatureDSA.java'
    #popd > /dev/null

    sed -E -e '/String VERSION/ s:".+":'"\"${_jsch_pkgver}-ArchMirth\":g" -i 'src/main/java/com/jcraft/jsch/JSch.java'
  fi
  if [ "$(vercmp "${_jsch_pkgver}" "0.2.0")" -ge 0 ]; then
    # pushd "${srcdir}"; cp -pr "${_jsch_srcdir}" 'a'; ln -s "${_jsch_srcdir}" 'b'; popd; false
    # diff -pNaru5 'a' 'b' > '0000-jsch-disable-enable-ssh-rsa.patch'
    patch -Nup1 -i "${srcdir}/0000-jsch-disable-enable-ssh-rsa.patch"
  fi

  popd > /dev/null
}

_jsch_build() {
  pushd "${srcdir}/${_jsch_srcdir}" > /dev/null
  if [ "$(vercmp "${_jsch_pkgver}" "0.1.55")" -le 0 ]; then
    JAVA_HOME="${_JVM}" \
    ant dist
  else
    JAVA_HOME="${_JVM}" \
    mvn package
  fi
  popd > /dev/null
}

_jsch_package() {
  pushd "${srcdir}/${_jsch_srcdir}" > /dev/null
  rm "${pkgdir}/${_mirthhome}/server-lib/${_jsch_libname}-${_jsch_oldver}.jar"
  install -Dm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.jcsh"
  if [ "$(vercmp "${_jsch_pkgver}" "0.1.55")" -le 0 ]; then
    cd 'dist/lib'
  else
    cd 'target'
  fi
  install -m644 "${_jsch_libname}-${_jsch_pkgver}.jar" "${pkgdir}/${_mirthhome}/server-lib/${_jsch_libname}-${_jsch_pkgver}.jar"
  popd > /dev/null
}
else
_jsch_prepare() { :; }
_jsch_build() { :; }
_jsch_package() { :; }
fi

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  source[0]="git+${_giturl}"
  makedepends+=('git')
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver%.r*}")
  _srcdir="${pkgname%-git}"
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g'
  set +u
}
elif [ "${pkgver%.r*}" != "${pkgver}" ]; then
pkgver() {
  echo "${pkgver%.r*}"
}
fi

prepare() {
  set -u
  cd "${_srcdir}"
  sed -e "/^# INSTALL4J_JAVA_HOME_OVERRIDE=/ a INSTALL4J_JAVA_HOME_OVERRIDE='${_JVM}'" -i 'mccommand' 'mcmanager' 'mcserver' 'mcservice'

  chmod 700 'conf' # contains cleartext passwords

  shopt -s nullglob
  local _fal=(conf/* 'docs/mcservice-java9+.vmoptions' docs/*.txt)
  local _fa
  readarray -t _fa < <(grep -l -e $'\r' /dev/null "${_fal[@]}")
  if [ "${#_fa[@]}" -gt 0 ]; then
    printf 'CR fix %s\n' "${_fa[@]}"
    sed -e 's:\r::g' -i "${_fa[@]}"
  fi
  local _f
  for _f in "${_fal[@]}"; do
    if [ "$(tail -c1 "${_f}" | od -t x1 | head -1 | cut -d' ' -f2)" != '0a' ]; then
      printf 'LF fix %s\n' "${_f}"
      echo >> "${_f}"
    fi
  done
  shopt -u nullglob

  # Why all the fiddly little changes?
  sed -e 's:= $:=:g' -i 'conf/mirth.properties'

  if grep -q -F -e 'TLSv1.1' 'conf/mirth.properties'; then
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    # diff -pNaru5 'a' 'b' > '0000-mirth-disable-tls11.patch'
    patch -Nup1 -i "${srcdir}/0000-mirth-disable-tls11.patch"
  elif grep -q -F -e 'SSLv2Hello' 'conf/mirth.properties'; then
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    # diff -pNaru5 'a' 'b' > '0000b-mirth-disable-SSLv2Hello.patch'
    patch -Nup1 -i "${srcdir}/0000b-mirth-disable-SSLv2Hello.patch"
  fi

  _jsch_prepare
  set +u
}

build() {
  set -u
  _jsch_build
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -d "${pkgdir}/${_mirthhome}/"
  cp -pr . "${pkgdir}/${_mirthhome}"
  if [[ "${_JVM}" =~ [0-9]+ ]]; then
    if [ "${BASH_REMATCH}" -ge 9 ]; then
      pushd "${pkgdir}/${_mirthhome}" > /dev/null
      local _v
      for _v in *.vmoptions; do
        cat 'docs/mcservice-java9+.vmoptions' >> "${_v}"
      done
      popd > /dev/null
    fi
  fi
  _jsch_package

  if :; then
    local _f
    install -d "${pkgdir}/usr/lib/${pkgname}/"
    for _f in cli-lib client-lib docs extensions manager-lib public_api_html public_html server-lib webapps; do
      mv "${pkgdir}/${_mirthhome}/${_f}" "${pkgdir}/usr/lib/${pkgname}/${_f}"
      ln -s "/usr/lib/${pkgname}/${_f}" "${pkgdir}/${_mirthhome}/${_f}"
    done
    install -d "${pkgdir}/etc/"
    ln -s "${_mirthhome}/conf" "${pkgdir}/etc/${pkgname}"
  fi

  # systemd service
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=${pkgdesc}
After=network.target

[Service]
Type=simple
ExecStart=${_mirthhome}/mcserver
RemainAfterExit=yes
Group=${_mirthgroup}
User=${_mirthuser}

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  # Generate amended install
  bash -n "${startdir}/${install}" || echo "${}"
  true && install="${install}.pkg"
  rm -f "${startdir}/${install}"
  cat - <<<"
# Do not modify this copy

_mirthhome='"${_mirthhome}"'
_mirthgroup='"${_mirthgroup}"'
_mirthuser='"${_mirthuser}"'

" "${startdir}/${install%.pkg}" > "${startdir}/${install}"
  bash -n "${startdir}/${install}" || echo "${}"

  set +u
}
set +u
