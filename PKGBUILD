# Maintainer: Vladimir Tsanev <tsachev@gmail.com>

pkgname=jtreg
# generate version executing on the tip (or latest working build)
#
#    hg log --limit=1 --template "{latesttag}.{node|short}" |sed -e "s/^jtreg//" |sed -e "s/-/+/"`
#
_version=4.2
_build=b13
_tag=${pkgname}${_version}-${_build}
#_commit=_tag
#pkgver=${_version}+${_build}
_commit=b6fabf6bf942
pkgver=${_version}+${_build}+${_commit}
pkgrel=1
pkgdesc="Regression Test Harness for the JDK"
arch=('any')
url="http://openjdk.java.net/jtreg/"
license=('GPL2')
groups=()
depends=('java-runtime>=8' 'jtharness' 'asmtools')
makedepends=('apache-ant' 'java-environment-openjdk=8' 'jcov' 'java-testng' 'jcommander' 'junit')
optdepends=()
checkdepends=()
provides=()
conflicts=()
install=
source=("http://hg.openjdk.java.net/code-tools/jtreg/archive/${_commit}.tar.gz" "${pkgname}.sh" "${pkgname}.patch")
sha256sums=('6f1ee9fd485f294caabda7c09c554cfa03e0296c2cfce744af25f7270aab0b8a'
            '49a4a58ff76e2e9989122d0aa0e5064f9797198789a851f21ed0b36484253c9f'
            '84a77930e1bfbd75c9643d78b0b5d60c38693fb9266409e37f50c42d40fecf29')

_jtregdir=${pkgname}-${_commit}

prepare() {
  cd $srcdir/${_jtregdir}
  patch -p1 -i ${srcdir}/${pkgname}.patch
}

build() {
  cd ${srcdir}/${_jtregdir}

  # build fails when extracting jquery from testng
  mkdir -p build/org/testng

  JDKHOME=/usr/lib/jvm/java-8-openjdk \
  JTHARNESS_HOME=/usr/share/jtharness \
  JCOV_HOME=/usr/share/jcov \
  ASMTOOLS_JAR=/usr/share/java/asmtools/asmtools.jar \
  ANTHOME=/usr/share/ant \
  JUNIT_JAR=/usr/share/java/junit.jar \
  TESTNG_JAR=/usr/share/java/testng/testng-6.14.3.jar \
  JCOMMANDER_JAR=/usr/share/java/jcommander/jcommander.jar \
  make -C make

}

check() {
  cd ${srcdir}/${_jtregdir}

  cp /usr/share/java/hamcrest-core.jar build/images/${pkgname}/lib
  # todo find a way to set use vnc and enable tests

  # JDKHOME=/usr/lib/jvm/java-8-openjdk \
  # JTHARNESS_HOME=/usr/share/jtharness \
  # JCOV_HOME=/usr/share/jcov \
  # ASMTOOLS_JAR=/usr/share/java/asmtools/asmtools.jar \
  # ANTHOME=/usr/share/ant \
  # JUNIT_JAR=/usr/share/java/junit.jar \
  # TESTNG_JAR=/usr/share/java/testng/testng-6.14.3.jar \
  # JCOMMANDER_JAR=/usr/share/java/jcommander/jcommander.jar \
  # HAMCREST_JAR=/usr/share/java/hamcrest-core.jar \
  # make -C make quick-test
}

package() {
  install -d -m755 ${pkgdir}/usr/share/java/${pkgname}
  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -d -m755 ${pkgdir}/usr/bin

  cp -a ${srcdir}/${_jtregdir}/build/images/${pkgname} ${pkgdir}/usr/share/${pkgname}
  mv ${pkgdir}/usr/share/${pkgname}/lib/${pkgname}.jar ${pkgdir}/usr/share/java/${pkgname}/
  rm -rf ${pkgdir}/usr/share/${pkgname}/lib/

  ln -sf /usr/share/java/${pkgname} ${pkgdir}/usr/share/${pkgname}/lib
  ln -sf /usr/share/java/jtharness/javatest.jar ${pkgdir}/usr/share/java/${pkgname}/javatest.jar
  ln -sf /usr/share/java/asmtools/asmtools.jar ${pkgdir}/usr/share/java/${pkgname}/asmtools.jar
  ln -sf /usr/share/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  ln -sf /usr/share/${pkgname}/bin/jtreg ${pkgdir}/usr/bin/jtreg
  ln -sf /usr/share/${pkgname}/bin/jtdiff ${pkgdir}/usr/bin/jtdiff

  # install profile.d script
  install -Dm 755 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh
}
