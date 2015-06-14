# Maintainer: -
# Based on the official 'java-common' package from [extra]:
# - https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/java-common

pkgname=('java32-runtime-common' 'java32-environment-common')
pkgbase=java32-common
pkgver=2
pkgrel=2
arch=('any')
license=('GPL')
source=('archlinux-java32'
        'jre32.csh'
        'jre32.sh')
sha256sums=('cc36abf878c488f5426a6ad5584874c0d7af53d4b6b0ff4d1fc9e28d34285278'
            'aca3bf98c4ceb765ea873c36f64a123a2c4a50e7d8c30ee00c34b86b75f029a0'
            '11fc4c32d52c5672fee764b25de133e243db0cace8a470ad816de7e6b33d962d')

package_java32-runtime-common() {
  pkgdesc='Common files for 32-bit Java Runtime Environments'
  url="https://www.archlinux.org/packages/extra/any/${pkgname}/"
  backup=('etc/profile.d/jre32.sh'
          'etc/profile.d/jre32.csh')
  install=${pkgname}.install

  install -d "${pkgdir}"/usr/lib32/jvm/
  ln -s /dev/null "${pkgdir}"/usr/lib32/jvm/default
  ln -s /dev/null "${pkgdir}"/usr/lib32/jvm/default-runtime

  install -Dm644 jre32.sh  "${pkgdir}"/etc/profile.d/jre32.sh
  install -Dm644 jre32.csh "${pkgdir}"/etc/profile.d/jre32.csh
  install -Dm755 archlinux-java32 "${pkgdir}"/usr/bin/archlinux-java32

  install -d "${pkgdir}"/usr/bin/
  # Official list of binaries that Java headless runtime packages MUST provide
  # This list is based on Arch Linux' default Java implementation: "OpenJDK 7 Icedtea"
  for b in java keytool orbd pack200 policytool rmid rmiregistry servertool tnameserv unpack200; do
    ln -s /usr/lib32/jvm/default-runtime/bin/${b} "${pkgdir}"/usr/bin/${b}32
  done
}

package_java32-environment-common() {
  pkgdesc='Common files for 32-bit Java Development Kits'
  url="https://www.archlinux.org/packages/extra/any/${pkgname}/"
  depends=('java32-runtime-common')

  install -d "${pkgdir}/usr/bin/"
  # Official list of supplementary binaries that Java environment packages MUST provide
  # This list is based on Arch Linux' default Java implementation: "OpenJDK 7 Icedtea"
  for b in appletviewer extcheck idlj jar jarsigner javac javadoc javah javap jcmd \
           jconsole jdb jhat jinfo jmap jps jrunscript jsadebugd jstack jstat \
           jstatd native2ascii rmic schemagen serialver wsgen wsimport xjc; do
    ln -s /usr/lib32/jvm/default/bin/${b} "${pkgdir}"/usr/bin/${b}32
  done
}
