# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

_JVM=''; _JRE='glibc' # built in jre. This works best with 3.0.1 and 3.12.0 servers
#_JVM='/usr/lib/jvm/java-11-openjdk'; _JRE='jre11-openjdk' # doesn't work
#_JVM='/usr/lib/jvm/java-8-jre/jre'; _JRE='jre8'
#_JVM='/usr/lib/jvm/java-8-openjdk/jre'; _JRE='jre8-openjdk' # doesn't work
#_JVM='/usr/lib/jvm/java-7-jre/jre'; _JRE='jre7' # too old, not compatible

set -u
pkgname='mirth-connect-administrator-launcher'
pkgver='1.4.2'
pkgrel='1'
pkgdesc='hl7 connector by Nextgen client'
arch=('x86_64')
url='https://www.nextgen.com/products-and-services/integration-engine'
license=('Apache-2.0')
depends=("${_JRE}")
options=('!strip')
_srcdir='Mirth Connect Administrator Launcher'
source=(
  "https://s3.amazonaws.com/downloads.mirthcorp.com/connect-client-launcher/mirth-administrator-launcher-${pkgver}-unix.tar.gz"
  '0000-mirth-connector-enable-DH768.patch'
)
md5sums=('0a4e295479b3759fa97d14d052124755'
         'ff479eaafa09a22efcd7c12bb04ef886')
sha256sums=('b12191ee3f208ae4516403fb3b85f8307edad12eb5917b619827b6b373178093'
            '591f6761809493519051fb49513200bf58392d594d91ab5151607ec293260177')

prepare() {
  set -u
  cd "${_srcdir}"
  if [ ! -z "${_JVM}" ]; then
    sed -e "/^# INSTALL4J_JAVA_HOME_OVERRIDE=/ a INSTALL4J_JAVA_HOME_OVERRIDE='${_JVM}'" -i 'launcher' 'mcadministrator/unix/launch'
    rm -rf 'jre'
  else
    # 3.0.1 defaulted to 768
    #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
    # diff -pNaru5 'a' 'b' > '0000-mirth-connector-enable-DH768.patch'
    patch -Nup1 -i "${srcdir}/0000-mirth-connector-enable-DH768.patch"
  fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -d "${pkgdir}/usr/lib/${pkgname}/"
  cp -pr . "${pkgdir}/usr/lib/${pkgname}"
  rmdir "${pkgdir}/usr/lib/${pkgname}"/{logs,cache,data} # repeated below
  rm -rf "${pkgdir}/usr/lib/${pkgname}"/{javachecker,mcadministrator}/{macos,windows,windows-x64}
  # Eliminate AV files that cause missing dependencies
  rm -f "${pkgdir}/usr/lib/${pkgname}"/jre/lib/amd64/libavplugin*
  rm -f "${pkgdir}/usr/lib/${pkgname}"/jre/lib/amd64/libfxplugins.so

  if [ -d "${pkgdir}/usr/lib/${pkgname}/jre" ]; then
    rm -rf "${pkgdir}/usr/lib/${pkgname}/jre/man"
    local _p
    #for _p in "${pkgdir}/usr/lib/${pkgname}/jre/lib"/*.jar.pack "${pkgdir}/usr/lib/${pkgname}/jre/lib/ext"/*.jar.pack; do
    #  jre/bin/unpack200 -r "${_p}" "${_p%.pack}"
    #done
  fi

  install -Dm755 <(cat << EOF
#!/usr/bin/bash

set -e
set -u

u="\$HOME/.${pkgname}"
mkdir -p "\$u/"{mcadministrator/unix,logs,cache,data/icons}
cd "\$u"
if [ ! -f 'data/connections.json' ]; then
  touch 'data/connections.json'
fi
if [ ! -f 'data/icons/null' ]; then
  touch 'data/icons/null' # eliminate a seg fault for built in jre when Save As without an icon
fi
GLOBIGNORE=.
for f in /usr/lib/${pkgname}/* /usr/lib/${pkgname}/.*; do
  case "\${f##*/}" in
  'mcadministrator')
    if [ -L "\${f##*/}" ]; then
      rm -f "\${f##*/}"
    fi
    pushd "\${f##*/}/unix" > /dev/null
    for g in /usr/lib/${pkgname}/mcadministrator/unix/* /usr/lib/${pkgname}/mcadministrator/unix/.*; do
      case "\${g##*/}" in
      launch|launch.vmoptions)
        cp -p "\$g" "\${g##*/}"
        ;;
      *)
        ln -sf "\$g"
        ;;
      esac
    done
    popd > /dev/null
    ;;
  'launcher')
    rm -f "\${f##*/}"
    cp -p "\$f" "\${f##*/}"
    ;;
  *)
    ln -sf "\$f"
    ;;
  esac
done
"./launcher" "\$@"

EOF
  ) "${pkgdir}/usr/bin/mirth-connect-administrator-launcher"

  install -Dm644 <(cat << EOF
[Desktop Entry]
Name=Mirth Connect Administrator Launcher
GenericName=Mirth Client
Comment=Connect to Mirth servers
Exec=/usr/bin/mirth-connect-administrator-launcher
Terminal=false
Type=Application
#Icon=
Categories=Application;Utility;
MimeType=application/x-executable

EOF
  ) "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  set +u
}
set +u
