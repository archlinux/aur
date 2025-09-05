# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=psiconv
pkgver=0.9.9
pkgrel=12
pkgdesc="Converts Psion 5(MX) files to more commonly used file formats"
arch=('x86_64')
url="http://software.frodo.looijaard.name/psiconv/"
license=('GPL')
depends=('graphicsmagick')
makedepends=('bc')
backup=('etc/psiconv/psiconv.conf')
source=("http://www.frodo.looijaard.name/system/files/software/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "psiconv-0.9.9-fileformat_list.patch"
        "psiconv-0.9.9-no-getopt.patch")
md5sums=('286e427b10f4d10aaeef1944210a2ea6'
         '876fae6eb5dbe3cd5c9fe4ced54df549'
         '518658a009d5e1f22d5af54563b74907')
sha512sums=('ec21d1e4734ad79dc19146223d7016bd53b3a3bb602f3a55489663ccbf3a4c6f5c6417728e798b4448acc2e49ff5145f58c812edfdd6c11ee9060128b6157d3a'
            'e2d8aad681604052caf54a0bcb96bef4415aa726328bab2c587ff88d42430d70d5f24a48e9379e111efc1e95cb9d302cbcf3109b01d0a690fefd9765e6e19cd7'
            'e6d73f49bd5c7b3ac8fe45208c522eec7e8d962ea6b36ab395c534d0d3120ea02384a14c15f7f521aa12f36ce7541dca521a84c877200e35db4a8fe45f548693')

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 <"$srcdir"/psiconv-0.9.9-fileformat_list.patch
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
