# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

pkgbase=gradle14
_pkgbase=gradle
pkgname=('gradle14' 'gradle14-doc' 'gradle14-src')
pkgver=1.4
pkgrel=1
pkgdesc='Powerful build system for the JVM. Legacy version'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('java-environment' 'bash') 
source=(https://services.gradle.org/distributions/${_pkgbase}-${pkgver}-all.zip
        ${pkgbase}.sh)
sha512sums=('29f4c0cd0645dc67a2864c172e8e278b402f5d342ae2c34d5bd9d0fab87b1ed60725d77ef02530186e58d5ad82518724f19a688ac30ce27fedb7097aae4b3c28'
            '03b0b5a687db924d8b059dee2ca4d6af22a6168782476c0a435b366c593eb727364040b67aaf4218f7dfb147e8022364fd2d90b86a9a7907aa99699202b2eb93')


package_gradle14() {
  cd ${_pkgbase}-${pkgver}

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
  install -m 644 NOTICE "${pkgdir}/usr/share/java/${pkgbase}"
  install -m 644 LICENSE "${pkgdir}/usr/share/java/${pkgbase}"
  install -m 644 *.txt "${pkgdir}/usr/share/java/${pkgbase}"
  install -m 644 *.html "${pkgdir}/usr/share/java/${pkgbase}"
  install -m 755 bin/gradle "${pkgdir}/usr/share/java/${pkgbase}/bin"
  install -m 644 init.d/*.* "${pkgdir}/usr/share/java/${pkgbase}/init.d"

  # link gradle script to /usr/bin
  ln -s /usr/share/java/${pkgbase}/bin/${_pkgbase} "${pkgdir}/usr/bin/${pkgbase}"
}

package_gradle14-doc() {
  pkgdesc='Powerful build system for the JVM (documentation and samples)'
  options=('!strip')
  optdepends=('gradle14')

  cd ${_pkgbase}-${pkgver}

  # create the necessary directory structure
  install -d "${pkgdir}/usr/share/java/{pkgbase}/docs"
  install -d "${pkgdir}/usr/share/java/{pkgbase}/samples"

  # copy across documentation and samples
  cp -r docs/* "${pkgdir}/usr/share/java/{pkgbase}/docs"
  cp -r samples/* "${pkgdir}/usr/share/java/{pkgbase}/samples"
}

package_gradle14-src() {
  pkgdesc='Powerful build system for the JVM (sources)'
  options=('!strip')
  optdepends=('gradle14')

  cd ${_pkgbase}-${pkgver}
  install -d "${pkgdir}/usr/share/java/{pkgbase}/src"
  cp -r src/* "${pkgdir}/usr/share/java/{pkgbase}/src"
}

# vim: ts=2 sw=2 et:
