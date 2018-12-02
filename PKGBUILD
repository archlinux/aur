# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Sébastien Luttringer
pkgname=virtualbox-ext-oracle-beta
pkgver=6.0.0_BETA3
pkgrel=1
pkgdesc='Oracle VM VirtualBox Extension Pack'
arch=('any')
url='https://www.virtualbox.org/'
license=('custom:PUEL')
options=('!strip')
install="${pkgname}.install"
source=("https://download.virtualbox.org/virtualbox/${pkgver}/Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack")
noextract=("Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack")
sha256sums=('15e0e5c98eb1cc561a850d6be906afa0c4534e09a781f4924457abac2bd003cf')

prepare() {
  # shrink uneeded cpuarch
  [[ -d shrunk ]] || mkdir shrunk
  tar xfC "Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack" shrunk
  rm -r shrunk/{darwin*,solaris*,win*}
  tar -c --gzip --file shrunk.vbox-extpack -C shrunk .
}

package() {
  depends=('virtualbox-beta')
  optdepends=('rdesktop: client to connect vm via RDP')
  install -Dm 644 shrunk.vbox-extpack \
    "$pkgdir/usr/share/virtualbox/extensions/Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack"
  install -Dm 644 shrunk/ExtPack-license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/PUEL"
}
