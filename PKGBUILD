# Maintainer: Sébastien Luttringer
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=virtualbox-ext-oracle
pkgver=7.2.14
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
sha256sums=('ce4461de974f041435660751b382f987fece831028a8c98572d668eda2eee96d')

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
