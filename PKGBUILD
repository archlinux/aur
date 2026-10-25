# Maintainer: Shapiro <shapiro at quantentunnel dot de>

pkgname='veracrypt-inyourlanguage'
_pkgname='VeraCrypt'
pkgver=1.26.30
pkgrel=1
pkgdesc='Disk encryption with strong security based on TrueCrypt 7.1a supporting 40+ languages.'
url='https://www.veracrypt.jp'
arch=('x86_64' 'i686' 'arm64' 'armhf' 'aarch64')
license=('Apache License 2.0 and TrueCrypt License 3.0')
provides=('veracrypt')
conflicts=('veracrypt' 'veracrypt-console-bin' 'veracrypt-git' 'veracrypt-trans')
depends=('device-mapper' 'fuse2' 'wxwidgets-gtk3')
makedepends=('pcsclite' 'yasm')
optdepends=('doas' 'sudo')
source=(https://github.com/veracrypt/${_pkgname}/releases/download/${_pkgname}_${pkgver}/${_pkgname}_${pkgver}_Source.tar.bz2)
sha512sums=('B8D6395BDF89114FD1DDF0E9225F1F416C07A44FCE0E733C6A27B3571F2FCBA8AC255722EF5A0B1CE093D539387B0F40221229F61B8CC702697D4034B08F9DD3')

build() {
  cd src
  make PKG_CONFIG_PATH=/usr/lib/pkgconfig WX_CONFIG=/usr/bin/wx-config
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
