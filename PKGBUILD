# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Pablo Vilas <pablovilas89 at gmail dot com>
# Contributor: Testuser_01 <arch@nico-siebler.de>

pkgbase=webstorm
pkgname=(webstorm webstorm-jre)
pkgver=2026.2.3
pkgrel=1
pkgdesc='JavaScript IDE and HTML editor'
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/webstorm/'
license=('custom:jetbrains')
depends=('glib2')
options=('!strip')
source=("https://download.jetbrains.com/webstorm/WebStorm-${pkgver}.tar.gz"
        jetbrains-webstorm.desktop
        LICENSE)
b2sums=('be398f1f3504715d3398f27fd7416c7185790e1f382b946c7d4f77c3cf41e83314ebf2fca9ebee3a805d5ee9cec961c36c05d0e807162879bd00b5ca3fa83bda'
        'a7c2c63112c967b1a866c2f27b5f4181a4a6a5666803a7a44fd9c4b707f69e69d21fbd8f95669f12e139838a3a90c730788f645cc303aed1ed78689637ec61ea'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_webstorm() {
  optdepends=('webstorm-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if webstorm-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely')
  _buildver="$(ls | grep -Eo 'WebStorm-[[:digit:]]+\.[[:digit:]]{2,5}\.[[:digit:]]+' | sort -r | head -1 | sed 's#WebStorm-##')"

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a WebStorm-${_buildver:?_buildver unset}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase} "${pkgdir}"/usr/bin/${pkgbase}
  install -m644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_webstorm-jre() {
  pkgdesc='JBR (JetBrains Runtime) for WebStorm - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'
  _buildver="$(ls | grep -Eo 'WebStorm-[[:digit:]]+\.[[:digit:]]{2,5}\.[[:digit:]]+' | sort -r | head -1 | sed 's#WebStorm-##')"

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a WebStorm-${_buildver:?_buildver unset}/jbr "${pkgdir}"/opt/${pkgbase}
}
