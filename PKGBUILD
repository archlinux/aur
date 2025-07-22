# Mostly a copy of feishu-bin's PKGBUILD with s/feishu/lark/
# Contributor: Sabit Maulana <sbtmul@gmail.com>
# Maintainer: aliu <double-a, r-o-n to the 0-1-3-0 at ur gmail.com>
pkgname=larksuite-bin
pkgver=7.42.17
_pkgtyp=stable
pkgrel=1
pkgdesc="Linux client of Lark Suite"
arch=('x86_64')
url="https://www.larksuite.com"
license=('unknown')
depends=('gtk3' 'libpulse' 'libmfx' 'alsa-lib')
replaces=('bytedance-lark-dev-bin')
provides=('bytedance-lark' 'lark')
options=('!emptydirs')
install=${pkgname}.install
source=(Lark-linux_x64-${pkgver}.deb::https://www.larksuite.com/api/package_info?platform=10)
DLAGENTS=("https::/usr/bin/sh -c curl\ -LO\ \"\$\(curl\ \'%u\'\ \|\ grep\ -oP\ \'\(\?\<=\"download_link\":\"\)\[\^\"\]\*\'\ --\ \|\ sed\ \'s/\\\\\\\\u0026/\\\&/g\'\ --\)\"")
sha256sums=('7eeb1495f6488d9e754a76e0d962518591b043ecadcd8f3c6a66d51d27c3d269')

package() {
  # Extract package data
  tar xpvf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgdir}"

  # Modify files
  cd "${pkgdir}"

  ln -s bytedance-lark-${_pkgtyp} usr/bin/lark

  sed -i 's/StartupNotify=true/StartupNotify=true\nStartupWMClass=lark/g' "${pkgdir}/usr/share/applications/bytedance-lark.desktop"

  sed -i "s/bytedance-lark-${_pkgtyp}/lark/g" "${pkgdir}/usr/share/applications/bytedance-lark.desktop"
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
