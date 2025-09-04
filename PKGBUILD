# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

_pkgbase=gradle
pkgbase=gradle8
pkgname=('gradle8' 'gradle8-doc' 'gradle8-src')
pkgver=8.14.3
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
sha256sums=('483b6cfbbd0727ed3f141a76b9d1de5f7fbd548dc631360f7182bf1a9caf6ea9'
            'ed1a8d686605fd7c23bdf62c7fc7add1c5b23b2bbc3721e661934ef4a4911d7c'
            '1cdf7f30f91a8f81d5608ce2d005ce1105ecae19626db72a56a7b5f426e5609d')
sha512sums=('a85ea6714e60e78344b412756903800f772d3fcf1767e7d7566a77b5036bee76593c365d8ed3f1cb78fa1d08bdaa9f0cb57f5ac4ff39f08e94ba18152de5a47f'
            '3c7a4acaf8382334ea39d55eda737c4399cf02890d02c14718730e401f930ae679b49f88d2a16c1455de58e7f8f396f49207d07cc33e109f40af103c0bc48758'
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
