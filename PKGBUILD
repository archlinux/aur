# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=jetbrains-gateway
pkgname=(jetbrains-gateway jetbrains-gateway-jre)
pkgver=2023.3
pkgrel=1
pkgdesc='An entry point to Remote Development'
arch=('x86_64' 'i686')
license=('custom:jetbrains')
url='https://www.jetbrains.com/remote-development/gateway/'
depends=('glib2')
options=('!strip')
source=("https://download.jetbrains.com/idea/gateway/JetBrainsGateway-${pkgver}.tar.gz"
        jetbrains-gateway.desktop
        LICENSE)
b2sums=('74ea707fcf1db1e21266365a56b49a12d4f3573f1fa8f0b12ae749fd5361df24ba2c353b074fe96d40f8952c530bfc91db84dc27014a89270f94168dbb1d35cb'
        'a3b84f0bfc783abc4174bb903e2b0d48e820f698a724593626c5ba142ae0acede39d3d3dba43638c5bd13bbc3ff68f98f34240eebec88798565a86a0d804de17'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_jetbrains-gateway() {
  optdepends=('jetbrains-gateway-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if jetbrains-gateway-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')
  _buildver="$(ls | grep -Eo 'JetBrainsGateway-[[:digit:]]+\.[[:digit:]]{2,5}\.[[:digit:]]+' | sort -r | head -1 | sed 's#JetBrainsGateway-##')"

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/JetBrainsGateway-${_buildver}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase#*-}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -D -m 644 "${srcdir}"/${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -D -m 644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase#*-}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_jetbrains-gateway-jre() {
  pkgdesc='JBR (JetBrains Runtime) for JetBrains Gateway - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'
  _buildver="$(ls | grep -Eo 'JetBrainsGateway-[[:digit:]]+\.[[:digit:]]{2,5}\.[[:digit:]]+' | sort -r | head -1 | sed 's#JetBrainsGateway-##')"

  install -d -m 755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/JetBrainsGateway-${_buildver}/jbr "${pkgdir}"/opt/${pkgbase}
}
