# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

pkgbase=gradle7
pkgname=('gradle7' 'gradle7-doc' 'gradle7-src')
pkgver=7.6.4
pkgrel=1
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('java-environment' 'bash' 'which' 'coreutils' 'findutils' 'sed')
makedepends=('git' 'asciidoc' 'xmlto' 'groovy' 'java-environment=11')
source=(https://services.gradle.org/distributions/${pkgbase%7}-${pkgver}-src.zip
        https://services.gradle.org/distributions/${pkgbase%7}-${pkgver}-all.zip
        ${pkgbase%7}.sh)
sha256sums=('e8c0361bb14e27cced3ddb8335215b6cb19e5ea5debac4a667d7c33e4d514421'
            'fe696c020f241a5f69c30f763c5a7f38eec54b490db19cd2b0962dda420d7d12'
            '6f3472486278252417af49196847ba465b56819d286658fcdf918687f89ee032')
sha512sums=('2f4e77022c959141f187a05c7431ad596118baf379a991d25ecadc18a0f9a9832b195d5bcdb7b36d4ef9967c009fc95896eed4a5304e14e804ea5c03f1d2846e'
            'b23287647cfce49ff605cc58e06b19685e86176f37f15b2be64a529eaccf1b8277a71688c74f7ede3ad1d69edbb99f804c27b831b348bc2c52643e10ebe60d28'
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
