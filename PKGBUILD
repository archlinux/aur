# Extends https://www.archlinux.org/packages/extra/x86_64/jdk8-openjdk/

# Maintainer: Sam Guymer <sam at guymer dot me>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Boyan Ding <stu_dby@126.com>

# TODO
# once icedtea:
#   pulse
#   add policytool desktop files

# Package 'openjfx' must be updated when this one is
pkgname=('tuxjdk' 'tuxjdk-src' 'tuxjdk-doc')
_java_ver=8
# Found @ http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
_jdk_update=152
_jdk_build=16
_tuxjdk_ver=03
pkgver=${_java_ver}.${_jdk_update}.${_tuxjdk_ver}
_repo_ver=jdk${_java_ver}u${_jdk_update}-b${_jdk_build}
pkgrel=2
arch=('x86_64')
url='https://github.com/tuxjdk/tuxjdk'
license=('custom')
makedepends=('jdk7-openjdk' 'ccache' 'cpio' 'unzip' 'zip'
             'libxrender' 'libxtst' 'fontconfig' 'libcups' 'alsa-lib'
             'gcc6'
             'quilt')
_url_src=http://hg.openjdk.java.net/jdk8u/jdk8u
source=(jdk8u-${_repo_ver}.tar.gz::${_url_src}/archive/${_repo_ver}.tar.gz
        corba-${_repo_ver}.tar.gz::${_url_src}/corba/archive/${_repo_ver}.tar.gz
        hotspot-${_repo_ver}.tar.gz::${_url_src}/hotspot/archive/${_repo_ver}.tar.gz
        jdk-${_repo_ver}.tar.gz::${_url_src}/jdk/archive/${_repo_ver}.tar.gz
        jaxws-${_repo_ver}.tar.gz::${_url_src}/jaxws/archive/${_repo_ver}.tar.gz
        jaxp-${_repo_ver}.tar.gz::${_url_src}/jaxp/archive/${_repo_ver}.tar.gz
        langtools-${_repo_ver}.tar.gz::${_url_src}/langtools/archive/${_repo_ver}.tar.gz
        nashorn-${_repo_ver}.tar.gz::${_url_src}/nashorn/archive/${_repo_ver}.tar.gz
        https://github.com/tuxjdk/tuxjdk/archive/688b97a703c9207276b365872dd00c019b6401e1.tar.gz)
        #https://github.com/tuxjdk/tuxjdk/archive/${pkgver}.tar.gz)

sha256sums=('ee7e72948d54de02f3eca1054def65e2a814c8597196cf1d83a52e9eb5d9258b'
            'f2c293427413fd08129e840428eb80e898060c8764b2df57809c960607ab83f6'
            '2afe4937e3a472bd3e49b3e03e9df0a1f61606fae31aef245b90f8399898cc56'
            '267026dac66e5d9b81a62c148aea7df08ccd0ce602096636f13adb72a17c4ec3'
            '50f2976bf0dbf053a6d36260ffe96fcf03bce633d6277574b76938f6f3bb3a1e'
            'c9ea746cc4a04f9ccb35e4d2e0e495f3ac18a6b14be0af63803c9d329fe145ce'
            '15734ef517ec18b01f9af1d1d75277c133faa2c76a33e46320783cc19d054e00'
            '044d38671b209a0951cbc900a061f821b503580019f3c88015e0c298512e39c9'
            '7464e57811d80c87179699c483d04c524fa2551e7879bdf264c108c0c1c20170')

case "${CARCH}" in
  'x86_64') _JARCH=amd64 ; _DOC_ARCH=x86_64 ;;
esac

_jdkname=tuxjdk8
_jvmdir=/usr/lib/jvm/java-8-tuxjdk
_prefix="jdk8u-${_repo_ver}/image"
_imgdir="${_prefix}/jvm/openjdk-1.8.0_$(printf '%.2d' ${_jdk_update})"
_tuxjdkdir="tuxjdk-688b97a703c9207276b365872dd00c019b6401e1"
#_tuxjdkdir="tuxjdk-${pkgver}"

prepare() {
  cd "${srcdir}/jdk8u-${_repo_ver}"

  for subrepo in corba hotspot jdk jaxws jaxp langtools nashorn
  do
    # quilt doesnt seem to be able to handle symlinks
    # ln -s ../${subrepo}-${_repo_ver} ${subrepo}
    mv ../${subrepo}-${_repo_ver} ${subrepo}
  done

  "${srcdir}/${_tuxjdkdir}/applyTuxjdk.sh"
}

build() {
  cd "${srcdir}/jdk8u-${_repo_ver}"

  unset JAVA_HOME
  # http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1346
  export MAKEFLAGS=${MAKEFLAGS/-j*}
  # https://hydra.nixos.org/build/41230444/log
  export CFLAGS="-Wno-error=deprecated-declarations"

  # compiling with gcc-7 causes segfault at runtime
  export CC=gcc-6
  export CXX=g++-6

  install -d -m 755 "${srcdir}/${_prefix}/"
  sh configure \
    --prefix="${srcdir}/${_prefix}" \
    --with-update-version="${_jdk_update}" \
    --with-build-number="b${_jdk_build}" \
    --with-milestone="fcs" \
    --with-user-release-suffix="tuxjdk" \
    --enable-unlimited-crypto \
    --with-zlib=system \
    --with-boot-jdk="/usr/lib/jvm/java-7-openjdk"

  make

  make docs

  # FIXME sadly 'DESTDIR' is not used here!
  make install

  cd "${srcdir}/${_imgdir}"

  # A lot of build stuff were directly taken from
  # http://pkgs.fedoraproject.org/cgit/java-1.8.0-openjdk.git/tree/java-1.8.0-openjdk.spec

  # http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1437
  find . -iname '*.jar' -exec chmod ugo+r {} \;
  # removed by tuxjdk
  # chmod ugo+r lib/ct.sym

  # remove redundant *diz and *debuginfo files
  find . -iname '*.diz' -exec rm {} \;
  find . -iname '*.debuginfo' -exec rm {} \;
}

#check() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#  make -k check
#}

package_tuxjdk() {
  pkgdesc='Enhanced Open Java Development Kit for developers on Linux. Contains series of patched to OpenJDK to enhance user experience with Java-based and Swing-based tools (NetBeans, Idea, Android Studio, etc)'
  depends=('java-runtime-common' 'ca-certificates-utils' 'nss'
           'xdg-utils' 'hicolor-icon-theme'
           'java-environment-common')
  optdepends=('java-rhino: for some JavaScript support'
              'icedtea-web: web browser plugin + Java Web Start'
              'alsa-lib: for basic sound support'
              'gtk2: for the Gtk+ look and feel - desktop usage'
              'java-openjfx: for JavaFX GUI components support')
  provides=('java-runtime-headless=8' 'java-runtime-headless-openjdk=8'
            'java-runtime=8' 'java-runtime-openjdk=8'
            'java-environment=8' 'java-environment-openjdk=8')
  # Upstream config files that should go to etc and get backup
  _backup_etc=(etc/tuxjdk/${_JARCH}/jvm.cfg
               etc/tuxjdk/calendars.properties
               etc/tuxjdk/content-types.properties
               etc/tuxjdk/flavormap.properties
               etc/tuxjdk/images/cursors/cursors.properties
               etc/tuxjdk/logging.properties
               etc/tuxjdk/management/jmxremote.access
               etc/tuxjdk/management/jmxremote.password
               etc/tuxjdk/management/management.properties
               etc/tuxjdk/management/snmp.acl
               etc/tuxjdk/net.properties
               etc/tuxjdk/psfont.properties.ja
               etc/tuxjdk/psfontj2d.properties
               etc/tuxjdk/security/java.policy
               etc/tuxjdk/security/java.security
               etc/tuxjdk/sound.properties
               etc/tuxjdk/swing.properties)
  backup=(${_backup_etc[@]})
  install=install_tuxjdk.sh

  cd "${srcdir}/${_imgdir}/jre"

  install -d -m 755 "${pkgdir}${_jvmdir}/jre/"
  cp -a bin lib "${pkgdir}${_jvmdir}/jre"

  # Set config files
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/jmxremote.password{.template,}
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/snmp.acl{.template,}

  install -m 644 "${srcdir}/${_tuxjdkdir}/default_swing.properties" "${pkgdir}${_jvmdir}/jre/lib/swing.properties"

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

  # Desktop files
  # TODO add these when switching to IcedTea
  #install -D -m 644 "${srcdir}/icedtea-${_icedtea_ver}/policytool.desktop" \
  #                  "${pkgdir}/usr/share/applications/policytool.desktop"

  # Install license
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
  install -m 644 ASSEMBLY_EXCEPTION LICENSE THIRD_PARTY_README \
                 "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"

  # Move config files that were set in _backup_etc from ./lib to /etc
  for file in ${_backup_etc[@]}; do
    _filepkgpath=${_jvmdir}/jre/lib/${file#etc/tuxjdk/}
    install -D -m 644 "${pkgdir}${_filepkgpath}" "${pkgdir}/${file}"
    ln -sf /${file} "${pkgdir}${_filepkgpath}"
  done

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

package_tuxjdk-src() {
  pkgdesc='OpenJDK Java 8 sources'

  install -D "${srcdir}/${_imgdir}/src.zip" "${pkgdir}${_jvmdir}/src.zip"
}

package_tuxjdk-doc() {
  pkgdesc='OpenJDK Java 8 documentation'

  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r "${srcdir}"/jdk8u-${_repo_ver}/build/linux-${_DOC_ARCH}-normal-server-release/docs/* \
    "${pkgdir}/usr/share/doc/${pkgname}/"
}
