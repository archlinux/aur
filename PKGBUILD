# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

_pkgbase=gradle
pkgbase=gradle8
pkgname=('gradle8' 'gradle8-doc' 'gradle8-src')
pkgver=8.14.6
pkgrel=1
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=(
  'bash'
  'coreutils'
  'findutils'
  'sed'
  'which'
)
makedepends=(
  'asciidoc'
  'git'
  'groovy'
  'java-environment=11'
  'java-environment=17'
  'java-environment=21'
  'xmlto'
)
source=("https://services.gradle.org/distributions/${_pkgbase}-${pkgver}-src.zip"
        "https://services.gradle.org/distributions/${_pkgbase}-${pkgver}-all.zip"
        "${_pkgbase}.sh")
sha256sums=('8b375d58aa5e2919a4277b049933e5ceab2be2b61832016f290482bccb8d5cdd'
            '24fc39aedd1b68c3de8e4d46a0277c9b42d9ccdb172231a634fad54a3693e50a'
            '1cdf7f30f91a8f81d5608ce2d005ce1105ecae19626db72a56a7b5f426e5609d')
sha512sums=('9270e90115cb7e60f2ce94e4ec2579ab92d3a582455c1186f6aa0eed8c55ae35a9b332824ad831fb4aa16a82d75720958c0ae40d54b8cfae3de397885bef196f'
            'c68fd79cf97b8617eaabff3440ec13f84dc4fea3e83d029017bf4365ae5f535e40dc2c92380208ea140503ea29692895c3461a175cdd43cfbc6b2fac377a47b7'
            '597f72a376e9b582da6ac012acf3d681d21da1a0a3124c70639558737e7adbd937a260bdc5c2a215dfe32493b974fd9096b79710a1e185745f65a700e00091ef')

_srcdir="${_pkgbase}-${pkgver}"
_java_home='/usr/lib/jvm/java-21-openjdk'

prepare() {
  cd ${_srcdir}
  # remove adoptium references because we want to use our java implementation
  grep -lr "vendor = JvmVendorSpec.ADOPTIUM" | xargs sed -i "/JvmVendorSpec.ADOPTIUM/d"

  # inhibit automatic download of binary gradle
  sed -i "s#distributionUrl=.*#distributionUrl=file\:${srcdir}/${_pkgbase}-${pkgver}-all.zip#" \
    gradle/wrapper/gradle-wrapper.properties
}

build() {
  cd ${_srcdir}
  export PATH="$_java_home/bin:$PATH"
  export JAVA_HOME="$_java_home"
  ./gradlew installAll \
    --info \
    -Porg.gradle.java.installations.paths="$_java_home" \
    -Porg.gradle.java.installations.auto-download=false \
    -PfinalRelease=true \
    -Pgradle_installPath="$(pwd)/dist" \
    --no-configuration-cache
}

package_gradle8() {
  cd ${_srcdir}/dist
  depends+=('java-environment>=21')
  optdepends=(
    'gradle8-doc: gradle8 documentation'
    'gradle8-src: gradle8 sources'
  )

  # install profile.d script
  install -Dm 644 "${srcdir}"/${_pkgbase}.sh "${pkgdir}"/etc/profile.d/${pkgbase}.sh

  # create the necessary directory structure
  install -d "${pkgdir}"/usr/share/java/${pkgname}/bin
  install -d "${pkgdir}"/usr/share/java/${pkgname}/lib/{plugins,agents}
  install -d "${pkgdir}"/usr/share/java/${pkgname}/init.d
  install -d "${pkgdir}"/usr/bin

  # copy across jar files
  install -Dm 644 lib/*.jar "${pkgdir}"/usr/share/java/${pkgname}/lib
  install -Dm 644 lib/plugins/*.jar "${pkgdir}"/usr/share/java/${pkgname}/lib/plugins
  install -Dm 644 lib/agents/*.jar "${pkgdir}"/usr/share/java/${pkgname}/lib/agents

  # copy across supporting text documentation and scripts
  install -m 644 NOTICE "${pkgdir}"/usr/share/java/${pkgname}
  install -m 755 bin/gradle "${pkgdir}"/usr/share/java/${pkgname}/bin
  install -m 644 init.d/*.* "${pkgdir}"/usr/share/java/${pkgname}/init.d

  # link gradle script to /usr/bin
  ln -s /usr/share/java/${pkgname}/bin/${_pkgbase} "${pkgdir}"/usr/bin/${pkgname}
}

package_gradle8-doc() {
  pkgdesc+=' (documentation)'
  options=('!strip')

  cd ${_srcdir}/dist
  install -d "${pkgdir}"/usr/share/java/gradle/docs
  cp -r docs/* "${pkgdir}"/usr/share/java/gradle/docs
}

package_gradle8-src() {
  pkgdesc+=' (sources)'
  options=('!strip')

  cd ${_srcdir}/dist
  install -d "${pkgdir}"/usr/share/java/gradle/src
  cp -r src/* "${pkgdir}"/usr/share/java/gradle/src
}

# vim: ts=2 sw=2 et:
