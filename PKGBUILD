# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>
pkgname=('gradle' 'gradle-doc' 'gradle-src')
pkgbase=gradle
pkgver=2.6
pkgrel=1
pkgdesc=('A powerful build system for the JVM')
arch=('any')
url='https://gradle.org/'
license=('APACHE')
depends=('java-environment')
makedepends=('zip')
source=("https://services.gradle.org/distributions/${pkgbase}-${pkgver}-all.zip"
        "${pkgbase}.sh")

package_gradle(){
  # install profile.d script
  install -dm755 "${pkgdir}"/etc/profile.d
  install -m755 "${srcdir}/${pkgbase}.sh" "${pkgdir}/etc/profile.d/"
  cd "${srcdir}/${pkgname}-${pkgver}"

  # create the necessary directory structure
  mkdir -p "${pkgdir}/usr/share/java/${pkgname}/bin"
  mkdir -p "${pkgdir}/usr/share/java/${pkgname}/lib/plugins"
  mkdir -p "${pkgdir}/usr/share/java/${pkgname}/init.d"
  mkdir -p "${pkgdir}/usr/bin"

  # copy across jar files
  install -Dm644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib" || return 1
  install -Dm644 lib/plugins/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib/plugins" || return 1

  # copy across supporting text documentation and scripts
  install -m644 NOTICE "${pkgdir}/usr/share/java/${pkgname}" || return 1
  install -m644 LICENSE "${pkgdir}/usr/share/java/${pkgname}" || return 1
  install -m644 *.txt "${pkgdir}/usr/share/java/${pkgname}" || return 1
  install -m644 *.html "${pkgdir}/usr/share/java/${pkgname}" || return 1
  install -m755 bin/gradle "${pkgdir}/usr/share/java/${pkgname}/bin" || return 1
  install -m644 init.d/*.* "${pkgdir}/usr/share/java/${pkgname}/init.d" || return 1

  # link gradle script to /usr/bin
  ln -s /usr/share/java/${pkgname}/bin/${pkgname} ${pkgdir}/usr/bin
}

package_gradle-doc() {
  pkgdesc=('A powerful build system for the JVM (documentation and samples)')
  options=('!strip')
  optdepends=('gradle')
  cd "${srcdir}/gradle-${pkgver}"

  # create the necessary directory structure
  mkdir -p "${pkgdir}/usr/share/java/gradle/docs/"
  mkdir -p "${pkgdir}/usr/share/java/gradle/samples/"
  # copy across documentation and samples
  cp --recursive docs/* "${pkgdir}/usr/share/java/gradle/docs/"
  cp --recursive samples/* "${pkgdir}/usr/share/java/gradle/samples/"
}

package_gradle-src() {
  pkgdesc=('A powerful build system for the JVM (sources)')
  options=('!strip')
  optdepends=('gradle')

  cd "${srcdir}/gradle-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/java/gradle/src/"
  cp --recursive src/* "${pkgdir}/usr/share/java/gradle/src/"
}

md5sums=('6947e873602b3668b2f3cd8e2dd228f1'
         '0601af7dd04e3cddf09f22eb5dd9d880')
sha1sums=('139edf316650d90dfcf7a2fd44a433556a0d06d0'
          '54065e2f4c2ee991d7170e26054730ea11b0b845')
sha256sums=('5489234fc9c9733fc4115055618763ccb4d916d667980e6ab4fa57fc81197d16'
            '7cdd70370b92b297f350d5ff69b915359bdc37b4feac839696b0ab5eaa7d7c2a')
sha512sums=('29ec0ba12d5ac0658e7925ad760b25462384d7bfcb249638b42a0ff608b88aa9d7ec04c5e590d4c368c7ed8529b6d6a07dde552c2ae6dda7e33578a16cd4d41b'
            'f38e9b26e22948366acf6580d6f38e2c88c3791c425b24922368fe1bc78c744fa516a03ffdbef02e3755859da620a6259997d4b4e5f97e3dc8cb49b74a694616')
