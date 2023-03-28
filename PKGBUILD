# Maintainer: 90 <hi@90.gripe>
# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Boyan Ding <stu_dby@126.com>

pkgname=('jre8-openjdk-headless-xdg' 'jre8-openjdk-xdg' 'jdk8-openjdk-xdg' 'openjdk8-src-xdg' 'openjdk8-doc-xdg')
pkgbase=java8-openjdk-xdg

_majorver=8
_minorver=362
_updatever=09
pkgver=${_majorver}.${_minorver}.u${_updatever}
pkgrel=1
arch=('x86_64')
url='https://openjdk.java.net/'
license=('custom')
makedepends=(
  'alsa-lib'
  'bash'
  'ccache'
  'cpio'
  'fontconfig'
  'giflib'
  'git'
  'java-environment=8'
  'libcups'
  'libxrender'
  'libxtst'
  'unzip'
  'zip'
)
options=(!lto)
source=(https://github.com/openjdk/jdk${_majorver}u/archive/refs/tags/jdk${_majorver}u${_minorver}-b${_updatever}.tar.gz
        gcc11.patch
        xdg-basedir-compliant-fontconfig.patch
        xdg-basedir-compliant-userPrefs.patch)
b2sums=('f415dad93d2525f0f02450bd86268cd8382376e80188803995df97e5d04ade8f9818d402f1cbb7b961f5ab0947dc8ce33635cdf187ad637c3f7b959487c86b4a'
        '9679e4dfb6027a87376081489c09810812d6849573afac4ea96abe3a3e00ca5b6af7d0ffb010c43b93cfa913f9e97fbb9f11e19fcc86a89b4548442671c32da1'
        '6830ceb798143ea63a21aba28852633fd57d28924f60a85a454f19aba4b6d3da06ece2c9423b9ece057977064454f1ec4558f6b0b8acceeb8a3b973809c2e928'
        '0569a669d67c278f584bccdb52304ba9ce3cce4dc89d1bc3fdd1ecc13881070981a54fc53125de50713d8c83e1e7f3290f6a5d8fbc4ae94ea1e38fc474549f5c')

case "${CARCH}" in
  'x86_64') _JARCH=amd64 ; _DOC_ARCH=x86_64 ;;
  'i686'  ) _JARCH=i386  ; _DOC_ARCH=x86    ;;
esac

_jdkname=openjdk8
_jvmdir=/usr/lib/jvm/java-8-openjdk
_prefix="jdk8u/image"
_imgdir="${_prefix}/jvm/openjdk-1.8.0_$(printf '%.2d' ${_minorver})"
_nonheadless=(bin/policytool
              lib/${_JARCH}/libjsound.so
              lib/${_JARCH}/libjsoundalsa.so
              lib/${_JARCH}/libsplashscreen.so)

prepare() {
  cd jdk8u-jdk${_majorver}u${_minorver}-b${_updatever}

  # Fix build with C++17 (Fedora)
  patch -Np1 -i "${srcdir}"/gcc11.patch
  
  # Add XDG Base Directory compliance
  patch -p1 -i "${srcdir}"/xdg-basedir-compliant-fontconfig.patch
  patch -p1 -i "${srcdir}"/xdg-basedir-compliant-userPrefs.patch
}

build() {
  cd jdk8u-jdk${_majorver}u${_minorver}-b${_updatever}

  unset JAVA_HOME
  # http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1346
  export MAKEFLAGS=${MAKEFLAGS/-j*}

  # Avoid optimization of HotSpot being lowered from O3 to O2
  # -fno-exceptions for FS#73134
  export CFLAGS="${CFLAGS//-O2/-O3} -Wno-error=nonnull -Wno-error=deprecated-declarations -Wno-error=stringop-overflow= -Wno-error=return-type -Wno-error=cpp -fno-lifetime-dse -fno-delete-null-pointer-checks -fcommon -fno-exceptions -Wno-error=format-overflow="
  export CXXFLAGS="${CXXFLAGS} -fcommon -fno-exceptions"

  install -d -m 755 "${srcdir}/${_prefix}/"
  bash configure \
    --prefix="${srcdir}/${_prefix}" \
    --with-update-version="${_minorver}" \
    --with-build-number="b${_updatever}" \
    --with-milestone="fcs" \
    --enable-unlimited-crypto \
    --with-giflib=system \
    --with-zlib=system \
    --with-extra-cflags="${CFLAGS}" \
    --with-extra-cxxflags="${CXXFLAGS}" \
    --with-extra-ldflags="${LDFLAGS}"

  # These help to debug builds: LOG=trace HOTSPOT_BUILD_JOBS=1
  # Without 'DEBUG_BINARIES', i686 won't build: http://mail.openjdk.java.net/pipermail/core-libs-dev/2013-July/019203.html
  make
  make docs

  # FIXME sadly 'DESTDIR' is not used here!
  make install

  cd ../${_imgdir}

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
  cd jdk8u-jdk${_majorver}u${_minorver}-b${_updatever}
  #make -k test
}

package_jre8-openjdk-headless-xdg() {
  pkgdesc="OpenJDK Java ${_majorver} headless runtime environment - with improved Support for the XDG Base Directory Specification"
  depends=('java-runtime-common' 'ca-certificates-utils' 'nss')
  optdepends=('java-rhino: for some JavaScript support')
  provides=("java-runtime-headless=${_majorver}" "java-runtime-headless-openjdk=${_majorver}" "jre${_majorver}-openjdk-headless=${pkgver}-${pkgrel}")
  conflicts=("jre${_majorver}-openjdk-headless")
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

  cd ${_imgdir}/jre

  install -d -m 755 "${pkgdir}${_jvmdir}/jre/"
  cp -a bin lib "${pkgdir}${_jvmdir}/jre"

  cp ../release "${pkgdir}${_jvmdir}" # FS#52692

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
    _filepkgpath=${_jvmdir}/jre/lib/${file#etc/java-8-openjdk/}
    install -D -m 644 "${pkgdir}${_filepkgpath}" "${pkgdir}/${file}"
    ln -sf /${file} "${pkgdir}${_filepkgpath}"
  done
}

package_jre8-openjdk-xdg() {
  pkgdesc="OpenJDK Java ${_majorver} full runtime environment - with improved Support for the XDG Base Directory Specification"
  depends=(
    "jre8-openjdk-headless=${pkgver}-${pkgrel}"
    'xdg-utils'
    'hicolor-icon-theme'
    'giflib'
  )
  optdepends=('icedtea-web: web browser plugin + Java Web Start'
              'alsa-lib: for basic sound support'
              'gtk2: for the Gtk+ look and feel - desktop usage'
              'java8-openjfx: for JavaFX GUI components support')
  provides=("java-runtime=${_majorver}" "java-runtime-openjdk=${_majorver}" "jre${_majorver}-openjdk=${pkgver}-${pkgrel}")
  conflicts=("jre${_majorver}-openjdk")
  install=install_jre8-openjdk.sh
  replaces=('jre8-openjdk-wm')

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

package_jdk8-openjdk-xdg() {
  pkgdesc="OpenJDK Java ${_majorver} development kit - with improved Support for the XDG Base Directory Specification"
  depends=('java-environment-common' "jre8-openjdk=${pkgver}-${pkgrel}")
  provides=("java-environment=${_majorver}" "java-environment-openjdk=${_majorver}" "jdk${_majorver}-openjdk=${pkgver}-${pkgrel}")
  conflicts=("jdk${_majorver}-openjdk")
  replaces=('jdk8-openjdk-wm')
  install=install_jdk8-openjdk.sh

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

package_openjdk8-src-xdg() {
  pkgdesc="OpenJDK Java ${_majorver} sources - with improved Support for the XDG Base Directory Specification"
  provides=("openjdk${_majorver}-src=${pkgver}-${pkgrel}")
  conflicts=("openjdk${_majorver}-src")

  install -D "${srcdir}/${_imgdir}/src.zip" "${pkgdir}${_jvmdir}/src.zip"
}

package_openjdk8-doc-xdg() {
  pkgdesc="OpenJDK Java ${_majorver} documentation - with improved Support for the XDG Base Directory Specification"
  provides=("openjdk${_majorver}-doc=${pkgver}-${pkgrel}")
  conflicts=("openjdk${_majorver}-doc")

  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgbase}/"
  cp -r "${srcdir}"/jdk8u-jdk${_majorver}u${_minorver}-b${_updatever}/build/linux-${_DOC_ARCH}-normal-server-release/docs/* \
    "${pkgdir}/usr/share/doc/${pkgbase}/"
}

# vim: ts=2 sw=2 et:
