# Maintainer: bipin kumar <kbipinkumar@pm.me>
# Contributor: Fabio Heday <fheday@gmail.com>

pkgname=trnascan-se
pkgver=2.0.12
pkgrel=2
pkgdesc="Program for improved detection of transfer RNA (tRNA) genes in genomic sequence."
arch=('i686' 'x86_64')
url="http://lowelab.ucsc.edu/tRNAscan-SE/"
license=(GPL3)
depends=('infernal' 'perl' 'glibc')
backup=('etc/tRNAscan-SE.conf')
source=("https://github.com/UCSC-LoweLab/tRNAscan-SE/archive/refs/tags/v${pkgver}.tar.gz"
        'euk.patch'
        'Makefile.patch'
        'tRNAscan-SE.conf.src.patch'
        'tRNAscan-SE.src.patch')

sha512sums=('808ba99c5d492b77a32f64c16c3400c2094cfb882fee03bbbd77d3cccb26f2184ff7e1872edccee854918019571a88c9b9e0b95f9738294ba18979d49ecef4d1'
            'db98b453090d3870e5f20941bad3f4462d31a77c293df959f4da242356b7a87684f1941e534a807e9ac5c1df28d493ae565d507bc21c0dd0bbfda42d7ef407e8'
            'a938790ec87967b3fd4688d19d9be08a55ac0f485ca5b8d2c2b641e745a85b0917ad70d9d2d6c301b0426ecf621c2e655b8c38b51fe6c603af79ebc4e978ca0c'
            'd8f956c4c8796c069e17b6fc3087ab6b6bf4a1b9ed381032e580e0296679aeb7947151ce08f97d3e92771e36521dbfb716b575fc60ca02f21dcae76435f2bc63'
            '3aa37cf95d18d9ac5d9a641abeb18283e82f3c9f64b1734c8bf6f3cc8ac6e9e1e7545c417292ad459c9b385e7d5e03236198e328f6191113d43b3eda2a58f9b6')

prepare() {
  chmod -R o+xr tRNAscan-SE-${pkgver}/lib/tRNAscanSE/
  cp -r *.patch tRNAscan-SE-${pkgver}/
  cd tRNAscan-SE-${pkgver}/
  # Patches for using Directory structure as recommended in Archwiki
  patch -p1 < Makefile.patch
  patch -p1 < tRNAscan-SE.conf.src.patch
  patch -p1 < tRNAscan-SE.src.patch
  patch -p1 < euk.patch
  autoreconf -i  
  automake
}

build() {
  cd tRNAscan-SE-${pkgver}/
  ./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share/ --includedir=/usr/include/${pkgname}
  make
}

package() {
  cd tRNAscan-SE-${pkgver}
  make DESTDIR=${pkgdir}/ install
}
