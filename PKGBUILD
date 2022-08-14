# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=lceda-bin
_pkgname=${pkgname%-bin}
pkgver=6.5.11
pkgrel=1
pkgdesc="免费、强大、易用的在线电路设计软件"
arch=('x86_64')
url="https://lceda.cn/page/download"
license=('custom')
depends=('gtk3' 'nss' 'libxss')
makedepends=('unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.zip::https://image.lceda.cn/files/${_pkgname}-linux-x64-${pkgver}.zip"
        "LICENSE")
sha256sums=('f520c9b3e9902ba5a996cea72e24da138ddad4f5fc7c824a45447fdcb1f95d68'
            '9b53bc19a98498c86019cc32a3ade6ad0ee4b12ba30686feb93132a5f0da52f5')

package() {
  
  install -dm755 ${pkgdir}/opt/${_pkgname}
  unzip lceda-linux-x64.zip -d ${pkgdir}/opt/${_pkgname}
  
  # icon
  local _icon
  for _icon in 16 32 48 64 128 256;
  do
    install -Dm644 ${pkgdir}/opt/${_pkgname}/icon/${_icon}x${_icon}/${_pkgname}.png \
                   ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png
  done
  rm -rf ${pkgdir}/opt/${_pkgname}/icon

  # desktop entry
  install -Dm644 ${pkgdir}/opt/${_pkgname}/LCEDA.dkt \
                 ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  sed -i 's|/lceda-linux-x64/icon/128x128/lceda.png|lceda|g' \
                                  ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  sed -i 's|/lceda-linux-x64/||g' ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  rm -rf ${pkgdir}/opt/${_pkgname}/LCEDA.dkt

  # soft link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  chmod 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}

  # LICENSE
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim: set sw=2 ts=2 et:
