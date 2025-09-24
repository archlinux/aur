# Maintainer: Shapiro <shapiro at quantentunnel dot de>

pkgname='veracrypt-inyourlanguage'
_pkgname='VeraCrypt'
pkgver=1.26.24
pkgrel=2
pkgdesc='Disk encryption with strong security based on TrueCrypt 7.1a supporting 40+ languages.'
url='https://www.veracrypt.jp'
arch=('x86_64' 'i686' 'arm64' 'armhf' 'aarch64')
license=('Apache License 2.0 and TrueCrypt License 3.0')
provides=('veracrypt')
conflicts=('veracrypt' 'veracrypt-console-bin' 'veracrypt-git' 'veracrypt-trans')
depends=('device-mapper' 'fuse2' 'sudo' 'wxwidgets-gtk3')
makedepends=('pcsclite' 'yasm')
source=(https://launchpad.net/veracrypt/trunk/${pkgver}/+download/${_pkgname}_${pkgver}_Source.tar.bz2
        veracrypt.png)

sha512sums=('c2e42a77f6535e5958289bb85429f813ced3592c58409240d9c4411dfd18e2fae4b1fe62a9ed36da7577971259024b52da1eabebbe8e9cd17b13d64f194bbf29'
            'SKIP')

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
  echo "Adding Desktop-Icon..."
  install -Dm 644 "${srcdir}/veracrypt.png" -t "${pkgdir}/usr/share/pixmaps"
  rm -r "${pkgdir}/usr/sbin"
  rm -r "${pkgdir}/usr/share/doc"
}
