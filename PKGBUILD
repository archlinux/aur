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
    _jsch_pkgver='0.2.5'
    _jsch_srcdir="${_jsch_libname}-${_jsch_libname}-${_jsch_pkgver}"
    #_jsch_srcdir="${_jsch_libname}-${_jsch_srcdir}"
    _source=("https://github.com/mwiede/jsch/archive/refs/tags/${_jsch_libname}-${_jsch_pkgver}.tar.gz")
    makedepends+=('maven')
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
pkgver='4.2.0.b2825'
# JSCH Updates https://github.com/mwiede/jsch/releases
pkgrel='1'
pkgdesc='hl7 connector by Nextgen'
arch=('x86_64')
url='https://www.nextgen.com/products-and-services/integration-engine'
_giturl='https://github.com/nextgenhealthcare/connect'
license=('MPL')
depends=("${_JRE}")
optdepends=(
  {mariadb,postgresql}': alternate database to derby'
)
backup=(
  "${_mirthhome#/}/conf/dbdrivers.xml"
  "${_mirthhome#/}/conf/log4j-cli.properties"
  "${_mirthhome#/}/conf/log4j.properties"
  "${_mirthhome#/}/conf/mirth-cli-config.properties"
  "${_mirthhome#/}/conf/mirth.properties"
)
install="${pkgname}.install"
_srcdir='Mirth Connect'
source=(
  "https://s3.amazonaws.com/downloads.mirthcorp.com/connect/${pkgver}/mirthconnect-${pkgver}-unix.tar.gz"
  '0000-mirth-disable-tls11.patch'
  '0000a-mirth-disable-SSLv2Hello.patch'
  "${_source[@]}"
)
md5sums=('4f3c0e5eaeed724d4e740de94d8636ee'
         '426de9435b21e90df7ae044510938270'
         '1acd364394ce76740ccea30f7133720f'
         'f8052fb1c6236ccc1e43c467f6fc0581'
         'b9e1b8f9395622ba548d7fd07cfd7c26'
         '093e7997245afcf04a598f4a9fa2ee14')
sha256sums=('9ab928069ec263edf76b168739e5091cbd864971c2af1be05a845d19660fd7a0'
            '4dc37b7ed9db5c9fcd74f45cd6197f6b631d74d3a30022bda6fda1c5900b7099'
            '2bdf62155ce4a2e51f33fa27aab7f9d6f5e5ff209c9f3691db4782c1f30fee5c'
            'dc1fa8ead27b464267a5b010afa4ad649f948e9a9e8cc657d65ffe9a33daa9d5'
            'f754da4581b5e390e13fc407ab9fc4cdc7f139585081929626be8569dae99ad9'
            'd1da7f180363924063cdc1f64c4fd049462f1cb02df0bf1ded2292c990e31bf2')

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
    #cd "${srcdir}"; cp -pr "${_jsch_srcdir}" 'a'; ln -s "${_jsch_srcdir}" 'b'; false
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
    # diff -pNaru5 'a' 'b' > '0000a-mirth-disable-SSLv2Hello.patch'
    patch -Nup1 -i "${srcdir}/0000a-mirth-disable-SSLv2Hello.patch"
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
