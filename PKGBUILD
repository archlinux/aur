# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Boyan Ding <stu_dby@126.com>

# TODO
# once icedtea:
#   pulse
#   add policytool desktop files

# Package 'openjfx' must be updated when this one is
pkgname=('jre8-openjdk-jetbrains-headless' 'jre8-openjdk-jetbrains' 'jdk8-openjdk-jetbrains' 'openjdk8-jetbrains-src' 'openjdk8-jetbrains-doc')
pkgbase=java8-openjdk-jetbrains
_java_ver=8
# Found @ https://github.com/JetBrains/jdk8u/releases
_jdk_update=152
_jdk_build=1119.3
pkgver=${_java_ver}.u${_jdk_update}.b${_jdk_build}
_repo_ver=jb${_java_ver}u${_jdk_update}-b${_jdk_build}
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/JetBrains/jdk8u'
license=('GPL2')
makedepends=('java-environment-openjdk' 'cpio' 'unzip' 'zip' 'gcc6'
             'libxrender' 'libxtst' 'fontconfig' 'libcups' 'alsa-lib')
_url_src=https://github.com/JetBrains/jdk8u
source=(jdk8u-${_repo_ver}.tar.gz::${_url_src}/archive/${_repo_ver}.tar.gz
        corba-${_repo_ver}.tar.gz::${_url_src}_corba/archive/${_repo_ver}.tar.gz
        hotspot-${_repo_ver}.tar.gz::${_url_src}_hotspot/archive/${_repo_ver}.tar.gz
        jdk-${_repo_ver}.tar.gz::${_url_src}_jdk/archive/${_repo_ver}.tar.gz
        jaxws-${_repo_ver}.tar.gz::${_url_src}_jaxws/archive/${_repo_ver}.tar.gz
        jaxp-${_repo_ver}.tar.gz::${_url_src}_jaxp/archive/${_repo_ver}.tar.gz
        langtools-${_repo_ver}.tar.gz::${_url_src}_langtools/archive/${_repo_ver}.tar.gz
        nashorn-${_repo_ver}.tar.gz::${_url_src}_nashorn/archive/${_repo_ver}.tar.gz)

sha256sums=('4a44aa517187c4c04708436e23c11a6f61ba37982eaa8fa1d3a1bc76f082f3a9'
            'fb6d82142569a53ed15d257bafe00d84a4117f8084973dcd8a30e14418d79233'
            'cf51bdbefbb9f63fcbb7481f90ace07bbf2f5a986546357ec7c2b41d0a0a307f'
            '36fd05b0ac53eaca895379cdcda2979b41bb333a25afe272102d287aa915a6d2'
            'a8f26c4bdb0280507989b2ee19f0d4c1517bcdbe59187bc4f1436a38e766067d'
            '05a5439728419270344cfcde0042b3d727d5fa6115d02b0233abc950eb485242'
            'deb55bc715e7536d1ec6693f3023ee8e604ee7c17747d7ac8eb7fdd2bf5fe03f'
            'e11c65d196b995031d9874beceb3970e1fd7840742bd3d6e795b95ebb8069509')

case "${CARCH}" in
  'x86_64') _JARCH=amd64 ; _DOC_ARCH=x86_64 ;;
  'i686'  ) _JARCH=i386  ; _DOC_ARCH=x86    ;;
esac

_jdkname=openjdk8-jetbrains
_jvmdir=/usr/lib/jvm/java-8-openjdk-jetbrains
_prefix="jdk8u-${_repo_ver}/image"
_imgdir="${_prefix}/jvm/openjdk-1.8.0_$(printf '%.2d' ${_jdk_update})"
_nonheadless=(bin/policytool
              lib/${_JARCH}/libjsound.so
              lib/${_JARCH}/libjsoundalsa.so
              lib/${_JARCH}/libsplashscreen.so)

prepare() {
  cd "${srcdir}/jdk8u-${_repo_ver}"

  for subrepo in corba hotspot jdk jaxws jaxp langtools nashorn
  do
    ln -sf ../jdk8u_${subrepo}-${_repo_ver} ${subrepo}
  done
}

build() {
  cd "${srcdir}/jdk8u-${_repo_ver}"

  # Detecting Java version by the first line of the output
  # of `java --version` is such a great idea
  unset JAVA_HOME _JAVA_OPTIONS
  # http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1346
  export MAKEFLAGS=${MAKEFLAGS/-j*}
  # https://hydra.nixos.org/build/41230444/log
  export CFLAGS="$CFLAGS -Wno-error=deprecated-declarations"

  export CC=gcc-6 CXX=g++-6

  install -d -m 755 "${srcdir}/${_prefix}/"
  sh configure \
    --prefix="${srcdir}/${_prefix}" \
    --with-update-version="${_jdk_update}" \
    --with-build-number="b${_jdk_build}" \
    --with-milestone="fcs" \
    --enable-unlimited-crypto \
    --with-zlib=system

    # TODO OpenJDK does not want last version of giflib (add 'giflib' as dependency once fixed)
    #--with-giflib=system \

  # Without 'DEBUG_BINARIES', i686 won't build
  # http://mail.openjdk.java.net/pipermail/core-libs-dev/2013-July/019203.html
  make \
    DEBUG_BINARIES=true
  # These help to debug builds:
  # LOG=trace HOTSPOT_BUILD_JOBS=1

  make docs

  # FIXME sadly 'DESTDIR' is not used here!
  make install

  cd "${srcdir}/${_imgdir}"

  # A lot of build stuff were directly taken from
  # http://pkgs.fedoraproject.org/cgit/java-1.8.0-openjdk.git/tree/java-1.8.0-openjdk.spec

  # http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1437
  find . -iname '*.jar' -exec chmod ugo+r {} \;
  chmod ugo+r lib/ct.sym

  # remove redundant *diz and *debuginfo files
  find . -iname '*.diz' -exec rm {} \;
  find . -iname '*.debuginfo' -exec rm {} \;
}

#check() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#  make -k check
#}

package_jre8-openjdk-jetbrains-headless() {
  pkgdesc='OpenJDK Java 8 headless runtime environment (with JetBrains patches)'
  depends=('java-runtime-common' 'ca-certificates-utils' 'nss')
  optdepends=('java-rhino: for some JavaScript support')
  provides=('java-runtime-headless=8' 'java-runtime-headless-openjdk=8' 'java-runtime-headless-openjdk-jetbrains=8')
  # Upstream config files that should go to etc and get backup
  _backup_etc=(etc/java-8-openjdk-jetbrains/${_JARCH}/jvm.cfg
               etc/java-8-openjdk-jetbrains/calendars.properties
               etc/java-8-openjdk-jetbrains/content-types.properties
               etc/java-8-openjdk-jetbrains/flavormap.properties
               etc/java-8-openjdk-jetbrains/images/cursors/cursors.properties
               etc/java-8-openjdk-jetbrains/logging.properties
               etc/java-8-openjdk-jetbrains/management/jmxremote.access
               etc/java-8-openjdk-jetbrains/management/jmxremote.password
               etc/java-8-openjdk-jetbrains/management/management.properties
               etc/java-8-openjdk-jetbrains/management/snmp.acl
               etc/java-8-openjdk-jetbrains/net.properties
               etc/java-8-openjdk-jetbrains/psfont.properties.ja
               etc/java-8-openjdk-jetbrains/psfontj2d.properties
               etc/java-8-openjdk-jetbrains/security/java.policy
               etc/java-8-openjdk-jetbrains/security/java.security
               etc/java-8-openjdk-jetbrains/sound.properties)
  backup=(${_backup_etc[@]})
  install=install_jre8-openjdk-jetbrains-headless.sh

  cd "${srcdir}/${_imgdir}/jre"

  install -d -m 755 "${pkgdir}${_jvmdir}/jre/"
  cp -a bin lib "${pkgdir}${_jvmdir}/jre"

  # Set config files
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/jmxremote.password{.template,}
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/snmp.acl{.template,}

  # Remove 'non-headless' lib files
  for f in ${_nonheadless[@]}; do
    rm "${pkgdir}${_jvmdir}/jre/${f}"
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

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/jre/lib/security/cacerts"

  # Install license
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
  install -m 644 ASSEMBLY_EXCEPTION LICENSE THIRD_PARTY_README \
                 "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"

  # Move config files that were set in _backup_etc from ./lib to /etc
  for file in ${_backup_etc[@]}; do
    _filepkgpath=${_jvmdir}/jre/lib/${file#etc/java-8-openjdk-jetbrains/}
    install -D -m 644 "${pkgdir}${_filepkgpath}" "${pkgdir}/${file}"
    ln -sf /${file} "${pkgdir}${_filepkgpath}"
  done
}

package_jre8-openjdk-jetbrains() {
  pkgdesc='OpenJDK Java 8 full runtime environment (with JetBrains patches)'
  depends=("jre8-openjdk-jetbrains-headless=${pkgver}-${pkgrel}" 'xdg-utils' 'hicolor-icon-theme')
  optdepends=('icedtea-web: web browser plugin + Java Web Start'
              'alsa-lib: for basic sound support'
              'gtk2: for the Gtk+ look and feel - desktop usage'
              'java-openjfx: for JavaFX GUI components support')
  # TODO when adding IcedTea: 'giflib: for gif format support'
  # TODO when adding IcedTea: 'libpulse: for advanced sound support'
  provides=('java-runtime=8' 'java-runtime-openjdk=8' 'java-runtime-openjdk-jetbrains=8')
  install=install_jre8-openjdk-jetbrains.sh

  cd "${srcdir}/${_imgdir}/jre"

  # TODO? Should /usr/lib/jvm/java-8-openjdk/jre/lib/sound.properties belong to jre?
  for f in ${_nonheadless[@]}; do
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

  # Desktop files
  # TODO add these when switching to IcedTea
  #install -D -m 644 "${srcdir}/icedtea-${_icedtea_ver}/policytool.desktop" \
  #                  "${pkgdir}/usr/share/applications/policytool.desktop"

  # Install license
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_jdk8-openjdk-jetbrains() {
  pkgdesc='OpenJDK Java 8 development kit (with JetBrains patches)'
  depends=('java-environment-common' "jre8-openjdk-jetbrains=${pkgver}-${pkgrel}")
  provides=('java-environment=8' 'java-environment-openjdk=8' 'java-environment-openjdk-jetbrains=8')
  install=install_jdk8-openjdk-jetbrains.sh

  cd "${srcdir}/${_imgdir}"

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
      install -D -m 644 ../man/man1/${b}.1 "${pkgdir}/usr/share/man/man1/${b}-${_jdkname}.1"
      install -D -m 644 ../man/ja/man1/${b}.1 "${pkgdir}/usr/share/man/ja/man1/${b}-${_jdkname}.1"
    fi
  done
  popd

  # Handling 'java-rmi.cgi' separately
  install -D -m 755 bin/java-rmi.cgi "${pkgdir}${_jvmdir}/bin/java-rmi.cgi"

  # Desktop files.
  # TODO add these when switching to IcedTea
  #install -m 644 "${srcdir}/icedtea-${_icedtea_ver}/jconsole.desktop" \
  #  "${pkgdir}/usr/share/applications"

  # link license
  install -d -m 755 "${pkgdir}/usr/share/licenses/"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_openjdk8-jetbrains-src() {
  pkgdesc='OpenJDK Java 8 sources (with JetBrains patches)'
  options=(!strip)
  arch=('any')

  install -D "${srcdir}/${_imgdir}/src.zip" "${pkgdir}${_jvmdir}/src.zip"
}

package_openjdk8-jetbrains-doc() {
  pkgdesc='OpenJDK Java 8 documentation (with JetBrains patches)'
  options=(!strip)
  arch=('any')

  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgbase}/"
  cp -r "${srcdir}"/jdk8u-${_repo_ver}/build/linux-${_DOC_ARCH}-normal-server-release/docs/* \
    "${pkgdir}/usr/share/doc/${pkgbase}/"
}
