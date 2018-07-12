# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Boyan Ding <stu_dby@126.com>

# TODO
# once icedtea:
#   pulse
#   add policytool desktop files

# Package 'openjfx' must be updated when this one is
pkgname=('jre8-openjdk-shenandoah-headless' 'jre8-openjdk-shenandoah' 'jdk8-openjdk-shenandoah' 'openjdk8-shenandoah-src' 'openjdk8-shenandoah-doc')
pkgbase=java8-openjdk-shenandoah
_java_ver=8
# Found @ http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
_jdk_update=172
_jdk_build=10
# _repo_ver=jdk${_java_ver}u${_jdk_update}-b${_jdk_build}
pkgrel=1
arch=('x86_64')
url='http://openjdk.java.net/'
license=('custom')
makedepends=('jdk7-openjdk' 'ccache' 'cpio' 'unzip' 'zip' 'gcc7'
             'libxrender' 'libxtst' 'fontconfig' 'libcups' 'alsa-lib')
_url_src=http://hg.openjdk.java.net/shenandoah/jdk8u
_last_update=20180712
declare -g -A _repo_versions=(
    [jdk8u]=90b7e0f4f9a4
    [corba]=53cca1228345
    [hotspot]=4a418de67168
    [jdk]=e9cec57ebc22
    [jaxws]=9b184a26e260
    [jaxp]=d9feb209c2c2
    [langtools]=237e527ccd62
    [nashorn]=66f1a77ea0a1
)
pkgver=${_java_ver}.u${_jdk_update}_${_last_update}_hotspot${_repo_versions[hotspot]}
source=("jdk8u-${_repo_versions[jdk8u]}.tar.gz::${_url_src}/archive/${_repo_versions[jdk8u]}.tar.gz"
        "corba-${_repo_versions[corba]}.tar.gz::${_url_src}/corba/archive/${_repo_versions[corba]}.tar.gz"
        "hotspot-${_repo_versions[hotspot]}.tar.gz::${_url_src}/hotspot/archive/${_repo_versions[hotspot]}.tar.gz"
        "jdk-${_repo_versions[jdk]}.tar.gz::${_url_src}/jdk/archive/${_repo_versions[jdk]}.tar.gz"
        "jaxws-${_repo_versions[jaxws]}.tar.gz::${_url_src}/jaxws/archive/${_repo_versions[jaxws]}.tar.gz"
        "jaxp-${_repo_versions[jaxp]}.tar.gz::${_url_src}/jaxp/archive/${_repo_versions[jaxp]}.tar.gz"
        "langtools-${_repo_versions[langtools]}.tar.gz::${_url_src}/langtools/archive/${_repo_versions[langtools]}.tar.gz"
        "nashorn-${_repo_versions[nashorn]}.tar.gz::${_url_src}/nashorn/archive/${_repo_versions[nashorn]}.tar.gz")

sha256sums=('d2fb1fc814536dd77b4fee6730382656ce6fedf78d536306109e1e257a2c3799'
            '69265d60d74eace306140718a2b2bbad59ed0dcbec8bb3b129f20f50301453ac'
            'c17ecc4b1445539418f0947069626dd5c264fa1e5be6bdc7f2bff0ca84e05f04'
            '1f394de0df11fc403dad489f2bfe626ab62fd8f0e4023441f93633d3183a7497'
            'ca2bee1afee5770bb932f65d1c47bb965b4f755771ed7dd90b2330d8a57c0296'
            'e72a301bad45899a4f62800f5af556272e54069ae2ecca8fd60f569dd8abbc76'
            '7b59da48906fed5ff96c72b1925c218b6908d9bb50e57164a6a7c18b174a79b3'
            '7b3a5476637e4cd3ff1b65e40a948951d676a51f4b4498ec8f727aa263d7882a')

case "${CARCH}" in
  'x86_64') _JARCH=amd64 ; _DOC_ARCH=x86_64 ;;
  'i686'  ) _JARCH=i386  ; _DOC_ARCH=x86    ;;
esac

_jdkname=openjdk8
_jvmdir=/usr/lib/jvm/java-8-openjdk-shenandoah
_prefix="jdk8u-${_repo_versions[jdk8u]}/image"
_imgdir="${_prefix}/jvm/openjdk-1.8.0_$(printf '%.2d' ${_jdk_update})"
_nonheadless=(bin/policytool
              lib/${_JARCH}/libjsound.so
              lib/${_JARCH}/libjsoundalsa.so
              lib/${_JARCH}/libsplashscreen.so)

prepare() {
  cd "${srcdir}/jdk8u-${_repo_versions[jdk8u]}"

  for subrepo in corba hotspot jdk jaxws jaxp langtools nashorn
  do
    ln -s "../${subrepo}-${_repo_versions[$subrepo]}" ${subrepo}
  done
}

build() {
  cd "${srcdir}/jdk8u-${_repo_versions[jdk8u]}"

  unset JAVA_HOME
  # http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1346
  export MAKEFLAGS=${MAKEFLAGS/-j*}
  # https://hydra.nixos.org/build/41230444/log
  export CFLAGS="-Wno-error=deprecated-declarations -fno-lifetime-dse -fno-delete-null-pointer-checks"

  export CC=gcc-7 CXX=g++-7

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

package_jre8-openjdk-shenandoah-headless() {
  pkgdesc='OpenJDK Java 8 headless runtime environment'
  depends=('java-runtime-common' 'ca-certificates-utils' 'nss')
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
  replaces=('jre8-openjdk-wm')

  cd "${srcdir}/${_imgdir}/jre"

  # TODO? Should /usr/lib/jvm/java-8-openjdk/jre/lib/sound.properties belong to jre?
  for f in "${_nonheadless[@]}"; do
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
      # Copy man page (skip to avoid conflicts)
      # install -D -m 644 ../man/man1/${b}.1 "${pkgdir}/usr/share/man/man1/${b}-${_jdkname}.1"
      # install -D -m 644 ../man/ja/man1/${b}.1 "${pkgdir}/usr/share/man/ja/man1/${b}-${_jdkname}.1"
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

package_openjdk8-shenandoah-src() {
  pkgdesc='OpenJDK Java 8 sources'

  install -D "${srcdir}/${_imgdir}/src.zip" "${pkgdir}${_jvmdir}/src.zip"
}

package_openjdk8-shenandoah-doc() {
  pkgdesc='OpenJDK Java 8 documentation'

  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgbase}/"
  cp -r "${srcdir}"/jdk8u-${_repo_versions[jdk8u]}/build/linux-${_DOC_ARCH}-normal-server-release/docs/* \
    "${pkgdir}/usr/share/doc/${pkgbase}/"
}
