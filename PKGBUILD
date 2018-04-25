# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=jcov-hg
pkgver=r37.0b9e41807b07
pkgrel=2
pkgdesc="The JCov open source project is used to gather quality metrics associated with the production of test suites."
arch=('any')
url="https://wiki.openjdk.java.net/display/CodeTools/jcov"
license=('GPL2')
groups=()
depends=('java-runtime>=7')
makedepends=('mercurial' 'apache-ant' 'java-environment-openjdk=7' 'java-asm' 'jtharness')
optdepends=('jtharness')
checkdepends=()
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
install=
source=('jcov::hg+http://hg.openjdk.java.net/code-tools/jcov')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-hg}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/${pkgname%-hg}"
  ln -sf /usr/share/java/asm/asm.jar build/asm-6.0.jar
  ln -sf /usr/share/java/asm/asm-tree.jar build/asm-tree-6.0.jar
  ln -sf /usr/share/java/asm/asm-util.jar build/asm-util-6.0.jar
  ln -sf /usr/share/java/jtharness/javatest.jar build/javatest.jar
  JAVA_HOME=/usr/lib/jvm/java-7-openjdk ant -f build/build.xml clean
  JAVA_HOME=/usr/lib/jvm/java-7-openjdk ant -f plugins/coberturaXML/build/build.xml clean
}

build() {
  cd "$srcdir/${pkgname%-hg}/build"
  JAVA_HOME=/usr/lib/jvm/java-7-openjdk ant 
  cd "$srcdir/${pkgname%-hg}/plugins/coberturaXML"
  JAVA_HOME=/usr/lib/jvm/java-7-openjdk ant -f build/build.xml
}

package() {
  cd $srcdir/${pkgname%-hg}
  install -D -m 644 JCOV_BUILD/jcov_3.0/jcov.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/jcov.jar
  install -D -m 644 JCOV_BUILD/jcov_3.0/jtobserver.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/jtobserver.jar
  install -D -m 644 JCOV_BUILD/jcov_3.0/jcov_file_saver.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/jcov_file_saver.jar
  install -D -m 644 JCOV_BUILD/jcov_3.0/jcov_network_saver.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/jcov_network_saver.jar
  install -D -m 644 plugins/coberturaXML/plugin/dist/coberturaXML.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/coberturaXML.jar
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/${pkgname%-hg}
  ln -sf /usr/share/java/${pkgname%-hg}         ${pkgdir}/usr/share/${pkgname%-hg}/lib
  ln -sf /usr/share/licenses/${pkgname}/LICENSE ${pkgdir}/usr/share/${pkgname%-hg}/LICENSE
}

# vim:set ts=2 sw=2 et:
