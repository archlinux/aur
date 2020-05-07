# Maintainer: Jah Way <jahway603 at protonmail dot com>

# from the official repos:
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

pkgbase=gradle5
pkgname=('gradle5' 'gradle5-doc' 'gradle5-src')
pkgver=5.6.4
pkgrel=2
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('git' 'asciidoc' 'xmlto' 'kotlin' 'groovy' 'java-environment=11')
source=(https://services.gradle.org/distributions/gradle-${pkgver}-src.zip
        ${pkgbase}.sh)
sha256sums=('0ea3f172357a65a02f2fea03460f80b8b37040276d4e471a60fb739d41c7ede2'
            '5e6512419510e0244ef64c6f0af2b508ca9f1eb55f78c5a5c3e14ad37bd9ad9b')

build() {
  cd gradle-${pkgver}
  # supports upto JDK 11, but not JDK 13
  export PATH="/usr/lib/jvm/java-11-openjdk/bin:${PATH}"
  ./gradlew installAll \
    -PfinalRelease=true \
    -Pgradle_installPath="$(pwd)/dist"
}

package_gradle5() {
  install="${pkgbase}.install"

  cd gradle-${pkgver}/dist

  # install profile.d script
  install -Dm 755 "${srcdir}/${pkgbase}.sh" "${pkgdir}/etc/profile.d/${pkgbase}.sh"

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
  install -m 644 *.html "${pkgdir}/usr/share/java/${pkgname}"
  mv bin/gradle bin/${pkgbase}
  install -m 755 bin/${pkgbase} "${pkgdir}/usr/share/java/${pkgname}/bin"
  install -m 644 init.d/*.* "${pkgdir}/usr/share/java/${pkgname}/init.d"

  # link gradle script to /usr/bin
  ln -s /usr/share/java/${pkgname}/bin/${pkgbase} "${pkgdir}/usr/bin"
}

package_gradle5-doc() {
  pkgdesc='Powerful build system for the JVM (documentation and samples)'
  options=('!strip')
  optdepends=('gradle5')

  cd gradle-${pkgver}/dist

  # copy across documentation 
  install -d "${pkgdir}/usr/share/java/${pkgbase}/docs"
  cp -r docs/* "${pkgdir}/usr/share/java/${pkgbase}/docs"
  
  # copy across samples
  install -d "${pkgdir}/usr/share/java/${pkgbase}/samples"
  cp -r samples/* "${pkgdir}/usr/share/java/${pkgbase}/samples"
}

package_gradle5-src() {
  pkgdesc='Powerful build system for the JVM (sources)'
  options=('!strip')
  optdepends=('gradle5')

  cd gradle-${pkgver}/dist
  install -d "${pkgdir}/usr/share/java/${pkgbase}/src"
  cp -r src/* "${pkgdir}/usr/share/java/${pkgbase}/src"
}

# vim: ts=2 sw=2 et:
