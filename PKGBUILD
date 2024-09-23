# Maintainer: Shapiro <shapiro at quantentunnel dot de>

pkgname='veracrypt-inyourlanguage'
_pkgname='VeraCrypt'
pkgver=1.26.14
pkgrel=2
pkgdesc='Disk encryption with strong security based on TrueCrypt 7.1a. Supporting 40+ languages, changeable while running the program.'
url='https://www.veracrypt.fr'
arch=('x86_64' 'i686' 'arm64' 'armhf' 'aarch64')
license=('custom')
provides=('veracrypt')
conflicts=('veracrypt' 'veracrypt-console-bin' 'veracrypt-git' 'veracrypt-trans')
depends=('fuse2>=2.8.0' 'wxwidgets-gtk3' 'libsm' 'device-mapper')
makedepends=('git' 'yasm' 'libxml2' 'coreutils')
optdepends=('sudo: mounting encrypted volumes as nonroot users' 'pcsclite: providing support for smartcards')
source=(https://launchpad.net/veracrypt/trunk/${pkgver}/+download/${_pkgname}_${pkgver}_Source.tar.bz2
UserInterface.patch)
sha512sums=('4feba438be4309edbc3e74dc8002bcc055f1f68a94b53080100a72fa9ae24a80c36fe308f2ebe1ecfc04da909245f046d57d7168dd5c0530010ffdbdac792727'
'3fddc0102fd2429408109bc4d3d699412f46e86d0dd48b9f5e31a7878cb37cb0e17dcea4cd30338289144204d8d9ac232b342cf43b6b1795049c4d9da04ce612')

prepare() {
  cd src
  patch -p1 < "${srcdir}/UserInterface.patch"
}

build() {
  cd src
  make NOTEST=1 PKG_CONFIG_PATH=/usr/lib/pkgconfig WX_CONFIG=/usr/bin/wx-config
}

package() {
  cd src
  make DESTDIR="${pkgdir}/" install
  install -Dm 644 License.txt -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  echo "Installing language files..."
  install -d "${pkgdir}/usr/share/veracrypt/languages"
  install -Dm 644 ../Translations/* "${pkgdir}/usr/share/veracrypt/languages/"
  rm -r "${pkgdir}/usr/sbin"
  rm -r "${pkgdir}/usr/share/doc"
}
