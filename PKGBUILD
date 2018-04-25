# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=jtreg-hg
pkgver=r429+.7b1496d2790e+
pkgrel=1
pkgdesc="Regression Test Harness for the JDK"
arch=('any')
url="http://openjdk.java.net/jtreg/"
license=('GPL2')
groups=()
depends=('java-runtime>=7' 'jtharness' 'asmtools')
makedepends=('mercurial' 'apache-ant' 'java-environment-openjdk=7' 'jcov' 'java-testng' 'jcommander' 'junit')
optdepends=('jcov')
checkdepends=()
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
install=
source=('jtreg::hg+http://hg.openjdk.java.net/code-tools/jtreg' "${pkgname%-hg}.sh" "${pkgname%-hg}.patch")
noextract=()
sha256sums=('SKIP'
 '49a4a58ff76e2e9989122d0aa0e5064f9797198789a851f21ed0b36484253c9f'
 '147b5d2169926b83d9b53ced862240821a242377293868de18675f692d7fbc46')

pkgver() {
  cd "$srcdir/${pkgname%-hg}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/${pkgname%-hg}"
  patch -p1 -i "$srcdir/${pkgname%-hg}.patch"
}

build() {
  cd "$srcdir/${pkgname%-hg}"

  # build fails when extracting jquery from testng
  mkdir -p build/org/testng

  JDKHOME=/usr/lib/jvm/java-7-openjdk \
  JTHARNESS_HOME=/usr/share/jtharness \
  JCOV_HOME=/usr/share/jcov \
  ASMTOOLS_JAR=/usr/share/java/asmtools/asmtools.jar \
  ANTHOME=/usr/share/apache-ant \
  JUNIT_JAR=/usr/share/java/junit.jar \
  TESTNG_JAR=/usr/share/java/testng/testng-6.14.3.jar \
  JCOMMANDER_JAR=/usr/share/java/jcommander/jcommander.jar \
  make -C make

}

check() {
  cd "$srcdir/${pkgname%-hg}"

  cp /usr/share/java/hamcrest-core.jar build/images/${pkgname%-hg}/lib
  # todo find a way to set use vnc and enable tests

  # JDKHOME=/usr/lib/jvm/java-7-openjdk \
  # JTHARNESS_HOME=/usr/share/jtharness \
  # JCOV_HOME=/usr/share/jcov \
  # ASMTOOLS_JAR=/usr/share/java/asmtools/asmtools.jar \
  # ANTHOME=/usr/share/apache-ant \
  # JUNIT_JAR=/usr/share/java/junit.jar \
  # TESTNG_JAR=/usr/share/java/testng/testng-6.14.3.jar \
  # JCOMMANDER_JAR=/usr/share/java/jcommander/jcommander.jar \
  # HAMCREST_JAR=/usr/share/java/hamcrest-core.jar \
  # make -C make quick-test
}

package() {
  install -d -m755 ${pkgdir}/usr/share/java/${pkgname%-hg}
  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -d -m755 ${pkgdir}/usr/bin

  cp -a ${srcdir}/${pkgname%-hg}/build/images/${pkgname%-hg} ${pkgdir}/usr/share/${pkgname%-hg}
  mv ${pkgdir}/usr/share/${pkgname%-hg}/lib/${pkgname%-hg}.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/
  rm -rf ${pkgdir}/usr/share/${pkgname%-hg}/lib/

  ln -sf /usr/share/java/${pkgname%-hg} ${pkgdir}/usr/share/${pkgname%-hg}/lib
  ln -sf /usr/share/java/jtharness/javatest.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/javatest.jar
  ln -sf /usr/share/java/asmtools/asmtools.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/asmtools.jar
  ln -sf /usr/share/${pkgname%-hg}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  ln -sf /usr/share/${pkgname%-hg}/bin/jtreg ${pkgdir}/usr/bin/jtreg
  ln -sf /usr/share/${pkgname%-hg}/bin/jtdiff ${pkgdir}/usr/bin/jtdiff

  # install profile.d script
  install -Dm 755 "${srcdir}/${pkgname%-hg}.sh" "${pkgdir}/etc/profile.d/${pkgname%-hg}.sh"
}

# vim:set ts=2 sw=2 et:
