# Maintainer: Sébastien Luttringer
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=virtualbox-ext-oracle
pkgver=7.2.16
_filever="${pkgver}"
pkgrel=1
pkgdesc='Oracle VM VirtualBox Extension Pack'
arch=('x86_64')
url='https://www.virtualbox.org/'
license=('custom:PUEL')
depends=("virtualbox=${pkgver}")
optdepends=('rdesktop: client to connect vm via RDP')
options=('!strip')
source=("https://download.virtualbox.org/virtualbox/${_filever}/Oracle_VirtualBox_Extension_Pack-${_filever}.vbox-extpack")
noextract=("Oracle_VirtualBox_Extension_Pack-${_filever}.vbox-extpack")
sha256sums=('d1e268cfa05223fd651703043af09f39dfb90da259ce9ec093d9d9b022f19689')

prepare() {
  mkdir Oracle_VirtualBox_Extension_Pack/
  tar --no-same-owner --one-top-level='Oracle_VirtualBox_Extension_Pack/' \
    -xzf "${srcdir}/Oracle_VirtualBox_Extension_Pack-${_filever}.vbox-extpack" \
    ./linux.amd64 ./ExtPack{-license.{html,rtf,txt},.manifest,.signature,.xml} ./PXE-Intel.rom
  sed -in "/\(ExtPack-\|linux\.amd64\)/p" Oracle_VirtualBox_Extension_Pack/ExtPack.manifest
}

package() {
  install -d "${pkgdir}"/usr/lib/virtualbox/ExtensionPacks/
  mv Oracle_VirtualBox_Extension_Pack/ "${pkgdir}"/usr/lib/virtualbox/ExtensionPacks/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s ../../../lib/virtualbox/ExtensionPacks/Oracle_VirtualBox_Extension_Pack/ExtPack-license.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
