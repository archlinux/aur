# Maintainer: Andreas "Cocaine Johnsson" Björkman <akb95@disroot.org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Boyan Ding <stu_dby@126.com>

# I don't intend to address these,
# I just adopted the package since it was months out of date
# If you want them fixed, I'll gladly give you the package.
# TODO
# once icedtea:
#   pulse
#   add policytool desktop files

# Package 'openjfx' must be updated when this one is
pkgname=('jre8-openjdk-shenandoah-headless' 'jre8-openjdk-shenandoah' 'jdk8-openjdk-shenandoah' 'openjdk8-shenandoah-src' 'openjdk8-shenandoah-doc')
pkgbase=java8-openjdk-shenandoah
_java_ver=8
_jdk_update=302
_jdk_build=08
_repo_ver=aarch64-shenandoah-jdk${_java_ver}u${_jdk_update}-b${_jdk_build}
pkgrel=2
arch=('x86_64')
url='https://openjdk.java.net/'
license=('custom')
makedepends=('java-environment=8' 'cpio' 'unzip' 'zip' 'gcc8' 'giflib'
             'libxrender' 'libxtst' 'fontconfig' 'libcups' 'alsa-lib')
_url_src=http://hg.openjdk.java.net/aarch64-port/jdk8u-shenandoah
pkgver=${_java_ver}.u${_jdk_update}b${_jdk_build}
source=("jdk8u-${_repo_ver}.tar.gz::${_url_src}/archive/${_repo_ver}.tar.gz"
        "corba-${_repo_ver}.tar.gz::${_url_src}/corba/archive/${_repo_ver}.tar.gz"
        "hotspot-${_repo_ver}.tar.gz::${_url_src}/hotspot/archive/${_repo_ver}.tar.gz"
        "jdk-${_repo_ver}.tar.gz::${_url_src}/jdk/archive/${_repo_ver}.tar.gz"
        "jaxws-${_repo_ver}.tar.gz::${_url_src}/jaxws/archive/${_repo_ver}.tar.gz"
        "jaxp-${_repo_ver}.tar.gz::${_url_src}/jaxp/archive/${_repo_ver}.tar.gz"
        "langtools-${_repo_ver}.tar.gz::${_url_src}/langtools/archive/${_repo_ver}.tar.gz"
        "nashorn-${_repo_ver}.tar.gz::${_url_src}/nashorn/archive/${_repo_ver}.tar.gz")

sha256sums=('560750630652cf96f6f17b50d072f56a86f62b6928cf256a016047c3904f90fa'
            '91a5d894b3db6e594ceab35b1ead9057a9239695d184cda7f3b4cc3c86f64813'
            '5e6402e2f1eb9a28fef1a2369e7d479be8ccf229c10ed8a1bd395da13c5fa5c1'
            '1292c22710213a97ba7a10a516e86b600874de321e025a2dfb194a328e320102'
            '83b28da5442d19f64088c6693681290b9979f88c71f13276bf5742531cfdf6b6'
            'f946dab7e4710f3b421cf12553545463640f21b334d1449d8edaadb35f75e924'
            '459f927af167ad60d4998c5493df330cf8f0aa36a1f44fde4d31e202d3d4fdae'
            '3e12895fe11c35756c09faefde4782cdec2424d46a6c8a92858fdec1cc2a7f4a')

case "${CARCH}" in
  'x86_64') _JARCH=amd64 ; _DOC_ARCH=x86_64 ;;
  'i686'  ) _JARCH=i386  ; _DOC_ARCH=x86    ;;
esac

_jdkname=openjdk8
_jvmdir=/usr/lib/jvm/java-8-openjdk-shenandoah
_prefix="jdk8u-${_repo_ver}/image"
_imgdir="${_prefix}/jvm/openjdk-1.8.0_$(printf '%.2d' ${_jdk_update})"
_nonheadless=(bin/policytool
              lib/${_JARCH}/libjsound.so
              lib/${_JARCH}/libjsoundalsa.so
              lib/${_JARCH}/libsplashscreen.so)

prepare() {
  cd "${srcdir}/jdk8u-shenandoah-${_repo_ver}"
  for subrepo in corba hotspot jdk jaxws jaxp langtools nashorn; do
    ln -s "../${subrepo}-${_repo_ver}" ${subrepo}
  done
}

build() {
  cd "${srcdir}/jdk8u-shenandoah-${_repo_ver}"

  # Detecting Java version by the first line of the output
  # of `java --version` is such a great idea
  unset JAVA_HOME _JAVA_OPTIONS
  # http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1346
  export MAKEFLAGS=${MAKEFLAGS/-j*}

  # We filter out -O flags so that the optimization of HotSpot is not lowered from O3 to O2
  export CFLAGS="${CFLAGS//-O2/-O3} ${CPPFLAGS} -Wno-error=deprecated-declarations -Wno-error=stringop-overflow= -Wno-error=return-type -Wno-error=cpp -fno-lifetime-dse -fno-delete-null-pointer-checks"
  export CXXFLAGS="${CXXFLAGS} ${CPPFLAGS}"

  # I honestly tried my best to update this package to gcc11
  # but it wasn't meant to be, even with a handful of patches
  # to the VM it still wouldn't compile, most likely it depends
  # on a gcc8 quirk. Very sad since gcc8 takes 8+ hours to build

  install -d -m 755 "${srcdir}/${_prefix}/"
  CfC=gcc-8 CXX=g++-8 sh configure \
    --prefix="${srcdir}/${_prefix}" \
    --with-update-version="${_jdk_update}" \
    --with-build-number="b${_jdk_build}" \
    --with-milestone="fcs" \
    --enable-unlimited-crypto \
    --with-zlib=system \
    --with-giflib=system \
    --with-extra-cflags="${CFLAGS}" \
    --with-extra-cxxflags="${CXXFLAGS}" \
    --with-extra-ldflags="${LDFLAGS}"

  # TODO OpenJDK does not want last version of giflib (add 'giflib' as dependency once fixed)
  #--with-giflib=system \

  # These help to debug builds: LOG=trace HOTSPOT_BUILD_JOBS=1
  # Without 'DEBUG_BINARIES', i686 won't build: http://mail.openjdk.java.net/pipermail/core-libs-dev/2013-July/019203.html
  make
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

check() {
  cd "${srcdir}/jdk8u-shenandoah-${_repo_ver}"
  make -k test
}

package_jre8-openjdk-shenandoah-headless() {
  pkgdesc='OpenJDK Java 8 headless runtime environment'
  depends=('java-runtime-common' 'ca-certificates-utils' 'nss' 'giflib')
  optdepends=('java-rhino: for some JavaScript support')
  provides=('java-runtime-headless=8' 'java-runtime-headless-openjdk=8' 'java-runtime-headless-shenandoah=8')
  # Upstream config files that should go to etc and get backup
  _backup_etc=(etc/java-8-openjdk-shenandoah/${_JARCH}/jvm.cfg
               etc/java-8-openjdk-shenandoah/calendars.properties
               etc/java-8-openjdk-shenandoah/content-types.properties
               etc/java-8-openjdk-shenandoah/flavormap.properties
               etc/java-8-openjdk-shenandoah/images/cursors/cursors.properties
               etc/java-8-openjdk-shenandoah/logging.properties
               etc/java-8-openjdk-shenandoah/management/jmxremote.access
               etc/java-8-openjdk-shenandoah/management/jmxremote.password
               etc/java-8-openjdk-shenandoah/management/management.properties
               etc/java-8-openjdk-shenandoah/management/snmp.acl
               etc/java-8-openjdk-shenandoah/net.properties
               etc/java-8-openjdk-shenandoah/psfont.properties.ja
               etc/java-8-openjdk-shenandoah/psfontj2d.properties
               etc/java-8-openjdk-shenandoah/security/java.policy
               etc/java-8-openjdk-shenandoah/security/java.security
               etc/java-8-openjdk-shenandoah/sound.properties)
  backup=(${_backup_etc[@]})
  install=install_jre8-openjdk-headless.sh

  cd "${srcdir}/${_imgdir}/jre"

  install -d -m 755 "${pkgdir}${_jvmdir}/jre/"
  cp -rv --no-preserve=ownership bin lib "${pkgdir}${_jvmdir}/jre"

  # Set config files
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/jmxremote.password{.template,}
  mv "${pkgdir}${_jvmdir}"/jre/lib/management/snmp.acl{.template,}

  # Remove 'non-headless' lib files
  for f in "${_nonheadless[@]}"; do
    rm "${pkgdir}${_jvmdir}/jre/${f}"
  done

  # Man pages (skip to avoid conflict)
  # pushd "${pkgdir}${_jvmdir}/jre/bin"
  # install -d -m 755 "${pkgdir}"/usr/share/man/{,ja/}man1/
  # for file in *; do
  #   install -m 644 "${srcdir}/${_imgdir}/man/man1/${file}.1" \
  #     "${pkgdir}/usr/share/man/man1/${file}-${_jdkname}.1"
  #   install -m 644 "${srcdir}/${_imgdir}/man/ja/man1/${file}.1" \
  #     "${pkgdir}/usr/share/man/ja/man1/${file}-${_jdkname}.1"
  # done
  # popd

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
    _filepkgpath=${_jvmdir}/jre/lib/${file#etc/java-8-openjdk-shenandoah/}
    install -D -m 644 "${pkgdir}${_filepkgpath}" "${pkgdir}/${file}"
    ln -sf /${file} "${pkgdir}${_filepkgpath}"
  done
}

package_jre8-openjdk-shenandoah() {
  pkgdesc='OpenJDK Java 8 full runtime environment'
  depends=("jre8-openjdk-shenandoah-headless=${pkgver}-${pkgrel}" 'xdg-utils' 'hicolor-icon-theme')
  optdepends=('icedtea-web: web browser plugin + Java Web Start'
              'alsa-lib: for basic sound support'
              'gtk2: for the Gtk+ look and feel - desktop usage'
              'java-openjfx: for JavaFX GUI components support')
  # TODO when adding IcedTea: 'giflib: for gif format support'
  # TODO when adding IcedTea: 'libpulse: for advanced sound support'
  provides=('java-runtime=8' 'java-runtime-openjdk=8' 'java-runtime-openjdk-shenandoah=8')
  install=install_jre8-openjdk.sh

  cd "${srcdir}/${_imgdir}/jre"

  for f in ${_nonheadless[@]}; do
    install -D ${f} "${pkgdir}${_jvmdir}/jre/${f}"
  done

  # Man pages (skip to avoid conflict)
  # pushd "${pkgdir}${_jvmdir}/jre/bin"
  # install -d -m 755 "${pkgdir}"/usr/share/man/{,ja/}man1/
  # for file in *; do
  #   install -m 644 "${srcdir}/${_imgdir}/man/man1/${file}.1" \
  #     "${pkgdir}/usr/share/man/man1/${file}-${_jdkname}.1"
  #   install -m 644 "${srcdir}/${_imgdir}/man/ja/man1/${file}.1" \
  #     "${pkgdir}/usr/share/man/ja/man1/${file}-${_jdkname}.1"
  # done
  # popd

  # Desktop files
  # TODO add these when switching to IcedTea
  #install -D -m 644 "${srcdir}/icedtea-${_icedtea_ver}/policytool.desktop" \
  #                  "${pkgdir}/usr/share/applications/policytool.desktop"

  # Install license
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgbase}/"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_jdk8-openjdk-shenandoah() {
  pkgdesc='OpenJDK Java 8 development kit'
  depends=('java-environment-common' "jre8-openjdk-shenandoah=${pkgver}-${pkgrel}")
  provides=('java-environment=8' 'java-environment-openjdk=8' 'java-environment-openjdk-shenandoah=8')
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
      # Copy man page (skip to avoid conflicts)
      # install -D -m 644 ../man/man1/${b}.1 "${pkgdir}/usr/share/man/man1/${b}-${_jdkname}.1"
      # install -D -m 644 ../man/ja/man1/${b}.1 "${pkgdir}/usr/share/man/ja/man1/${b}-${_jdkname}.1"
    fi
  done
  popd

  # Handling 'java-rmi.cgi' separately
  install -D -m 755 bin/java-rmi.cgi "${pkgdir}${_jvmdir}/bin/java-rmi.cgi"

  # link license
  install -d -m 755 "${pkgdir}/usr/share/licenses/"
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_openjdk8-shenandoah-src() {
  pkgdesc='OpenJDK Java 8 sources'

  install -D "${srcdir}/${_imgdir}/src.zip" "${pkgdir}${_jvmdir}/src.zip"
}

package_openjdk8-shenandoah-doc() {
  pkgdesc='OpenJDK Java 8 documentation'

  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgbase}/"
  cp -r "${srcdir}"/jdk8u-shenandoah-${_repo_ver}/build/linux-${_DOC_ARCH}-normal-server-release/docs/* \
    "${pkgdir}/usr/share/doc/${pkgbase}/"
}

# vim: ts=2 sw=2 sts=2
