# Maintainer: Dominic Meiser dosm dot mail at gmail dot com

# from the official repos:
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

pkgbase=gradle4
pkgname=('gradle4' 'gradle4-doc' 'gradle4-src')
pkgver=4.10.3
pkgrel=3
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('java-environment' 'bash')
source=(https://services.gradle.org/distributions/gradle-${pkgver}-all.zip
        gradle.sh)
sha512sums=('a688267399a1632d86e8c3d28e34ea58992bba64968f4d01b6c3e4ea63081167c556806b1e2718e6858a8d402c941fcdcbe761f3622fa2f74bd53dedffa620ff'
            '4b9cdccfd32602eebf145f9002b67abd29d979bb17cf5cbb802843c73492791d195d8aa659917ac2cf6593fc5fd31a2c3b6347f6a4b8626d1e60260f848f4f18')

package_gradle4() {
  install="gradle4.install"
  
  cd gradle-${pkgver}

  # install profile.d script
  install -Dm 755 "${srcdir}/gradle.sh" "${pkgdir}/etc/profile.d/$pkgbase.sh"

  # create the necessary directory structure
  install -d "${pkgdir}/usr/share/java/$pkgbase/bin"
  install -d "${pkgdir}/usr/share/java/$pkgbase/lib/plugins"
  install -d "${pkgdir}/usr/share/java/$pkgbase/init.d"
  install -d "${pkgdir}/usr/bin"

  # copy across jar files
  install -Dm 644 lib/*.jar "${pkgdir}/usr/share/java/$pkgbase/lib"
  install -Dm 644 lib/plugins/*.jar "${pkgdir}/usr/share/java/$pkgbase/lib/plugins"

  # copy across supporting text documentation and scripts
  install -m 644 NOTICE "${pkgdir}/usr/share/java/$pkgbase"
  install -m 644 LICENSE "${pkgdir}/usr/share/java/$pkgbase"
  install -m 644 *.html "${pkgdir}/usr/share/java/$pkgbase"
  install -m 755 bin/gradle "${pkgdir}/usr/share/java/$pkgbase/bin"
  install -m 644 init.d/*.* "${pkgdir}/usr/share/java/$pkgbase/init.d"

  # link gradle script to /usr/bin
  ln -s "/usr/share/java/$pkgbase/bin/gradle" "${pkgdir}/usr/bin/$pkgbase"
}

package_gradle4-doc() {
  pkgdesc='Powerful build system for the JVM (documentation and samples)'
  options=('!strip')
  optdepends=('gradle4')

  cd gradle-${pkgver}

  # create the necessary directory structure
  install -d "${pkgdir}/usr/share/java/$pkgbase/docs"
  install -d "${pkgdir}/usr/share/java/$pkgbase/samples"

  # copy across documentation and samples
  cp -r docs/* "${pkgdir}/usr/share/java/$pkgbase/docs"
  cp -r samples/* "${pkgdir}/usr/share/java/$pkgbase/samples"
}

package_gradle4-src() {
  pkgdesc='Powerful build system for the JVM (sources)'
  options=('!strip')
  optdepends=('gradle4')

  cd gradle-${pkgver}
  install -d "${pkgdir}/usr/share/java/$pkgbase/src"
  cp -r src/* "${pkgdir}/usr/share/java/$pkgbase/src"
}

# vim: ts=2 sw=2 et:
