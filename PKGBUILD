# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgbase=phpstorm
pkgname=(phpstorm phpstorm-jre)
pkgver=2019.2.2b192.6603.42
pkgrel=3
pkgdesc='Lightweight and Smart PHP IDE'
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/phpstorm/'
makedepends=('rsync')
options=('!strip')
source=(https://download.jetbrains.com/webide/PhpStorm-${pkgver%b*}.tar.gz
        jetbrains-phpstorm.desktop)
sha512sums=('25979367e999ad7c5fd7f1c9763156370d52f36bf41d911969f33f2e32bf11a87792b091feab474b43039e64433c10c7ca6704868b0f152041d92c297ad7ba31'
            'b10edd04a7d48641bec7a9e23037510b426acb5a3059267b2081ec0fce41272d8de413f0b4c1dddd3387bb0ce330c48b3f7894f4817973cd6d32a74a14af3528')

pkgver() {
  echo "${pkgver%b*}b$(find ${srcdir} -maxdepth 1 -type d -printf "%P" | cut -d "-" -f2)"
}

package_phpstorm() {
  optdepends=('phpstorm-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if phpstorm-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/PhpStorm-${pkgver#*b}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jbr

  ln -s "/opt/${pkgbase}/bin/${pkgbase}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_phpstorm-jre() {
  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/PhpStorm-${pkgver#*b}/jbr" "${pkgdir}/opt/${pkgbase}"
}
