# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=jetbrains-gateway-eap
pkgname=(jetbrains-gateway-eap jetbrains-gateway-eap-jre)
pkgver=241.14494.32
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
b2sums=('2ca2c6ee057cbe283a3edacb2999935d6688e6acfbcdb660f448ce565a62293dd62edc63deab952bb8e7f8dc37c4766c5d98f39a8e9e0a9895986f6ea3264676'
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
