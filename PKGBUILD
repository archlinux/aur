# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=psiconv
pkgver=0.9.9
pkgrel=10
pkgdesc="Converts Psion 5(MX) files to more commonly used file formats"
arch=('x86_64')
url="http://software.frodo.looijaard.name/psiconv/"
license=('GPL')
depends=('graphicsmagick')
makedepends=('bc')
backup=('etc/psiconv/psiconv.conf')
source=("http://www.frodo.looijaard.name/system/files/software/${pkgname}/${pkgname}-${pkgver}.tar.gz" psiconv.patch psiconv-0.9.9-no-getopt.patch)
md5sums=('286e427b10f4d10aaeef1944210a2ea6'
         'f86bd1b9ee4dd0d1866f30b2faad6bfc'
         'da46dafbac8051ee887a69e5bf221161')
sha512sums=('ec21d1e4734ad79dc19146223d7016bd53b3a3bb602f3a55489663ccbf3a4c6f5c6417728e798b4448acc2e49ff5145f58c812edfdd6c11ee9060128b6157d3a'
            '0d77e65da5b7015789f276a141bbb64813f0405720efc9b2f00cb4c784624207439a5e9058fcc69b98f8c16dac261eec4e6c336299f60f5c33027771b88cdf8c'
            '1c3bfd663409cad69d03870889d69999359deb814c4b4ff1e9271d1c5bff330b05ec252d4988cab5db22c76c632bbcf582e01254cd4083a5bc9abab534858e83')

prepare() {
  cd $pkgname-$pkgver
  sed -e 's|Magick-config|GraphicsMagick-config|g' -i configure.in
  autoreconf -vi

  patch -p1 <"$srcdir"/psiconv.patch
  patch -Np1 <"$srcdir"/psiconv-0.9.9-no-getopt.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
