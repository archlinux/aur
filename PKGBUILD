# Maintainer: Shapiro <shapiro at quantentunnel dot de>

pkgname='veracrypt-inyourlanguage'
_pkgname='VeraCrypt'
pkgver=1.26.7
pkgrel=8
pkgdesc='Disk encryption with strong security based on TrueCrypt 7.1a. Supporting 40+ languages for installation.'
url='https://www.veracrypt.fr'
arch=('x86_64' 'i686' 'arm64' 'armhf' 'aarch64')
license=('custom')
provides=('veracrypt')
conflicts=('veracrypt' 'veracrypt-console-bin' 'veracrypt-git' 'veracrypt-trans')
depends=('fuse2>=2.8.0' 'wxwidgets-gtk3' 'libsm' 'device-mapper')
makedepends=('git' 'yasm' 'libxml2' 'coreutils')
optdepends=('sudo: mounting encrypted volumes as nonroot users' 'pcsclite: providing support for smartcards')
source=(https://veracrypt.fr/code/${_pkgname}/snapshot/${_pkgname}_${pkgver}.tar.gz
        select_lang.sh)
sha512sums=('c803c6301a8a7b6d8efc74284070c01629a760dceaa518f2287d62709bd25450fec75f2fa0e2ab0eb57993faec9cba4d51104273a56a88fa288a1e14bcf868bd'
            '91f39bd51f397a02483b2cc2df19ea2e16539551311aaffd9a892da1153558aa85c5b09c276a0a8d86b511873d3b11a861ff93bb4d3d75e40a3c4860e34f13e1')

prepare() {
  bash $srcdir/../select_lang.sh
}

build() {
  cd ${_pkgname}_${pkgver}/src
  make NOTEST=1 PKG_CONFIG_PATH=/usr/lib/pkgconfig WX_CONFIG=/usr/bin/wx-config
}

package() {
  cd ${_pkgname}_${pkgver}/src
  make DESTDIR="${pkgdir}/" install
  install -Dm 644 License.txt -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  rm -r "${pkgdir}/usr/sbin"
  rm -r "${pkgdir}/usr/share/veracrypt"
  rm -r "${pkgdir}/usr/share/doc"
}

