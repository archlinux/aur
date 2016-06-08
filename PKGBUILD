# Maintainer: Morten Linderud <morten@linderud.pw>
# Contributor: Sebastian Stenzel <sebastian.stenzel@gmail.com>

pkgname=cryptomator
pkgver=1.1.0
pkgrel=1
pkgdesc="Multiplatform transparent client-side encryption of your files in the cloud."
arch=("any")
url="https://cryptomator.org/"
license=('MIT/X Consortium License')
depends=('jre8-openjdk' 'java-openjfx')
makedepends=('apache-ant')
source=("antkit-${pkgver}.tar.gz::https://github.com/cryptomator/cryptomator/releases/download/${pkgver}/antkit.tar.gz"
        'cryptomator.sh'
        'cryptomator.desktop'
        'cryptomator-vault.xml')
sha256sums=('SKIP'
            '0bc12ee603ef87536389aeb85bf0afaf8995bae2c9ed826290b2bb0d838a9766'
            '1193f85b545298f6d474c7f17865433f25c73995b00894e0d7d7bc873c696464'
            '78537ead26dcc1488d7fff02f47fce559f70f9bb2d7fa7fa1741ad3cd151bfad')

build() {
  export JAVA_HOME=/usr/lib/jvm/default-runtime/
  ant create-jar
}
package() {
  install -d ${pkgdir}/usr/share/java/${pkgname}
  install -Dm644 ${srcdir}/libs/*.jar ${pkgdir}/usr/share/java/$pkgname
  install -Dm644 ${srcdir}/antbuild/Cryptomator-${pkgver}.jar ${pkgdir}/usr/share/java/$pkgname/cryptomator.jar
  install -Dm755 ${srcdir}/cryptomator.sh ${pkgdir}/usr/bin/cryptomator
  install -Dm644 ${srcdir}/package/linux/Cryptomator.png ${pkgdir}/usr/share/java/${pkgname}
  install -Dm644 ${srcdir}/cryptomator-vault.xml ${pkgdir}/usr/share/mime/packages/cryptomator-vault.xml
  install -Dm644 ${srcdir}/cryptomator.desktop ${pkgdir}/usr/share/applications/cryptomator.desktop
}
post_install() {
  xdg-desktop-menu install --novendor /usr/share/applications/cryptomator.desktop
  xdg-mime install /usr/share/mime/packages/cryptomator-vault.xml
}
pre_remove() {
  xdg-desktop-menu uninstall --novendor /usr/share/applications/cryptomator.desktop
  xdg-mime uninstall /usr/share/mime/packages/cryptomator-vault.xml
}
