# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=lceda-bin
_pkgname=${pkgname%-bin}
pkgver=6.5.61
pkgrel=1
pkgdesc="免费、强大、易用的在线电路设计软件"
arch=('x86_64')
url="https://lceda.cn/page/download"
license=('custom')
depends=('gtk3' 'nss' 'libxss')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.zip::https://image.lceda.cn/files/${_pkgname}-linux-x64-${pkgver}.zip"
        "LICENSE")
sha256sums=('078694860aabbc59a4206a33de137b1b6e5259c174d7b0d27c86996a49a319d0'
            '9b53bc19a98498c86019cc32a3ade6ad0ee4b12ba30686feb93132a5f0da52f5')

package() {
  
  install -dm755 ${pkgdir}/opt/${_pkgname}
  cp -pr ${srcdir}/lceda-linux-x64/* ${pkgdir}/opt/${_pkgname}
  
  # icon
  local _icon
  for _icon in 16 32 128 256 512;
  do
    install -Dm644 ${pkgdir}/opt/${_pkgname}/icon/icon_${_icon}x${_icon}.png \
                   ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png
  done
  rm -rf ${pkgdir}/opt/${_pkgname}/icon

  # desktop entry
  install -Dm644 ${pkgdir}/opt/${_pkgname}/LCEDA.dkt \
                 ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  sed -i 's|/opt/lceda/icon/icon_128x128.png|lceda|g' \
                                  ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  sed -i 's|/opt/lceda/||g' ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  rm -rf ${pkgdir}/opt/${_pkgname}/LCEDA.dkt

  # soft link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  chmod 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}

  # LICENSE
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim: set sw=2 ts=2 et:
