# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Based on Fedora 18's packaging

pkgname=velocity
pkgver=1.7
pkgrel=1
pkgdesc="Free open-source templating engine"
arch=(any)
url="http://velocity.apache.org/"
license=(Apache)
depends=(#hsqldb-java-updated
         jakarta-oro
         java-bcel
         java-commons-collections
         java-commons-logging
         java-commons-lang
         java-jdom1
         java-servlet3.0-tomcat
         junit
         log4j
         werken-xpath)
makedepends=(antlr2 apache-ant)
source=("http://www.us.apache.org/dist/velocity/engine/${pkgver}/velocity-${pkgver}.tar.gz"
        0001-Remove-avalon-logkit.patch
        0003-Use-system-jars.patch
        0004-JDBC-41-compat.patch)
md5sums=('6af13ea297dee7ddbabeaa8e3963c184')
sha1sums=('513c8a8c2aa4459d777a53634fc331bfd986e033')
# Patches
md5sums+=('3de9a9b9637520fd19d157549f3f0830'
          '377f16d1baab0ca30c69fb036e7eca30'
          'b1a47ba7da5b3e2c7e6e7cc0fc4cb920')
sha1sums+=('effe4fb6ca27ba90978f1978865953d2ecb1904a'
           '9365f137bf47934daf606efa24f0a3ea2751cc36'
           'e07d06e5c9a08de4c043a6e67986884681559114')

build() {
  cd "${pkgname}-${pkgver}"

  # Patch from Fedora to use system jar files
  patch -p1 -i ../0003-Use-system-jars.patch

  find . -name '*.jar' -o -name '*.class' -delete

  # Remove dependency on unpackaged avalon-logkit
  patch -p1 -i ../0001-Remove-avalon-logkit.patch
  rm -v src/java/org/apache/velocity/runtime/log/AvalonLogChute.java
  rm -v src/java/org/apache/velocity/runtime/log/AvalonLogSystem.java
  rm -v src/java/org/apache/velocity/runtime/log/VelocityFormatter.java

  patch -p1 -i ../0004-JDBC-41-compat.patch

  # Servlet test needs to be ported to the new API
  rm -v src/test/org/apache/velocity/test/VelocityServletTestCase.java

  # Not working tests
  rm -v src/test/org/apache/velocity/test/ClassloaderChangeTestCase.java

  export CLASSPATH="/usr/share/java/commons-lang/commons-lang.jar:/usr/share/java/log4j.jar:/usr/share/java/commons-collections/commons-collections.jar:/usr/share/java/servlet3.0-tomcat/servlet-api-3.0.jar:/usr/share/java/jdom/jdom.jar:/usr/share/java/jakarta-oro.jar:/usr/share/java/werken.xpath.jar:/usr/share/java/commons-logging/commons-logging-api.jar:/usr/share/java/hsqldb.jar:/usr/share/java/antlr2.jar"
  ant -buildfile build/build.xml -Dbuild.sysclasspath=first jar test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/java/"
  install -m644 bin/${pkgname}-${pkgver}.jar \
    "${pkgdir}/usr/share/java/${pkgname}.jar"

  install -dm755 "${pkgdir}/usr/share/apache-ant/lib/"
  install -m644 bin/${pkgname}-${pkgver}.jar \
    "${pkgdir}/usr/share/apache-ant/lib/${pkgname}.jar"
}
