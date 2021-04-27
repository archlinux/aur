# Maintainer: Arnaud Dovi <mr.dovi@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

pkgbase=gradle6
pkgname=('gradle6' 'gradle6-doc' 'gradle6-src')
pkgver=6.8.3
pkgrel=1
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('git' 'asciidoc' 'xmlto' 'kotlin' 'groovy' 'java-environment=11')
source=(https://services.gradle.org/distributions/${pkgbase/6/}-${pkgver}-src.zip
        ${pkgbase})
sha256sums=('e1faea761ad9cc74d56e1a11731eec4d6d2c2ea80d68dabb0eb0aed8ae8b79d4'
            'ce8519fbb899af7817a1959f02326c54647be83ddea0784ada34fc5de3acdb80')
sha512sums=('db00f4c8f33821ab3c8d50c9466c550bb20c795b4674b9f1826d21cb1ce33f0f1c199786630a79921ac452575ebf0a91e2d29cf50e18aa9f33ac0bc080617872'
            '2e2d8697dac7eae7d552b0e3a048d100093dd14199c716fe354bd1644ee3be4f90c3f88b1a89cfeb87c7ee8853f18aa09bedb5b0a5838e66ef3ca0fcfaf5b269')

build() {
  cd ${pkgbase/6/}-${pkgver}
  # requires java language level 6, which >=13 has dropped
  export PATH="/usr/lib/jvm/java-11-openjdk/bin:${PATH}"
  ./gradlew --parallel installAll \
    -PfinalRelease=true \
    -Pgradle_installPath="$(pwd)/dist"
}

package_gradle6() {
  cd ${pkgbase/6/}-${pkgver}/dist
  optdepends=(
    'gradle-doc: gradle documentation'
    'gradle-src: gradle sources'
  )

  # install profile.d script [DEPRECATED: gradle6 sets GRADLE_HOME in a wrapper script to have gradle6 installable and compatible with the latest gradle version]
  #install -Dm 755 "${srcdir}/${pkgbase}.sh" "${pkgdir}/etc/profile.d/${pkgbase}.sh"

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

  # gradle6: install the launcher script responsible of setting up GRADLE_HOME
  install -Dm 755 "${srcdir}/${pkgbase}" "${pkgdir}/usr/share/java/${pkgname}/bin"

  # link gradle script to /usr/bin
  ln -s /usr/share/java/${pkgname}/bin/${pkgbase} "${pkgdir}/usr/bin/${pkgbase}"
}

package_gradle6-doc() {
  pkgdesc+=' (documentation)'
  options=('!strip')

  cd ${pkgbase/6/}-${pkgver}/dist
  install -d "${pkgdir}/usr/share/java/${pkgbase/6/}/docs"
  cp -r docs/* "${pkgdir}/usr/share/java/${pkgbase/6/}/docs"
}

package_gradle6-src() {
  pkgdesc+=' (sources)'
  options=('!strip')

  cd ${pkgbase/6/}-${pkgver}/dist
  install -d "${pkgdir}/usr/share/java/${pkgbase/6/}/src"
  cp -r src/* "${pkgdir}/usr/share/java/${pkgbase/6/}/src"
}

# vim: ts=2 sw=2 et:
