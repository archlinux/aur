# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Boyan Ding <stu_dby@126.com>

pkgname=jdk8-dragonwell-extended

_majorver=8
_minorver=15
_updatever=16
_jdk_updatever=372
pkgver=${_majorver}.${_minorver}.${_updatever}
pkgrel=1
arch=('x86_64')
url="https://github.com/alibaba/dragonwell${_majorver}"
license=('GPL2')
makedepends=("java-environment=${_majorver}" 'ccache' 'cpio' 'unzip' 'zip' 'git' 'bash'
  'libxrender' 'libxtst' 'fontconfig' 'libcups' 'alsa-lib')
pkgdesc='An in-house OpenJDK implementation at Alibaba (Extended Edition)'
depends=('java-environment-common' "java-environment-openjdk=${_majorver}")
provides=("java-runtime=${_majorver}" "java-environment=${_majorver}" "java-environment-openjdk=${_majorver}")
conflicts=("${pkgname}-bin")
install="${pkgname}.install"
options=(!lto)
source=("${url}/archive/refs/tags/dragonwell-extended-${pkgver}_jdk${_majorver}u${_jdk_updatever}-ga.tar.gz"
  gcc11.patch)
b2sums=('70a5ccd3c6bb6eb66578723158b283793cadefe2a84e03e015acefb4c75ab7efeb0aab8612abe9010fc8d80b3c5618f0620060352b51cece433a730690924ab6'
  '9679e4dfb6027a87376081489c09810812d6849573afac4ea96abe3a3e00ca5b6af7d0ffb010c43b93cfa913f9e97fbb9f11e19fcc86a89b4548442671c32da1')

_jdkname='openjdk8'
_jvmdir="/usr/lib/jvm/java-${_majorver}-dragonwell-extended"
_prefix='jdk8u/image'
_imgdir="${_prefix}/jvm/openjdk-1.8.0_$(printf '%.2d' ${_minorver})"

prepare() {
  cd dragonwell${_majorver}-dragonwell-extended-${pkgver}_jdk${_majorver}u${_jdk_updatever}-ga

  # Fix build with C++17 (Fedora)
  patch -Np1 -i "${srcdir}"/gcc11.patch
}

build() {
  cd dragonwell${_majorver}-dragonwell-extended-${pkgver}_jdk${_majorver}u${_jdk_updatever}-ga

  unset JAVA_HOME
  # http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1346
  export MAKEFLAGS=${MAKEFLAGS/-j*/}

  # Avoid optimization of HotSpot being lowered from O3 to O2
  # -fno-exceptions for FS#73134
  export CFLAGS="${CFLAGS//-O2/-O3} -Wno-error=nonnull -Wno-error=deprecated-declarations -Wno-error=stringop-overflow= -Wno-error=return-type -Wno-error=cpp -fno-delete-null-pointer-checks -fcommon -fno-exceptions -Wno-error=format-overflow="
  export CXXFLAGS="${CXXFLAGS} -fcommon -fno-exceptions"

  install -d -m 755 "${srcdir}/${_prefix}/"
  bash configure \
    --prefix="${srcdir}/${_prefix}" \
    --with-update-version="${_minorver}" \
    --with-build-number="b${_updatever}" \
    --with-milestone="fcs" \
    --enable-unlimited-crypto \
    --with-zlib=system \
    --with-giflib=system \
    --with-extra-cflags="${CFLAGS}" \
    --with-extra-cxxflags="${CXXFLAGS}" \
    --with-extra-ldflags="${LDFLAGS}"

  # These help to debug builds: LOG=trace HOTSPOT_BUILD_JOBS=1
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

package() {
  cd ${_imgdir}

  # Main files
  install -d -m 755 "${pkgdir}${_jvmdir}"

  cp -a include lib jre "${pkgdir}${_jvmdir}"
  rm "${pkgdir}${_jvmdir}"/jre/{ASSEMBLY_EXCEPTION,LICENSE,THIRD_PARTY_README}

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
