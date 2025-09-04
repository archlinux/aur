# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=psiconv
pkgver=0.9.9
pkgrel=11
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
         '518658a009d5e1f22d5af54563b74907')
sha512sums=('ec21d1e4734ad79dc19146223d7016bd53b3a3bb602f3a55489663ccbf3a4c6f5c6417728e798b4448acc2e49ff5145f58c812edfdd6c11ee9060128b6157d3a'
            '0d77e65da5b7015789f276a141bbb64813f0405720efc9b2f00cb4c784624207439a5e9058fcc69b98f8c16dac261eec4e6c336299f60f5c33027771b88cdf8c'
            'e6d73f49bd5c7b3ac8fe45208c522eec7e8d962ea6b36ab395c534d0d3120ea02384a14c15f7f521aa12f36ce7541dca521a84c877200e35db4a8fe45f548693')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 <"$srcdir"/psiconv.patch
  patch -Np1 <"$srcdir"/psiconv-0.9.9-no-getopt.patch

  sed -e 's|Magick-config|GraphicsMagick-config|g' -i configure.in
  autoreconf -vi
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
