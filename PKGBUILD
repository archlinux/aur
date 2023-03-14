# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgbase=gradle
pkgbase=gradle7
pkgname=('gradle7' 'gradle7-doc' 'gradle7-src')
pkgver=7.6
pkgrel=1
pkgdesc='Powerful build system for the JVM (version 7)'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('java-environment' 'bash' 'which' 'coreutils' 'findutils' 'sed')
makedepends=('git' 'asciidoc' 'xmlto' 'groovy' 'java-environment=11')
source=("https://services.gradle.org/distributions/${_pkgbase}-${pkgver}-src.zip"
        "https://services.gradle.org/distributions/${_pkgbase}-${pkgver}-all.zip"
        ${pkgbase})
sha256sums=('68132f789c2af4c5e36f07d9ad4869ffa16ee58c5ce6eae4af33bb3f0b5fe635'
            '312eb12875e1747e05c2f81a4789902d7e4ec5defbd1eefeaccc08acf096505d'
            '141ea6cd0b9fda4a9259bd086c2e5d0f6731a0618789623db502394feb2ed867')
sha512sums=('6b3a86db2a9f590030773e059b2ab0840bc2334e99ddb23d2f85c7d6f0f17bce9d964b96b793f586c24e29186ce99a615a10009283bb14e2bfe59ddcc0d31c82'
            '5c5b9ade91898ec2fe142ff98dc7ae681a9f3b923ce40998a731cb84fdfcdbde6510cc9da026a9359526569e37472b06c1a6bc5a2794d2af5e9d6f1d13a21ac8'
            '99a07d5fe6ea3d0ba96834cd332504481e83a5e2888d4e54ba879d9d130f94f03c248eb63f1149c4abd8f02f9b33b6743b4f7fb4d6f90b9ec740bee6cebbcc6f')

_srcdir="${_pkgbase}-${pkgver}"

prepare() {
  cd "${_srcdir}"
  # remove ADOPTIUM contraint from all build related files
  sed -i '/JvmVendorSpec.ADOPTIUM/d' \
    build-logic/jvm/src/main/kotlin/gradlebuild.unittest-and-compile.gradle.kts \
    subprojects/docs/src/snippets/java/toolchain-filters/groovy/build.gradle \
    subprojects/docs/src/snippets/java/toolchain-filters/kotlin/build.gradle.kts \
    build-logic-commons/gradle-plugin/src/main/kotlin/common.kt

  # inhibit automatic download of binary gradle
  sed -i "s#distributionUrl=.*#distributionUrl=file\:${srcdir}/${_pkgbase}-${pkgver}-all.zip#" \
    gradle/wrapper/gradle-wrapper.properties
}

build() {
  cd "${_srcdir}"
  # requires java language level 6, which >=13 has dropped
  export PATH="/usr/lib/jvm/java-11-openjdk/bin:${PATH}"
  ./gradlew installAll \
    -Porg.gradle.java.installations.auto-download=false \
    -PfinalRelease=true \
    -Pgradle_installPath="$(pwd)/dist" \
    --no-configuration-cache
}

package_gradle7() {
  cd "${_srcdir}/dist"
  optdepends=(
    'gradle7-doc: gradle documentation'
    'gradle7-src: gradle sources'
  )

  # create the necessary directory structure
  install -d "${pkgdir}/usr/share/java/${pkgname}/bin"
  install -d "${pkgdir}/usr/share/java/${pkgname}/lib/plugins"
  install -d "${pkgdir}/usr/share/java/${pkgname}/init.d"
  install -d "${pkgdir}/usr/bin"

  # copy across jar files
  install -Dm 644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib"
  install -Dm 644 lib/plugins/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib/plugins"

  # copy across supporting text documentation and scripts
  install -m 644 NOTICE "${pkgdir}/usr/share/java/${pkgname}"
  install -m 755 bin/gradle "${pkgdir}/usr/share/java/${pkgname}/bin"
  install -m 644 init.d/*.* "${pkgdir}/usr/share/java/${pkgname}/init.d"

  # Install bootstrap script
  install -Dm755 "${srcdir}/gradle7" -t "${pkgdir}/usr/bin"
}

package_gradle7-doc() {
  pkgdesc+=' (documentation)'
  options=('!strip')

  cd "${_srcdir}/dist"
  install -d "${pkgdir}/usr/share/java/${pkgbase}/docs"
  cp -r docs/* "${pkgdir}/usr/share/java/${pkgbase}/docs"
}

package_gradle7-src() {
  pkgdesc+=' (sources)'
  options=('!strip')

  cd "${_srcdir}/dist"
  install -d "${pkgdir}/usr/share/java/${pkgbase}/src"
  cp -r src/* "${pkgdir}/usr/share/java/${pkgbase}/src"
}

# vim: ts=2 sw=2 et:
