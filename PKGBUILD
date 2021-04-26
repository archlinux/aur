# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Leeo97one <contact.leeo97one@gmail.com>

pkgbase=java8-adoptopenjdk
pkgname=("${pkgbase/java/jre}-headless" "${pkgbase/java/jre}" "${pkgbase/java/jdk}" "${pkgbase/java8-/}8-src")
pkgver=8u292
_jdk_build=10
pkgrel=1
pkgdesc="AdoptOpenJDK ${pkgver%u*} HotSpot"
arch=("x86_64")
url="https://${pkgbase/java8-/}.net/"
license=("custom")
makedepends=("ca-certificates-utils" "hicolor-icon-theme" "java-environment-common" "java-runtime-common" "nss" "xdg-utils")
source=("https://github.com/AdoptOpenJDK/openjdk${pkgver%u*}-binaries/releases/download/jdk${pkgver}-b${_jdk_build}/OpenJDK${pkgver%u*}U-jdk_x64_linux_hotspot_${pkgver}b${_jdk_build}.tar.gz")
sha256sums=("0949505fcf42a1765558048451bb2a22e84b3635b1a31dd6191780eeccaa4ada")

_nonheadless=(
  "bin/policytool"
  "lib/amd64/libjsound.so"
  "lib/amd64/libjsoundalsa.so"
  "lib/amd64/libsplashscreen.so"
)

package_jre8-adoptopenjdk-headless() {
  pkgdesc="AdoptOpenJDK Java ${pkgver%u*} headless runtime environment"
  depends=("java-runtime-common" "ca-certificates-utils" "nss")
  optdepends=("java-rhino: for some JavaScript support")
  provides=("java-runtime-headless=${pkgver%u*}" "java-runtime-headless-openjdk=${pkgver%u*}")
  backup=(
    "etc/${pkgbase/java/java-}/amd64/jvm.cfg"
    "etc/${pkgbase/java/java-}/calendars.properties"
    "etc/${pkgbase/java/java-}/content-types.properties"
    "etc/${pkgbase/java/java-}/flavormap.properties"
    "etc/${pkgbase/java/java-}/images/cursors/cursors.properties"
    "etc/${pkgbase/java/java-}/logging.properties"
    "etc/${pkgbase/java/java-}/management/jmxremote.access"
    "etc/${pkgbase/java/java-}/management/jmxremote.password"
    "etc/${pkgbase/java/java-}/management/management.properties"
    "etc/${pkgbase/java/java-}/management/snmp.acl"
    "etc/${pkgbase/java/java-}/net.properties"
    "etc/${pkgbase/java/java-}/psfont.properties.ja"
    "etc/${pkgbase/java/java-}/psfontj2d.properties"
    "etc/${pkgbase/java/java-}/security/java.policy"
    "etc/${pkgbase/java/java-}/security/java.security"
    "etc/${pkgbase/java/java-}/sound.properties"
  )
  install="install_${pkgname}.sh"

  cd "${srcdir}/jdk${pkgver}-b${_jdk_build}/jre"

  install -dm755 "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre/"
  cp -a "${srcdir}/jdk${pkgver}-b${_jdk_build}/jre/bin" "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre"
  cp -a "${srcdir}/jdk${pkgver}-b${_jdk_build}/jre/lib" "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre"

  # Set config files
  mv "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre/lib/management/jmxremote.password"{.template,}
  mv "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre/lib/management/snmp.acl"{.template,}

  # Remove 'non-headless' lib files
  for _file in "${_nonheadless[@]}"; do
    rm "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre/${_file}"
  done

  # Man pages
  pushd "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre/bin"
  install -dm755 "${pkgdir}/usr/share/man/"{,ja/}"man1/"
  for _file in *; do
    if [ -f "${srcdir}/jdk${pkgver}-b${_jdk_build}/man/man1/${_file}.1" ]; then
      install -Dm644 "${srcdir}/jdk${pkgver}-b${_jdk_build}/man/man1/${_file}.1" "${pkgdir}/usr/share/man/man1/${_file}-${pkgbase/java8-/}${pkgver%u*}.1"
    fi
    if [ -f "${srcdir}/jdk${pkgver}-b${_jdk_build}/man/ja/man1/${_file}.1" ]; then
      install -Dm644 "${srcdir}/jdk${pkgver}-b${_jdk_build}/man/ja/man1/${_file}.1" "${pkgdir}/usr/share/man/ja/man1/${_file}-${pkgbase/java8-/}${pkgver%u*}.1"
    fi
  done
  popd

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre/lib/security/cacerts"
  ln -sf "/etc/ssl/certs/java/cacerts" "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre/lib/security/cacerts"

  # Install license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
  install -Dm644 "${srcdir}/jdk${pkgver}-b${_jdk_build}/jre/ASSEMBLY_EXCEPTION" "${pkgdir}/usr/share/licenses/${pkgbase}"
  install -Dm644 "${srcdir}/jdk${pkgver}-b${_jdk_build}/jre/LICENSE" "${pkgdir}/usr/share/licenses/${pkgbase}"
  install -Dm644 "${srcdir}/jdk${pkgver}-b${_jdk_build}/jre/THIRD_PARTY_README" "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -sf "/usr/share/licenses/${pkgbase}" "${pkgdir}/usr/share/licenses/${pkgname}"

  # Move config files that were set in _backup_etc from ./lib to /etc
  for _file in "${backup[@]}"; do
    _filepkgpath="/usr/lib/jvm/${pkgbase/java/java-}/jre/lib/${_file#etc/${pkgbase/java/java-}/}"
    install -Dm644 "${pkgdir}${_filepkgpath}" "${pkgdir}/${_file}"
    ln -sf "/${_file}" "${pkgdir}${_filepkgpath}"
  done
}

package_jre8-adoptopenjdk() {
  pkgdesc="AdoptOpenJDK Java ${pkgver%u*} full runtime environment"
  depends=("${pkgname}-headless=${pkgver}-${pkgrel}" "xdg-utils" "hicolor-icon-theme")
  optdepends=(
    "icedtea-web: web browser plugin + Java Web Start"
    "alsa-lib: for basic sound support"
    "gtk2: for the Gtk+ look and feel - desktop usage"
    "java8-openjfx: for JavaFX GUI components support"
  )
  provides=("java-runtime=${pkgver%u*}" "java-runtime-openjdk=${pkgver%u*}")
  install="install_${pkgname}.sh"

  cd "${srcdir}/jdk${pkgver}-b${_jdk_build}/jre"

  for _file in "${_nonheadless[@]}"; do
    install -D "${srcdir}/jdk${pkgver}-b${_jdk_build}/jre/${_file}" "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre/${_file}"
  done

  # Man pages
  pushd "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/jre/bin"
  install -dm755 "${pkgdir}/usr/share/man/"{,ja/}"man1/"
  for _file in *; do
    install -Dm644 "${srcdir}/jdk${pkgver}-b${_jdk_build}/man/man1/${_file}.1" \
      "${pkgdir}/usr/share/man/man1/${_file}-${pkgbase/java8-/}${pkgver%u*}.1"
    install -Dm644 "${srcdir}/jdk${pkgver}-b${_jdk_build}/man/ja/man1/${_file}.1" \
      "${pkgdir}/usr/share/man/ja/man1/${_file}-${pkgbase/java8-/}${pkgver%u*}.1"
  done
  popd

  # Install license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
  ln -sf "/usr/share/licenses/${pkgbase}" "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_jdk8-adoptopenjdk() {
  pkgdesc="AdoptOpenJDK Java ${pkgver%u*} development kit"
  depends=("java-environment-common" "${pkgbase/java/jre}=${pkgver}-${pkgrel}")
  provides=("java-environment=${pkgver%u*}" "java-environment-openjdk=${pkgver%u*}")
  install="install_${pkgname}.sh"

  cd "${srcdir}/jdk${pkgver}-b${_jdk_build}"

  # Main files
  install -dm755 "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}"

  cp -a "${srcdir}/jdk${pkgver}-b${_jdk_build}/include" "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}"
  cp -a "${srcdir}/jdk${pkgver}-b${_jdk_build}/lib" "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}"

  # 'bin' files
  pushd "${srcdir}/jdk${pkgver}-b${_jdk_build}/bin"

  # 'java-rmi.cgi' will be handled separately as it should not be in the PATH and has no man page
  for _binary_file in $(ls | grep -v "java-rmi.cgi"); do
    if [ -e "${srcdir}/jdk${pkgver}-b${_jdk_build}/jre/bin/${_binary_file}" ]; then
      # Provide a link of the jre binary in the jdk/bin/ directory
      ln -s "../jre/bin/${_binary_file}" "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/bin/${_binary_file}"
    else
      # Copy binary to jdk/bin/
      install -Dm755 "${_binary_file}" "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/bin/${_binary_file}"
      # Copy man page
      if [ -f "${srcdir}/jdk${pkgver}-b${_jdk_build}/man/man1/${_binary_file}.1" ]; then
        install -Dm644 "${srcdir}/jdk${pkgver}-b${_jdk_build}/man/man1/${_binary_file}.1" "${pkgdir}/usr/share/man/man1/${_binary_file}-${pkgbase/java8-/}${pkgver%u*}.1"
      fi
      if [ -f "${srcdir}/jdk${pkgver}-b${_jdk_build}/man/ja/man1/${_binary_file}.1" ]; then
        install -Dm644 "${srcdir}/jdk${pkgver}-b${_jdk_build}/man/ja/man1/${_binary_file}.1" "${pkgdir}/usr/share/man/ja/man1/${_binary_file}-${pkgbase/java8-/}${pkgver%u*}.1"
      fi
    fi
  done
  popd

  # Handling 'java-rmi.cgi' separately
  install -Dm755 "${srcdir}/jdk${pkgver}-b${_jdk_build}/bin/java-rmi.cgi" "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/bin/java-rmi.cgi"

  # link license
  install -dm755 "${pkgdir}/usr/share/licenses/"
  ln -sf "/usr/share/licenses/${pkgbase}" "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_adoptopenjdk8-src() {
  pkgdesc='AdoptOpenJDK Java ${pkgver%u*} sources'

  install -D "${srcdir}/jdk${pkgver}-b${_jdk_build}/src.zip" "${pkgdir}/usr/lib/jvm/${pkgbase/java/java-}/src.zip"
}
