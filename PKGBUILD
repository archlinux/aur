# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Sébastien Luttringer

pkgname=virtualbox-ext-oracle-beta
pkgver=6.1.0_RC1
pkgrel=1
pkgdesc='Oracle VM VirtualBox Extension Pack (Beta)'
arch=('any')
url='https://www.virtualbox.org/'
license=('custom:PUEL')
options=('!strip')
install="${pkgname}.install"
source=("https://download.virtualbox.org/virtualbox/${pkgver}/Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack")
noextract=("Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack")
sha256sums=('0e060ef651ba691ae7a24a9619cb4a9b4bec6a55922d05f1ad6861b1d05da2df')

prepare() {
  # shrink uneeded cpuarch
  [[ -d shrunk ]] || mkdir shrunk
  tar xfC "Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack" shrunk
  rm -r shrunk/{darwin*,solaris*,win*}
  tar -c --gzip --file shrunk.vbox-extpack -C shrunk .
}

package() {
  depends=('virtualbox-beta-bin')
  optdepends=('rdesktop: client to connect vm via RDP')
  install -Dm 644 shrunk.vbox-extpack \
    "$pkgdir/usr/share/virtualbox/extensions/Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack"
  install -Dm 644 shrunk/ExtPack-license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/PUEL"
}
