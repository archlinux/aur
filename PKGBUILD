# Maintainer: Dominic Meiser dosm dot mail at gmail dot com

# from the official repos:
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

pkgbase=gradle4
pkgname=('gradle4' 'gradle4-doc' 'gradle4-src')
pkgver=4.10.2
pkgrel=1
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('java-environment' 'bash')
source=(https://services.gradle.org/distributions/gradle-${pkgver}-all.zip
        gradle.sh)
sha512sums=('71eaaa86af045f3162e9602c5c25c449aafd17f73f958dc991babfe4ebf94772fe9f53a49342dcd50e29ea338486115cb8215b1732944d49ced508d9f9ac7d81'
            'f38e9b26e22948366acf6580d6f38e2c88c3791c425b24922368fe1bc78c744fa516a03ffdbef02e3755859da620a6259997d4b4e5f97e3dc8cb49b74a694616')

package_gradle4() {
  conflicts=('gradle')
  provides=('gradle')

  cd gradle-${pkgver}

  # install profile.d script
  install -Dm 755 "${srcdir}/gradle.sh" "${pkgdir}/etc/profile.d/gradle.sh"

  # create the necessary directory structure
  install -d "${pkgdir}/usr/share/java/gradle/bin"
  install -d "${pkgdir}/usr/share/java/gradle/lib/plugins"
  install -d "${pkgdir}/usr/share/java/gradle/init.d"
  install -d "${pkgdir}/usr/bin"

  # copy across jar files
  install -Dm 644 lib/*.jar "${pkgdir}/usr/share/java/gradle/lib"
  install -Dm 644 lib/plugins/*.jar "${pkgdir}/usr/share/java/gradle/lib/plugins"

  # copy across supporting text documentation and scripts
  install -m 644 NOTICE "${pkgdir}/usr/share/java/gradle"
  install -m 644 LICENSE "${pkgdir}/usr/share/java/gradle"
  install -m 644 *.html "${pkgdir}/usr/share/java/gradle"
  install -m 755 bin/gradle "${pkgdir}/usr/share/java/gradle/bin"
  install -m 644 init.d/*.* "${pkgdir}/usr/share/java/gradle/init.d"

  # link gradle script to /usr/bin
  ln -s /usr/share/java/gradle/bin/gradle "${pkgdir}/usr/bin"
}

package_gradle4-doc() {
  pkgdesc='Powerful build system for the JVM (documentation and samples)'
  options=('!strip')
  optdepends=('gradle4')
  conflicts=('gradle-doc')
  provides=('gradle-doc')

  cd gradle-${pkgver}

  # create the necessary directory structure
  install -d "${pkgdir}/usr/share/java/gradle/docs"
  install -d "${pkgdir}/usr/share/java/gradle/samples"

  # copy across documentation and samples
  cp -r docs/* "${pkgdir}/usr/share/java/gradle/docs"
  cp -r samples/* "${pkgdir}/usr/share/java/gradle/samples"
}

package_gradle4-src() {
  pkgdesc='Powerful build system for the JVM (sources)'
  options=('!strip')
  optdepends=('gradle4')
  conflicts=('gradle-src')
  provides=('gradle-src')

  cd gradle-${pkgver}
  install -d "${pkgdir}/usr/share/java/gradle/src"
  cp -r src/* "${pkgdir}/usr/share/java/gradle/src"
}

# vim: ts=2 sw=2 et:
