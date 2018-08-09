# Maintainer: mrAppleXZ <mr.applexz@gmail.com>

_pkgbase=gradle
pkgbase=gradle-rc
pkgname=('gradle-rc' 'gradle-rc-doc' 'gradle-rc-src')
_pkgver=4.10-rc-1
pkgver=4.10rc1
pkgrel=1
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('java-environment' 'bash')
source=(https://services.gradle.org/distributions/${_pkgbase}-${_pkgver}-all.zip
        ${_pkgbase}.sh)
sha512sums=('fc29709163d027fc89e32069c42374fd86baa45c7e7f235164aefa5904b773d9a735ae78075dd3adae3990892cf39c387b51790bbad9a48f883bb30be4d535c8'
            '7472693a896bb008a112459c42b303680b7ef64117e3beea760b5b7ca3822328dbdd5fc69c4d3dbe54b272663283549012dc0f3d34aa07cc3bafbf628d22d081')

package_gradle-rc() {
  conflicts=('gradle')
  provides=('gradle')
  _pkgname=gradle
  cd ${_pkgbase}-${_pkgver}

  # install profile.d script
  install -Dm 755 "${srcdir}/${_pkgbase}.sh" "${pkgdir}/etc/profile.d/${_pkgbase}.sh"

  # create the necessary directory structure
  install -d "${pkgdir}/usr/share/java/${_pkgname}/bin"
  install -d "${pkgdir}/usr/share/java/${_pkgname}/lib/plugins"
  install -d "${pkgdir}/usr/share/java/${_pkgname}/init.d"
  install -d "${pkgdir}/usr/bin"

  # copy across jar files
  install -Dm 644 lib/*.jar "${pkgdir}/usr/share/java/${_pkgname}/lib"
  install -Dm 644 lib/plugins/*.jar "${pkgdir}/usr/share/java/${_pkgname}/lib/plugins"

  # copy across supporting text documentation and scripts
  install -m 644 NOTICE "${pkgdir}/usr/share/java/${_pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/java/${_pkgname}"
  install -m 644 *.html "${pkgdir}/usr/share/java/${_pkgname}"
  install -m 755 bin/gradle "${pkgdir}/usr/share/java/${_pkgname}/bin"
  install -m 644 init.d/*.* "${pkgdir}/usr/share/java/${_pkgname}/init.d"

  # link gradle script to /usr/bin
  ln -s /usr/share/java/${_pkgname}/bin/${_pkgname} "${pkgdir}/usr/bin"
}

package_gradle-rc-doc() {
  conflicts=('gradle-doc')
  provides=('gradle-doc')
  _pkgname=gradle-doc
  pkgdesc='Powerful build system for the JVM (documentation and samples)'
  options=('!strip')
  optdepends=('gradle-rc')

  cd ${_pkgbase}-${_pkgver}

  # create the necessary directory structure
  install -d "${pkgdir}/usr/share/java/gradle/docs"
  install -d "${pkgdir}/usr/share/java/gradle/samples"

  # copy across documentation and samples
  cp -r docs/* "${pkgdir}/usr/share/java/gradle/docs"
  cp -r samples/* "${pkgdir}/usr/share/java/gradle/samples"
}

package_gradle-rc-src() {
  conflicts=('gradle-src')
  provides=('gradle-src')
  _pkgname=gradle-src
  pkgdesc='Powerful build system for the JVM (sources)'
  options=('!strip')
  optdepends=('gradle-rc')

  cd ${_pkgbase}-${_pkgver}
  install -d "${pkgdir}/usr/share/java/gradle/src"
  cp -r src/* "${pkgdir}/usr/share/java/gradle/src"
}

# vim: ts=2 sw=2 et:
