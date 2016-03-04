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
_jdk_update=66
# Found @ http://hg.openjdk.java.net/jdk8u/jdk8u
_jdk_build=17
_tuxjdk_ver=03
pkgver=${_java_ver}.${_jdk_update}.${_tuxjdk_ver}
_repo_ver=jdk${_java_ver}u${_jdk_update}-b${_jdk_build}
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/tuxjdk/tuxjdk'
license=('custom')
makedepends=('jdk7-openjdk' 'ccache' 'cpio' 'unzip' 'zip'
             'libxrender' 'libxtst' 'fontconfig' 'libcups' 'alsa-lib'
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
        https://github.com/tuxjdk/tuxjdk/archive/${pkgver}.tar.gz)

sha256sums=('7bd68bbe99094c46744dbaf5563e3e49b08adc8ed7a8e24d8f10520d42b1a63b'
            '1dfa95d3e5747a48f2acf91b4c3f3b7233f65fd37078c096015ade80ceb5d93d'
            'f552ab7216d233296f64cb2551f43090b4ff1c0383bec365c910a913e25e61bb'
            'a6368996acc5f914acab7b000ce70f387b7994776fb00dc82882bdefc676c77b'
            '317f85ae5af4d2be44b8b5a4318512d344895e978530cc87544bf9987860b0cb'
            'e4a95401c4e45fc0471e42b2b62bdfad025eee57715583ce58b0da785159e2eb'
            'b58d81b7e873c2ebd9f96a6bbd538f68c1f457e4dfea3b262e52973a33f2e6f7'
            'ad5c17b67999179966175caa35684056a48eb74186191e8f1b8ff900b580b25a'
            '5ef3211b960858e5a5e168664fd3250821035c894a469f220a45978d401eb68c')

case "${CARCH}" in
  'x86_64') _JARCH=amd64 ; _DOC_ARCH=x86_64 ;;
  'i686'  ) _JARCH=i386  ; _DOC_ARCH=x86    ;;
esac

_jdkname=tuxjdk8
_jvmdir=/opt/tuxjdk
_prefix="jdk8u-${_repo_ver}/image"
_imgdir="${_prefix}/jvm/openjdk-1.8.0_$(printf '%.2d' ${_jdk_update})"
_tuxjdkdir="tuxjdk-${pkgver}"
_nonheadless=(bin/policytool
              lib/${_JARCH}/libjsound.so
              lib/${_JARCH}/libjsoundalsa.so
              lib/${_JARCH}/libsplashscreen.so)

prepare() {
  cd "${srcdir}/jdk8u-${_repo_ver}"

  for subrepo in corba hotspot jdk jaxws jaxp langtools nashorn
  do
    # quilt doesnt seem to be able to handle symlinks
    # ln -s ../${subrepo}-${_repo_ver} ${subrepo}
    mv ../${subrepo}-${_repo_ver} ${subrepo}
  done

  # exit if quilt fails
  sed -i 's/^$QUILT push -a/$QUILT push -a || exit/' "${srcdir}/${_tuxjdkdir}/applyTuxjdk.sh"
  "${srcdir}/${_tuxjdkdir}/applyTuxjdk.sh"
}

build() {
  cd "${srcdir}/jdk8u-${_repo_ver}"

  unset JAVA_HOME
  # http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1346
  export MAKEFLAGS=${MAKEFLAGS/-j*}

  install -d -m 755 "${srcdir}/${_prefix}/"
  sh configure \
    --prefix="${srcdir}/${_prefix}" \
    --with-update-version="${_jdk_update}" \
    --with-build-number="b${_jdk_build}" \
    --with-milestone="fcs" \
    --with-user-release-suffix="tuxjdk" \
    --enable-unlimited-crypto \
    --with-zlib=system

    # TODO OpenJDK does not want last version of giflib (add 'giflib' as dependency once fixed)
    #--with-giflib=system \

  # Without 'DEBUG_BINARIES', i686 won't build
  # http://mail.openjdk.java.net/pipermail/core-libs-dev/2013-July/019203.html
  make \
    DEBUG_BINARIES=true
  # These help to debug builds:
  #LOG=trace HOTSPOT_BUILD_JOBS=1

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

  #--- jdk
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
