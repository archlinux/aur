# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=phpstorm
pkgname=(phpstorm phpstorm-jre)
pkgver=2019.2.4b192.7142.41
pkgrel=1
pkgdesc='Lightweight and Smart PHP IDE'
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/phpstorm/'
depends=('glib2' 'python')
options=('!strip')
source=(https://download.jetbrains.com/webide/PhpStorm-${pkgver%b*}.tar.gz
        jetbrains-phpstorm.desktop)
sha512sums=('f1215162c9b459afc967b49966bcc12813284432b115af16fc6ccb60da0043a4d7a1a44bd7c712d123d972031bb38e27ee011dc84104281b8e299a7faaf9ec31'
            'b10edd04a7d48641bec7a9e23037510b426acb5a3059267b2081ec0fce41272d8de413f0b4c1dddd3387bb0ce330c48b3f7894f4817973cd6d32a74a14af3528')

pkgver() {
  echo "${pkgver%b*}b$(find ${srcdir} -maxdepth 1 -type d -printf "%P" | cut -d "-" -f2)"
}

package_phpstorm() {
  optdepends=('phpstorm-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if phpstorm-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/PhpStorm-${pkgver#*b}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -D -m 644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -D -m 644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
}

package_phpstorm-jre() {
  pkgdesc='JBR (JetBrains Runtime) for PhpStorm - a patched JDK'
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'

  install -d -m 755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/PhpStorm-${pkgver#*b}/jbr "${pkgdir}"/opt/${pkgbase}
}
