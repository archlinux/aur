# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=jetbrains-gateway-eap
pkgname=(jetbrains-gateway-eap jetbrains-gateway-eap-jre)
pkgver=241.14494.184
pkgrel=1
pkgdesc='An entry point to Remote Development, Early Access Program (EAP) build.'
arch=('x86_64' 'i686')
license=('custom:jetbrains')
url='https://www.jetbrains.com/remote-development/gateway/nextversion/'
depends=('glib2')
options=('!strip')
source=("https://download-cf.jetbrains.com/idea/gateway/JetBrainsGateway-${pkgver}.tar.gz"
        jetbrains-gateway-eap.desktop
        LICENSE)
b2sums=('aef2ce9fdea64881fc17a25edb4a89ca40fd174c3850d62681a6532c0a7522380c0c3c8ca09a3dd97f89fc7e576b07eabd24594bd9d4b75192a49c14b10428e5'
        'e7ef51c2c64fce8d4990fcac68c901b63485ea8124db5aacf639c7cd0a00c82c2cf77cb1e3ea6b0ae79795dc4b6d34a32b694b9724ea65fd1665d608bc410a51'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_jetbrains-gateway-eap() {
  optdepends=('jetbrains-gateway-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if jetbrains-gateway-eap-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')
  _buildver="$(ls | grep -Eo 'JetBrainsGateway-[[:digit:]]+\.[[:digit:]]{2,5}\.[[:digit:]]+' | sort -r | head -1 | sed 's#JetBrainsGateway-##')"

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/JetBrainsGateway-${_buildver}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/gateway.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -D -m 644 "${srcdir}"/${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -D -m 644 "${pkgdir}"/opt/${pkgbase}/bin/gateway.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_jetbrains-gateway-eap-jre() {
  pkgdesc='JBR (JetBrains Runtime) for JetBrains Gateway - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'
  _buildver="$(ls | grep -Eo 'JetBrainsGateway-[[:digit:]]+\.[[:digit:]]{2,5}\.[[:digit:]]+' | sort -r | head -1 | sed 's#JetBrainsGateway-##')"

  install -d -m 755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/JetBrainsGateway-${_buildver}/jbr "${pkgdir}"/opt/${pkgbase}
}
