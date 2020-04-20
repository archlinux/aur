# Maintainer: Leeo97one <contact.leeo97one@gmail.com>
# Based on jdk8-openjdk 8.u242-1

pkgname=('jre8-adoptopenjdk-headless' 'jre8-adoptopenjdk' 'jdk8-adoptopenjdk')
pkgbase=java8-adoptopenjdk
_java_ver=8
_jdk_update=252
_jdk_build=09
pkgver=${_java_ver}.u${_jdk_update}
_repo_ver=jdk${_java_ver}u${_jdk_update}-b${_jdk_build}
_targz_ver=${_java_ver}u${_jdk_update}b${_jdk_build}
pkgrel=1
pkgdesc="AdoptOpenJDK 8 HotSpot"
arch=('x86_64')
url='https://adoptopenjdk.net/'
license=('custom')
makedepends=('ca-certificates-utils' 'hicolor-icon-theme'
             'java-environment-common' 'java-runtime-common' 'nss' 'xdg-utils')
source=(https://github.com/AdoptOpenJDK/openjdk${_java_ver}-binaries/releases/download/${_repo_ver}/OpenJDK${_java_ver}U-jdk_x64_linux_hotspot_${_targz_ver}.tar.gz)

sha256sums=('2b59b5282ff32bce7abba8ad6b9fde34c15a98f949ad8ae43e789bbd78fc8862')

_JARCH=amd64
_jdkname=adoptopenjdk${_java_ver}
_jvmdir=/usr/lib/jvm/java-8-adoptopenjdk
_imgdir="${_repo_ver}"
_nonheadless=(bin/policytool
              lib/${_JARCH}/libjsound.so
              lib/${_JARCH}/libjsoundalsa.so
              lib/${_JARCH}/libsplashscreen.so)

package_jre8-adoptopenjdk-headless() {
  pkgdesc='AdoptOpenJDK Java 8 headless runtime environment'
  depends=('java-runtime-common' 'ca-certificates-utils' 'nss')
  optdepends=('java-rhino: for some JavaScript support')
  provides=('java-runtime-headless=8' 'java-runtime-headless-openjdk=8')
  # Upstream config files that should go to etc and get backup
  _backup_etc=(etc/java-8-adoptopenjdk/${_JARCH}/jvm.cfg
               etc/java-8-adoptopenjdk/calendars.properties
               etc/java-8-adoptopenjdk/content-types.properties
               etc/java-8-adoptopenjdk/flavormap.properties
               etc/java-8-adoptopenjdk/images/cursors/cursors.properties
               etc/java-8-adoptopenjdk/logging.properties
               etc/java-8-adoptopenjdk/management/jmxremote.access
               etc/java-8-adoptopenjdk/management/jmxremote.password
               etc/java-8-adoptopenjdk/management/management.properties
               etc/java-8-adoptopenjdk/management/snmp.acl
               etc/java-8-adoptopenjdk/net.properties
               etc/java-8-adoptopenjdk/psfont.properties.ja
               etc/java-8-adoptopenjdk/psfontj2d.properties
               etc/java-8-adoptopenjdk/security/java.policy
               etc/java-8-adoptopenjdk/security/java.security
               etc/java-8-adoptopenjdk/sound.properties)
  backup=(${_backup_etc[@]})
  install=install_jre8-adoptopenjdk-headless.sh

  cd ${_imgdir}/jre

  install -d -m 755 "${pkgdir}${_jvmdir}/jre/"
  cp -a bin lib "${pkgdir}${_jvmdir}/jre"

  # Set config files
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/jmxremote.password{.template,}
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/snmp.acl{.template,}

  # Remove 'non-headless' lib files
  for f in "${_nonheadless[@]}"; do
    rm "${pkgdir}${_jvmdir}/jre/${f}"
  done

  # Man pages
  pushd "${pkgdir}${_jvmdir}/jre/bin"
  install -d -m 755 "${pkgdir}"/usr/share/man/{,ja/}man1/
  for file in *; do
    if [ -f "${srcdir}/${_imgdir}/man/man1/${file}.1" ]; then
      install -m 644 "${srcdir}/${_imgdir}/man/man1/${file}.1" \
        "${pkgdir}/usr/share/man/man1/${file}-${_jdkname}.1"
    fi
    if [ -f "${srcdir}/${_imgdir}/man/ja/man1/${file}.1" ]; then
      install -m 644 "${srcdir}/${_imgdir}/man/ja/man1/${file}.1" \
        "${pkgdir}/usr/share/man/ja/man1/${file}-${_jdkname}.1"
    fi
  done
  popd

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"

  # Install license
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
  install -m 644 ASSEMBLY_EXCEPTION LICENSE THIRD_PARTY_README \
                 "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"

  # Move config files that were set in _backup_etc from ./lib to /etc
  for file in "${_backup_etc[@]}"; do
    _filepkgpath=${_jvmdir}/jre/lib/${file#etc/java-8-adoptopenjdk/}
    install -D -m 644 "${pkgdir}${_filepkgpath}" "${pkgdir}/${file}"
    ln -sf /${file} "${pkgdir}${_filepkgpath}"
  done
}

package_jre8-adoptopenjdk() {
  pkgdesc='AdoptOpenJDK Java 8 full runtime environment'
  depends=("jre8-adoptopenjdk-headless=${pkgver}-${pkgrel}" 'xdg-utils' 'hicolor-icon-theme')
  optdepends=('icedtea-web: web browser plugin + Java Web Start'
              'alsa-lib: for basic sound support'
              'gtk2: for the Gtk+ look and feel - desktop usage'
              'java8-openjfx: for JavaFX GUI components support')
  provides=('java-runtime=8' 'java-runtime-openjdk=8')
  install=install_jre8-adoptopenjdk.sh

  cd ${_imgdir}/jre

  for f in "${_nonheadless[@]}"; do
    install -D ${f} "${pkgdir}${_jvmdir}/jre/${f}"
  done

  # Man pages
  pushd "${pkgdir}${_jvmdir}/jre/bin"
  install -d -m 755 "${pkgdir}"/usr/share/man/{,ja/}man1/
  for file in *; do
    install -m 644 "${srcdir}/${_imgdir}/man/man1/${file}.1" \
      "${pkgdir}/usr/share/man/man1/${file}-${_jdkname}.1"
    install -m 644 "${srcdir}/${_imgdir}/man/ja/man1/${file}.1" \
      "${pkgdir}/usr/share/man/ja/man1/${file}-${_jdkname}.1"
  done
  popd

  # Install license
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_jdk8-adoptopenjdk() {
  pkgdesc='AdoptOpenJDK Java 8 development kit'
  depends=('java-environment-common' "jre8-adoptopenjdk=${pkgver}-${pkgrel}")
  provides=('java-environment=8' 'java-environment-openjdk=8')
  install=install_jdk8-adoptopenjdk.sh

  cd ${_imgdir}

  # Main files
  install -d -m 755 "${pkgdir}${_jvmdir}"

  cp -a include lib "${pkgdir}${_jvmdir}"

  # 'bin' files
  pushd bin

  # 'java-rmi.cgi' will be handled separately as it should not be in the PATH and has no man page
  for b in $(ls | grep -v java-rmi.cgi); do
    if [ -e ../jre/bin/${b} ]; then
      # Provide a link of the jre binary in the jdk/bin/ directory
      ln -s ../jre/bin/${b} "${pkgdir}${_jvmdir}/bin/${b}"
    else
      # Copy binary to jdk/bin/
      install -D -m 755 ${b} "${pkgdir}${_jvmdir}/bin/${b}"
      # Copy man page
      if [ -f ../man/man1/${b}.1 ]; then
        install -D -m 644 ../man/man1/${b}.1 "${pkgdir}/usr/share/man/man1/${b}-${_jdkname}.1"
      fi
      if [ -f ../man/ja/man1/${b}.1 ]; then
        install -D -m 644 ../man/ja/man1/${b}.1 "${pkgdir}/usr/share/man/ja/man1/${b}-${_jdkname}.1"
      fi
    fi
  done
  popd

  # Handling 'java-rmi.cgi' separately
  install -D -m 755 bin/java-rmi.cgi "${pkgdir}${_jvmdir}/bin/java-rmi.cgi"

  # link license
  install -d -m 755 "${pkgdir}/usr/share/licenses/"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}
