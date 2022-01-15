# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=ynote-desktop-bin
_pkgname=${pkgname%-bin}
pkgver=7.0.4_1907
pkgrel=2
pkgdesc="Netease Youdao Ynote for Linux"
arch=('x86_64')
url="https://note.youdao.com/"
license=('custom')
depends=('gtk3'
         'libnotify'
         'nss'
         'libxss'
         'libxtst'
         'xdg-utils'
         'at-spi2-core'
         'util-linux-libs'
         'libappindicator-gtk3'
         'libsecret')
makedepends=('tar')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}-${pkgver}.deb::"https://artifact.lx.netease.com/download/ynote-electron/%E6%9C%89%E9%81%93%E4%BA%91%E7%AC%94%E8%AE%B0-web.deb"
        "LICENSE.html::https://note.youdao.com/license.html")
sha256sums=('512dcaee31b3a72b2466c7e79a87b51f4f47ce35e3dd0e1158a2f55d34e15a39'
            'a8aec47c7cc6e6d838d525c89b58a962d650c84b0ebec09ecfb8955381fe6460')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/{} \;
}

prepare() {
  mkdir -p ${srcdir}/build
  tar -xvf data.* -C build
}

package() {
  cd ${srcdir}/build

  install -dm755 ${pkgdir}/opt/${_pkgname}/
  cp -a opt/有道云笔记/* ${pkgdir}/opt/${_pkgname}/

  _install 644 usr/share/applications
  _install 644 usr/share/icons

  # desktop entry fix
  sed -i "s|/opt/有道云笔记|/opt/${_pkgname}|g" \
         ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  install -Dm644 ${srcdir}/LICENSE.html -t ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set sw=2 ts=2 et:
