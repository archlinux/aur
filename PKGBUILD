# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: FlyInWind <2518509078@qq.com>

pkgname=ynote-desktop-bin
_pkgname=${pkgname%-bin}
pkgver=7.2.170
pkgrel=1
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
source=(${_pkgname}-${pkgver}.deb::"https://cowork-common-public-cdn.lx.netease.com/artifact%2F2024%2F01%2F12%2F17feab84.deb"
        "LICENSE.html::https://note.youdao.com/license.html")
sha256sums=('bf8d72150b4cbbec0a22c4d8964cce227fdc83ffb5ec409776b09168e8e8f9c2'
            'a8aec47c7cc6e6d838d525c89b58a962d650c84b0ebec09ecfb8955381fe6460')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/{} \;
}

prepare() {
  mkdir -p ${srcdir}/build
  tar -xf data.* -C build
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
  install -d ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/
}

# vim: set sw=2 ts=2 et:
