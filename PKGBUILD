# Maintainer: therealfarfetchd <aur@therealfarfetchd.dev>

# Based on jdk11-adoptopenjdk

_majorver=8
_updatever=232
_buildver=09
_tag_ver="${_majorver}u${_updatever}b${_buildver}"
pkgver="${_majorver}.u${_updatever}.b${_buildver}"
pkgrel=1

pkgname='jdk8-openjdk-dcevm'
pkgdesc='OpenJDK Java 8 development kit with DCEVM patches (Trava build)'
arch=('x86_64')
url='https://github.com/TravaOpenJDK/trava-jdk-8-dcevm'
license=('custom')

depends=('java-runtime-common>=3' 'ca-certificates-utils' 'desktop-file-utils' 'libxrender' 'libxtst' 'alsa-lib')

optdepends=(
  'gtk2: for the Gtk+ 2 look and feel'
  'gtk3: for the Gtk+ 3 look and feel'
)

provides=(
  "java-runtime-headless=${_majorver}"
  "java-runtime-headless-openjdk=${_majorver}"
  "jre${_majorver}-openjdk-headless=${pkgver}"
  "jre-openjdk-headless=${pkgver}"
  "java-runtime=${_majorver}"
  "java-runtime-openjdk=${_majorver}"
  "jre${_majorver}-openjdk=${pkgver}"
  "jre-openjdk=${pkgver}"
  "java-environment=${_majorver}"
  "java-environment-openjdk=${_majorver}"
  "jdk${_majorver}-openjdk=${pkgver}"
  "jdk-openjdk=${pkgver}"
  "openjdk${_majorver}-src=${pkgver}"
  "openjdk-src=${pkgver}"
)

backup=(
  etc/${pkgname}/amd64/jvm.cfg
  etc/${pkgname}/calendars.properties
  etc/${pkgname}/content-types.properties
  etc/${pkgname}/flavormap.properties
  etc/${pkgname}/images/cursors/cursors.properties
  etc/${pkgname}/logging.properties
  etc/${pkgname}/management/jmxremote.access
  etc/${pkgname}/management/jmxremote.password
  etc/${pkgname}/management/management.properties
  etc/${pkgname}/management/snmp.acl
  etc/${pkgname}/net.properties
  etc/${pkgname}/psfont.properties.ja
  etc/${pkgname}/psfontj2d.properties
  etc/${pkgname}/security/java.policy
  etc/${pkgname}/security/java.security
  etc/${pkgname}/sound.properties
)

install='install_jdk8-openjdk-dcevm.sh'

source=(
  https://github.com/TravaOpenJDK/trava-jdk-8-dcevm/releases/download/dcevm${_tag_ver}/java8-openjdk-dcevm-linux.tar.gz
  freedesktop-java.desktop
  freedesktop-jconsole.desktop
)

sha256sums=(
  'SKIP'
  '05b34bc3f9e94639c5678448cb3e1c5df82759ed5b8a984da4560e13e0aba81e'
  'd24381a9f670110a3c0b02c5ae0636095418384562204a8a2f4eb7945f4c1a9b'
)

_jvmdir=/usr/lib/jvm/java-${_majorver}-openjdk-dcevm
_jdkdir=dcevm${_tag_ver}

package() {
  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -a "${srcdir}/${_jdkdir}"/* "${pkgdir}${_jvmdir}"

  cd "${pkgdir}${_jvmdir}"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -sf /usr/share/licenses/${pkgname}/LICENSE LICENSE

  # Man pages
  for f in man/man1/* man/ja/man1/* man/ja_JP.UTF-8/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-adoptopenjdk${_majorver}.1}"
  done
  rm -rf man
  ln -sf /usr/share/man man

  # Link JKS keystore from ca-certificates-utils
  rm -f jre/lib/security/cacerts
  ln -sf /etc/ssl/certs/java/cacerts jre/lib/security/cacerts

  # Set config files
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/jmxremote.password{.template,}
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/snmp.acl{.template,}

  # Move config files that were set in backup from ./lib to /etc
  for file in ${backup[@]}; do
    _filepkgpath=${_jvmdir}/jre/lib/${file#etc/${pkgname}/}
    install -D -m 644 "${pkgdir}${_filepkgpath}" "${pkgdir}/${file}"
    ln -sf /${file} "${pkgdir}${_filepkgpath}"
  done

  # Deduplicate binaries
  cd bin
  for file in $(ls); do
    if [ -e ../jre/bin/${file} ]; then
      ln -sf ../jre/bin/${file} ${file}
    fi
  done
  cd ..

  # Desktop files
  for f in jconsole java; do
    install -Dm 644 \
      "${srcdir}/freedesktop-${f}.desktop" \
      "${pkgdir}/usr/share/applications/${f}-${pkgname}.desktop"
  done

}
