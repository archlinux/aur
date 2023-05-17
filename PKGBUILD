# Maintainer: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

# TODO add test, see about packaging jtreg and using it here

pkgbase=java-openj9
pkgname=('jre-openj9-headless' 'jre-openj9' 'jdk-openj9' 'openj9-src' 'openj9-doc')
_majorver=20
_minorver=0
_securityver=1
_updatever=9
_openj9ver=0.39.0
pkgrel=1
pkgver=${_majorver}${_minorver:+.${_minorver}}${_securityver:+.${_securityver}}.u${_updatever}_openj9_${_openj9ver}_pre20230517
arch=('x86_64')
url='http://www.eclipse.org/openj9/'
license=('custom')
makedepends=("java-environment>=$((_majorver-1))" 'cpio' 'unzip' 'zip' 'libelf' 'libcups' 'libx11'
             'libxrender' 'libxtst' 'libxt' 'libxext' 'libxrandr' 'alsa-lib'
             'graphviz' 'freetype2' 'libjpeg-turbo' 'giflib' 'libpng' 'lcms2'
             'libnet' 'bash' 'harfbuzz' 'gcc-libs' 'glibc' 'numactl' 'nasm' 'cmake')
_openjdk_sha=c6bbabab95ea24e30cf8c1225db464cff3e12594
_openj9_sha=8b5fd99a8d71561e94dcbdf84af681ef7d1bb701
_openj9omr_sha=e4f52d2e479f7e64e092dcec573f1fae864395cb
options=(!lto)
source=(openj9-openjdk-jdk${_majorver}-${_openjdk_sha:0:7}.tar.gz::https://github.com/ibmruntimes/openj9-openjdk-jdk${_majorver}/archive/${_openjdk_sha}.tar.gz
        openj9-${_openj9_sha:0:7}.tar.gz::https://github.com/eclipse/openj9/archive/${_openj9_sha}.tar.gz
        openj9-omr-${_openj9omr_sha:0:7}.tar.gz::https://github.com/eclipse/openj9-omr/archive/${_openj9omr_sha}.tar.gz
        freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop
        omr-omrstr-iconv-failure-overflow.patch
        openj9-openjdk-override-version.patch)
sha256sums=('dd590d1a30d5e8ebabc8dde557997bd6af898fa9cbe256afcb028d518311a2b9'
            'd0c1d158569e68858b977087e9010942e98755cead82d1ad08a05541df54b44c'
            '4f962ec233a814f0f8ffb46834e9a12d18233a508502bc876526cb845073b1bd'
            '7cb89746dbbcf498dd43b53fee59b124f42e3ea0d8b7134ab803cc2bd6b50230'
            'bf76024528d050fd912f72d73e18a814a930df3478b132a99a887fbbdc0c9dfd'
            'bd2d4da78a65eec20dc32e21fd4fe134a2483b0bbe2dfb940d66755acc237975'
            'f37290530dcb8eb5acb4f70609c55b7e2be134f1052ebf20f117c2996a749858'
            '2a97f38ee08ed6a80be38879b47b78fc710adb9dfb69c44d2a33bee45bd06263')

case "${CARCH}" in
  x86_64) _JARCH='x86_64';;
  i686)   _JARCH='x86';;
esac

_jvmdir=/usr/lib/jvm/java-${_majorver}-openj9
_jdkdir=openj9-openjdk-jdk${_majorver}-${_openjdk_sha}
_imgdir=${_jdkdir}/build/linux-${_JARCH}-server-release/images

_nonheadless=(lib/libawt_xawt.{so,debuginfo}
              lib/libjawt.{so,debuginfo}
              lib/libjsound.{so,debuginfo}
              lib/libsplashscreen.{so,debuginfo})

prepare() {
  cd ${_jdkdir}

  ln -s ../openj9-${_openj9_sha} openj9
  ln -s ../openj9-omr-${_openj9omr_sha} omr

  patch -d omr -p1 -i $srcdir/omr-omrstr-iconv-failure-overflow.patch
  patch -p1 -i $srcdir/openj9-openjdk-override-version.patch

  find openj9/ omr/ -name CMakeLists.txt -exec sed -i -e '/set(OMR_WARNINGS_AS_ERRORS ON/s/ON/OFF/' {} + || die
}

build() {
  cd ${_jdkdir}

  NUM_PROC_OPT=''
  MAKEFLAG_J=$(echo ${MAKEFLAGS} | sed -En 's/.*-j([0-9]+).*/\1/p')
  if [ -n "${MAKEFLAG_J}" ]; then
    # http://hg.openjdk.java.net/jdk10/jdk10/file/85e6cb013b98/make/InitSupport.gmk#l105
    echo "Removing '-j${MAKEFLAG_J}' from MAKEFLAGS to prevent build fail. Passing it directly to ./configure."
    export MAKEFLAGS=${MAKEFLAGS/-j${MAKEFLAG_J}/}
    NUM_PROC_OPT="--with-num-cores=${MAKEFLAG_J}"
  fi

  # Avoid optimization of HotSpot to be lowered from O3 to O2
  local _CFLAGS="${CFLAGS//-O2/-O3} ${CPPFLAGS} -fcommon"
  local _CXXFLAGS="${CXXFLAGS//-O2/-O3} ${CPPFLAGS} -fcommon"
  local _LDFLAGS=${LDFLAGS}
  if [[ ${CARCH} = i686 ]]; then
    echo "Removing '-fno-plt' from CFLAGS and CXXFLAGS to prevent build fail with this architecture"
    _CFLAGS=${CFLAGS/-fno-plt/}
    _CXXFLAGS=${CXXFLAGS/-fno-plt/}
  fi

  # TODO: Should be rechecked for the next releases
  # compiling with -fexceptions leads to:
  # /usr/bin/ld: /build/java-openjdk/src/jdk17u-jdk-17.0.3-2/build/linux-x86_64-server-release/hotspot/variant-server/libjvm/objs/zPhysicalMemory.o: in function `ZList<ZMemory>::~ZList()':
  # /build/java-openjdk/src/jdk17u-jdk-17.0.3-2/src/hotspot/share/gc/z/zList.hpp:54: undefined reference to `ZListNode<ZMemory>::~ZListNode()'
  # collect2: error: ld returned 1 exit status
  _CFLAGS=${CFLAGS/-fexceptions/}
  _CXXFLAGS=${CXXFLAGS/-fexceptions/}

  # CFLAGS, CXXFLAGS and LDFLAGS are ignored as shown by a warning
  # in the output of ./configure unless used like such:
  #  --with-extra-cflags="${CFLAGS}"
  #  --with-extra-cxxflags="${CXXFLAGS}"
  #  --with-extra-ldflags="${LDFLAGS}"
  # See also paragraph "Configure Control Variables from "jdk${_majorver}-${_git_tag}/common/doc/building.md
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  bash configure \
    --with-version-build="${_updatever}" \
    --with-version-pre="" \
    --with-version-opt="" \
    --with-stdc++lib=dynamic \
    --with-extra-cflags="${_CFLAGS}" \
    --with-extra-cxxflags="${_CXXFLAGS}" \
    --with-extra-ldflags="${_LDFLAGS}" \
    --with-libjpeg=system \
    --with-giflib=system \
    --with-libpng=system \
    --with-lcms=system \
    --with-zlib=system \
    --with-harfbuzz=system \
    --with-jvm-features=zgc \
    --enable-unlimited-crypto \
    --disable-warnings-as-errors{,-omr,-openj9} \
    --disable-ddr \
    --with-cmake \
    ${NUM_PROC_OPT}
    #--disable-javac-server

  local mycmakeargsx=(
    "-DCMAKE_C_FLAGS='${CFLAGS}'"
    "-DJ9JIT_EXTRA_CFLAGS='${CFLAGS}'"
    "-DCMAKE_CXX_FLAGS='${CXXFLAGS}'"
    "-DJ9JIT_EXTRA_CXXFLAGS='${CXXFLAGS}'"
    "-DCMAKE_EXE_LINKER_FLAGS='${LDFLAGS}'"
    -DOMR_WARNINGS_AS_ERRORS=OFF
    -DOMR_PORT_NUMA_SUPPORT=$(usex numa)
  )
  make \
    EXTRA_CMAKE_ARGS="${mycmakeargsx[*]}" \
    OPENJDK_SHA=${_openjdk_sha} \
    OPENJ9_SHA=${_openj9_sha} \
    OPENJ9_TAG=${_openj9ver} \
    OPENJ9OMR_SHA=${_openj9omr_sha} \
    images legacy-jre-image docs

  # https://bugs.openjdk.java.net/browse/JDK-8173610
  find "../${_imgdir}" -iname '*.so' -exec chmod +x {} \;
}

check() {
  cd ${_jdkdir}
  # TODO package jtreg
  # make -k check
}

package_jre-openj9-headless() {
  pkgdesc="OpenJDK Java ${_majorver} headless runtime environment"
  depends=('java-runtime-common>=3' 'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'libjpeg.so'
           'lcms2' 'liblcms2.so' 'libnet' 'freetype2' 'libfreetype.so' 'harfbuzz' 'libharfbuzz.so'
           'glibc' 'gcc-libs')
  optdepends=('java-rhino: for some JavaScript support')
  provides=("java-runtime-headless=${_majorver}" "java-runtime-headless-openj9=${_majorver}" "jre${_majorver}-openj9-headless=${pkgver}-${pkgrel}")
  backup=(etc/${pkgbase}/logging.properties
          etc/${pkgbase}/management/jmxremote.access
          etc/${pkgbase}/management/jmxremote.password.template
          etc/${pkgbase}/management/management.properties
          etc/${pkgbase}/net.properties
          etc/${pkgbase}/security/java.policy
          etc/${pkgbase}/security/java.security
          etc/${pkgbase}/security/policy/README.txt
          etc/${pkgbase}/security/policy/limited/default_US_export.policy
          etc/${pkgbase}/security/policy/limited/default_local.policy
          etc/${pkgbase}/security/policy/limited/exempt_local.policy
          etc/${pkgbase}/security/policy/unlimited/default_US_export.policy
          etc/${pkgbase}/security/policy/unlimited/default_local.policy
          etc/${pkgbase}/sound.properties)
  install=install_jre-openj9-headless.sh

  cd ${_imgdir}/jre

  install -dm 755 "${pkgdir}${_jvmdir}"

  cp -a bin lib \
    "${pkgdir}${_jvmdir}"

  for f in "${_nonheadless[@]}"; do
    rm "${pkgdir}${_jvmdir}/${f}"
  done

  cp ../jdk/release "${pkgdir}${_jvmdir}"
  cp ../jdk/lib/modules "${pkgdir}${_jvmdir}/lib"

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${pkgbase}"
  ln -s /etc/${pkgbase} "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -s ${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/${pkgbase} "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=../jdk/man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-openj9${_majorver}.1"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
}

package_jre-openj9() {
  pkgdesc="OpenJDK Java ${_majorver} full runtime environment"
  depends=("jre${_majorver}-openj9-headless=${pkgver}-${pkgrel}" 'giflib' 'libgif.so'
           'glibc' 'gcc-libs' 'libpng')
  optdepends=('alsa-lib: for basic sound support'
              'gtk2: for the Gtk+ 2 look and feel - desktop usage'
              'gtk3: for the Gtk+ 3 look and feel - desktop usage')
  provides=("java-runtime=${_majorver}" "java-runtime-openj9=${_majorver}" "jre${_majorver}-openj9=${pkgver}-${pkgrel}")
  install=install_jre-openj9.sh

  cd ${_imgdir}/jre

  install -dm 755 "${pkgdir}${_jvmdir}"

  for f in "${_nonheadless[@]}"; do
    install -Dm 644 ${f} "${pkgdir}${_jvmdir}/${f}"
  done

  # Licenses
  install -dm 755 "${pkgdir}/usr/share/licenses"
  ln -s ${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_jdk-openj9() {
  pkgdesc="OpenJDK Java ${_majorver} development kit"
  depends=("jre${_majorver}-openj9=${pkgver}-${pkgrel}" 'java-environment-common=3'
           'hicolor-icon-theme' 'libelf' 'glibc' 'gcc-libs')
  provides=("java-environment=${_majorver}" "java-environment-openj9=${_majorver}" "jdk${_majorver}-openj9=${pkgver}-${pkgrel}")
  install=install_jdk-openj9.sh

  cd ${_imgdir}/jdk

  install -dm 755 "${pkgdir}${_jvmdir}"

  cp -a bin include jmods lib \
    "${pkgdir}${_jvmdir}"

  rm "${pkgdir}${_jvmdir}/lib/src.zip"

  # Remove files held by JRE
  pushd ../jre
  for d in bin lib; do
    find ${d} ! -type d -exec rm "${pkgdir}${_jvmdir}/{}" \;
  done
  popd
  find "${pkgdir}${_jvmdir}/lib" -type d -empty -delete

  # Conf files all belong to JRE

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${pkgbase}"
  pushd ../jre/legal
  find . ! -type d -exec rm "${pkgdir}/usr/share/licenses/${pkgbase}/{}" \;
  popd
  find "${pkgdir}/usr/share/licenses" -type d -empty -delete
  ln -s ${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=man/man1/"${f}.1"
    test -f "../jre/bin/${f}" && continue
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-openj9${_majorver}.1"
  done

  # Icons
  for s in 16 24 32 48; do
    install -Dm 644 \
      "${srcdir}/${_jdkdir}/src/java.desktop/unix/classes/sun/awt/X11/java-icon${s}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/${pkgbase}.png"
  done

  # Desktop files
  for f in jconsole java jshell; do
    install -Dm 644 \
      "${srcdir}/freedesktop-${f}.desktop" \
      "${pkgdir}/usr/share/applications/${f}-${pkgbase}.desktop"
  done
}

package_openj9-src() {
  pkgdesc="OpenJDK Java ${_majorver} sources"
  # Depends on JDK to get license files
  depends=("jdk${_majorver}-openj9=${pkgver}-${pkgrel}")
  provides=("openj9-${_majorver}-src=${pkgver}-${pkgrel}")

  install -Dm 644 -t "${pkgdir}${_jvmdir}/lib" ${_imgdir}/jdk/lib/src.zip

  install -dm 755 "${pkgdir}/usr/share/licenses"
  ln -s ${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_openj9-doc() {
  pkgdesc="OpenJDK Java ${_majorver} documentation"
  # Depends on JDK to get license files
  depends=("jdk${_majorver}-openj9=${pkgver}-${pkgrel}")
  provides=("openj9-${_majorver}-doc=${pkgver}-${pkgrel}")

  install -dm 755 "${pkgdir}/usr/share/doc"
  cp -r ${_imgdir}/docs "${pkgdir}/usr/share/doc/${pkgbase}"

  install -dm 755 "${pkgdir}/usr/share/licenses"
  ln -s ${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
