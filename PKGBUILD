# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

pkgbase=gradle7
pkgname=('gradle7' 'gradle7-doc' 'gradle7-src')
pkgver=7.6.3
pkgrel=2
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('java-environment' 'bash' 'which' 'coreutils' 'findutils' 'sed')
makedepends=('git' 'asciidoc' 'xmlto' 'groovy' 'java-environment=11')
source=(https://services.gradle.org/distributions/${pkgbase%7}-${pkgver}-src.zip
        https://services.gradle.org/distributions/${pkgbase%7}-${pkgver}-all.zip
        ${pkgbase%7}.sh)
sha256sums=('5ba558d8001608f3285d16f2f972e95545d9593858e677498666b9aa7a1059e5'
            '6001aba9b2204d26fa25a5800bb9382cf3ee01ccb78fe77317b2872336eb2f80'
            '6f3472486278252417af49196847ba465b56819d286658fcdf918687f89ee032')
sha512sums=('cb2dc9bdebfceea9914720725af01f9a65144a699d86d525e6538019a38017238579624303a84d705f5b2f39141dd95152534470071e8653f5f2394fbae1e7b8'
            '9065cce289f89cb84bc5d48f06583db8487e92db054957d62504b2c3dcb92d93aacd662c659f13d98376e447de306399122df9afb6e73ff26380f9c9f527eeb3'
            'a50b6cf8281b56b80f55a20ac9316e1eed6887da1d191ad575dec140c9819711644d7077c4dc693b8cb0f1b08ceba0033ba88b5ad138d33ffb73b786c0d4bf81')

prepare() {
  cd ${pkgbase%7}-${pkgver}
  # remove ADOPTIUM contraint from all build related files
  sed -i '/JvmVendorSpec.ADOPTIUM/d' \
    build-logic/jvm/src/main/kotlin/gradlebuild.unittest-and-compile.gradle.kts \
    subprojects/docs/src/snippets/java/toolchain-filters/groovy/build.gradle \
    subprojects/docs/src/snippets/java/toolchain-filters/kotlin/build.gradle.kts \
    build-logic-commons/gradle-plugin/src/main/kotlin/common.kt

  # inhibit automatic download of binary gradle
  sed -i "s#distributionUrl=.*#distributionUrl=file\:${srcdir}/${pkgbase%7}-${pkgver}-all.zip#" \
    gradle/wrapper/gradle-wrapper.properties
}

build() {
  cd ${pkgbase%7}-${pkgver}
  # requires java language level 6, which >=13 has dropped
  export PATH="/usr/lib/jvm/java-11-openjdk/bin:${PATH}"
  ./gradlew installAll \
    -Porg.gradle.java.installations.auto-download=false \
    -PfinalRelease=true \
    -Pgradle_installPath="$(pwd)/dist" \
    --no-configuration-cache
}

package_gradle7() {
  cd ${pkgbase%7}-${pkgver}/dist
  provides=('gradle')
  conflicts=('gradle')
  optdepends=(
    'gradle7-doc: gradle documentation'
    'gradle7-src: gradle sources'
  )

  # install profile.d script
  install -Dm 755 "${srcdir}/${pkgbase%7}.sh" "${pkgdir}/etc/profile.d/${pkgbase%7}.sh"

  # create the necessary directory structure
  install -d "${pkgdir}/usr/share/java/${pkgname%7}/bin"
  install -d "${pkgdir}/usr/share/java/${pkgname%7}/lib/plugins"
  install -d "${pkgdir}/usr/share/java/${pkgname%7}/init.d"
  install -d "${pkgdir}/usr/bin"

  # copy across jar files
  install -Dm 644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname%7}/lib"
  install -Dm 644 lib/plugins/*.jar "${pkgdir}/usr/share/java/${pkgname%7}/lib/plugins"

  # copy across supporting text documentation and scripts
  install -m 644 NOTICE "${pkgdir}/usr/share/java/${pkgname%7}"
  install -m 755 bin/gradle "${pkgdir}/usr/share/java/${pkgname%7}/bin"
  install -m 644 init.d/*.* "${pkgdir}/usr/share/java/${pkgname%7}/init.d"

  # link gradle script to /usr/bin
  ln -s /usr/share/java/${pkgname%7}/bin/${pkgname%7} "${pkgdir}/usr/bin"
}

package_gradle7-doc() {
  pkgdesc+=' (documentation)'
  provides=('gradle-doc')
  conflicts=('gradle-doc')
  options=('!strip')

  cd ${pkgbase%7}-${pkgver}/dist
  install -d "${pkgdir}/usr/share/java/${pkgname%-*}/docs"
  cp -r docs/* "${pkgdir}/usr/share/java/${pkgname%-*}/docs"
}

package_gradle7-src() {
  pkgdesc+=' (sources)'
  provides=('gradle-src')
  conflicts=('gradle-src')
  options=('!strip')

  cd ${pkgbase%7}-${pkgver}/dist
  install -d "${pkgdir}/usr/share/java/${pkgname%-*}/src"
  cp -r src/* "${pkgdir}/usr/share/java/${pkgname%-*}/src"
}

# vim: ts=2 sw=2 et:
