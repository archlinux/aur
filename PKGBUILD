# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Christoph Bayer <chrbayer@criby.de>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Boyan Ding <stu_dby@126.com>

# TODO
# once icedtea:
#   pulse
#   add policytool desktop files

# Package 'openjfx' must be updated when this one is
pkgname=('jre8-openjdk-headless-infinality' 'jre8-openjdk-infinality' 'jdk8-openjdk-infinality')
pkgbase=java8-openjdk
_java_ver=8
# Found @ http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
_jdk_update=152
_jdk_build=03
pkgver=${_java_ver}.u${_jdk_update}
_repo_ver=jdk${_java_ver}u${_jdk_update}-b${_jdk_build}
pkgrel=1
arch=('i686' 'x86_64')
url='http://openjdk.java.net/'
license=('custom')
makedepends=('java-environment>=7' 'cpio' 'unzip' 'zip' 'libxrender' 'libxtst'
            'fontconfig' 'libcups' 'alsa-lib' 'fontconfig')
_url_src=http://hg.openjdk.java.net/jdk8u/jdk8u
source=(jdk8u-${_repo_ver}.tar.gz::${_url_src}/archive/${_repo_ver}.tar.gz
        corba-${_repo_ver}.tar.gz::${_url_src}/corba/archive/${_repo_ver}.tar.gz
        hotspot-${_repo_ver}.tar.gz::${_url_src}/hotspot/archive/${_repo_ver}.tar.gz
        jdk-${_repo_ver}.tar.gz::${_url_src}/jdk/archive/${_repo_ver}.tar.gz
        jaxws-${_repo_ver}.tar.gz::${_url_src}/jaxws/archive/${_repo_ver}.tar.gz
        jaxp-${_repo_ver}.tar.gz::${_url_src}/jaxp/archive/${_repo_ver}.tar.gz
        langtools-${_repo_ver}.tar.gz::${_url_src}/langtools/archive/${_repo_ver}.tar.gz
        nashorn-${_repo_ver}.tar.gz::${_url_src}/nashorn/archive/${_repo_ver}.tar.gz
        add-fontconfig.patch
        enable-infinality.patch)
sha256sums=('e5719264ea5370815c233bb8f055eacef4e4aaaef971fb84f731926ce9bc20f6'
            '6968085c367e832a4b166daab89eaf61bb58acbe8d930a3d944ff2327bd846a2'
            '183f958982b2a1c4f10fc834ae8e8d4ac254bf1a65373fd001ab4e58a99b0983'
            'ea44540bf90913ba5d122b093005d6e2ebfb0a07535187dc71f1cda639b8d185'
            'f3d8c2342970c229985d32bb49e84d007f50df5a6b27991b8e1473ff45832bfc'
            '843a397b1d610db27b378d006ade2d98ce53d5e1f7952bf64fa865f0119e6fd0'
            '4d336740d2e94d2406eb310acc64b95332e5f276143e38efe663f42f67601e7b'
            '7f94034dd260c5f14a8cf3ef66b05452ca991e3d0e7a22a5513385124a8c8fc4'
            '3e67013b249fe702b0176e5d39f7ddef85ef0df121ef0b3a898ea82772712f55'
            'efeee8db0710bc217b5e886224450f6cf50938004e8c140eb9aee0a699d2d5ac')



case "${CARCH}" in
  'x86_64') _JARCH=amd64 ;;
  'i686'  ) _JARCH=i386  ;;
esac

_jdkname=openjdk8
_jvmdir=/usr/lib/jvm/java-8-openjdk
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
    ln -s ../${subrepo}-${_repo_ver} ${subrepo}
  done

  #patch -p1 < ../build_with_gcc6.patch

  # Apply infinality patches
  cd "${srcdir}/jdk8u-${_repo_ver}/jdk"
  patch -p1 < "${srcdir}/add-fontconfig.patch"
  patch -p1 < "${srcdir}/enable-infinality.patch"
}

build() {
  cd "${srcdir}/jdk8u-${_repo_ver}"

  unset JAVA_HOME
  # _JAVA_OPTIONS breaks installed Java version check
  unset _JAVA_OPTIONS
  # https://bugs.archlinux.org/task/44164
  unset CLASSPATH
  # http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1346
  export MAKEFLAGS=${MAKEFLAGS/-j*}
  # Fixes build issues for some people
  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  export CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"


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
  #LOG=trace HOTSPOT_BUILD_JOBS=1

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

package_jre8-openjdk-headless-infinality() {
  pkgdesc='OpenJDK Java 8 headless runtime environment with infinality patch applied'
  depends=('java-runtime-common' 'ca-certificates-utils' 'nss')
  optdepends=('java-rhino: for some JavaScript support')
  provides=('java-runtime-headless=8' 'java-runtime-headless-openjdk=8')
  conflicts=('jre8-openjdk-headless')
  # Upstream config files that should go to etc and get backup
  _backup_etc=(etc/java-8-openjdk/${_JARCH}/jvm.cfg
               etc/java-8-openjdk/calendars.properties
               etc/java-8-openjdk/content-types.properties
               etc/java-8-openjdk/flavormap.properties
               etc/java-8-openjdk/images/cursors/cursors.properties
               etc/java-8-openjdk/logging.properties
               etc/java-8-openjdk/management/jmxremote.access
               etc/java-8-openjdk/management/jmxremote.password
               etc/java-8-openjdk/management/management.properties
               etc/java-8-openjdk/management/snmp.acl
               etc/java-8-openjdk/net.properties
               etc/java-8-openjdk/psfont.properties.ja
               etc/java-8-openjdk/psfontj2d.properties
               etc/java-8-openjdk/security/java.policy
               etc/java-8-openjdk/security/java.security
               etc/java-8-openjdk/sound.properties)
  replaces=('jre8-openjdk-headless-wm')
  backup=(${_backup_etc[@]})
  install=install_jre8-openjdk-headless.sh

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
    _filepkgpath=${_jvmdir}/jre/lib/${file#etc/java-8-openjdk/}
    install -D -m 644 "${pkgdir}${_filepkgpath}" "${pkgdir}/${file}"
    ln -sf /${file} "${pkgdir}${_filepkgpath}"
  done
}

package_jre8-openjdk-infinality() {
  pkgdesc='OpenJDK Java 8 full runtime environment with infinality patch applied'
  depends=("jre8-openjdk-headless-infinality=${pkgver}-${pkgrel}" 'xdg-utils' 'hicolor-icon-theme')
  optdepends=('icedtea-web: web browser plugin + Java Web Start'
              'alsa-lib: for basic sound support'
              'gtk2: for the Gtk+ look and feel - desktop usage'
              'java-openjfx: for JavaFX GUI components support')
  # TODO when adding IcedTea: 'giflib: for gif format support'
  # TODO when adding IcedTea: 'libpulse: for advanced sound support'
  provides=('java-runtime=8' 'java-runtime-openjdk=8')
  conflicts=('jre8-openjdk')
  install=install_jre8-openjdk.sh
  replaces=('jre8-openjdk-wm')

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

package_jdk8-openjdk-infinality() {
  pkgdesc='OpenJDK Java 8 development kit with infinality patch applied'
  depends=('java-environment-common' "jre8-openjdk-infinality=${pkgver}-${pkgrel}")
  provides=('java-environment=8' 'java-environment-openjdk=8')
  conflicts=('jdk8-openjdk')
  replaces=('jdk8-openjdk-wm')
  install=install_jdk8-openjdk.sh

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
