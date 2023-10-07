# Maintainer: Shapiro <shapiro at quantentunnel dot de>

pkgname='veracrypt-inyourlanguage'
_pkgname='VeraCrypt'
pkgver=1.26.7
pkgrel=4
pkgdesc='Disk encryption with strong security based on TrueCrypt 7.1a. Supporting 40+ languages for installation.'
url='https://www.veracrypt.fr'
arch=('x86_64' 'i686' 'arm64' 'armhf' 'aarch64')
license=('Apache 2.0' 'TrueCrypt 3.0')
provides=('veracrypt')
conflicts=('veracrypt' 'veracrypt-console-bin' 'veracrypt-git' 'veracrypt-git-no-gost' 'veracrypt-trans')
depends=('fuse2>=2.8.0' 'wxwidgets-gtk3' 'libsm' 'device-mapper')
makedepends=('git' 'yasm' 'libxml2' 'coreutils')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
source=(https://veracrypt.fr/code/${_pkgname}/snapshot/${_pkgname}_${pkgver}.tar.gz
        select_lang.sh)
sha512sums=('c803c6301a8a7b6d8efc74284070c01629a760dceaa518f2287d62709bd25450fec75f2fa0e2ab0eb57993faec9cba4d51104273a56a88fa288a1e14bcf868bd'
            '12f9ad1fcdaa6a7b96165a40b56e7c6ea7502e88b8c7f432555acef5e252baccd07e83fc7d2091f4de77d803a65eb5dd13562adc1f11d769590805b944f2adaa')

prepare() {
  bash $srcdir/../select_lang.sh
}

build() {
  cd ${_pkgname}_${pkgver}/src
  make PKG_CONFIG_PATH=/usr/lib/pkgconfig WX_CONFIG=/usr/bin/wx-config
}

package() {
  cd ${_pkgname}_${pkgver}/src
  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir/usr/sbin"
  rm -r "$pkgdir/usr/share/veracrypt"
}

