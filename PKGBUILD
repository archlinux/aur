# Mostly a copy of feishu-bin's PKGBUILD with s/feishu/lark/
# Maintainer: Sabit Maulana <sbtmul@gmail.com>
pkgname=larksuite-bin
pkgver=6.1.12
#_pkgrel=24
_pkghash=a3eeecb6
_pkgtyp=stable
pkgrel=1
pkgdesc="Linux client of Lark Suite"
arch=('x86_64')
url="https://www.larksuite.com/download"
license=('unknown')
depends=('ca-certificates' 'gtk3' 'nss' 'xdg-utils')
replaces=('bytedance-lark-dev-bin')
conflicts=('lark')
provides=('bytedance-lark' 'lark')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://sf16-va.larksuitecdn.com/obj/lark-artifact-storage/${_pkghash}/Lark-linux_x64-${pkgver}.deb")
sha256sums=('a808a56e19d4968ef7cd11da35aa68c67f3df7e63f29eca4289374101648f1d5')

package(){
  # Extract package data
  tar xpvf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgdir}"

  # Modify files
  cd "${pkgdir}"
  ln -s bytedance-lark-${_pkgtyp} usr/bin/lark

  sed -i "s/bytedance-lark-${_pkgtyp}/lark/g" "${pkgdir}/usr/share/applications/bytedance-lark.desktop"
  sed -i 's/StartupNotify=true/StartupNotify=true\nStartupWMClass=lark/g' "${pkgdir}/usr/share/applications/bytedance-lark.desktop"

  sed -i "s/bytedance-lark-${_pkgtyp}/lark/g" "${pkgdir}/usr/share/menu/bytedance-lark.menu"
  sed -i "s/bytedance-lark/lark/g" "${pkgdir}/usr/share/menu/bytedance-lark.menu"

  sed -i 's/bytedance-lark/lark/g' "${pkgdir}/usr/share/appdata/bytedance-lark.appdata.xml"

  sed -i 's/bytedance-lark/lark/g' "${pkgdir}/opt/bytedance/lark/bytedance-lark"

  mv "${pkgdir}"/usr/share/menu/{bytedance-,}lark.menu
  mv "${pkgdir}"/usr/share/applications/{bytedance-,}lark.desktop
  mv "${pkgdir}"/usr/share/appdata/{bytedance-,}lark.appdata.xml
  mv "${pkgdir}"/usr/share/man/man1/{bytedance-lark-${_pkgtyp},lark}.1.gz
  mv "${pkgdir}"/usr/share/doc/{bytedance-lark-${_pkgtyp},lark}

  # Fix directory permissions
  find "${pkgdir}" -type d | xargs chmod 755
}
