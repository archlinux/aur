# Maintainer: Barry Smith <brrtsm at gmmal dot com>
# Contributor: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click> Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=3.4
_ndpiver=521afe7e1f340eff5d475b4f0bc6f91ea91c0601
pkgrel=2
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL3')
depends=('redis' 'geoip' 'libmariadbclient' 'libpcap' 'sqlite')
makedepends=('glib2' 'automake' 'libtool' 'wget' 'curl' 'libxml2')
source=("https://github.com/ntop/$pkgname/archive/$pkgver.tar.gz"
	"https://github.com/ntop/nDPI/archive/$_ndpiver.zip"
	"$pkgname@.service" 
	"fix-mongoose.patch")

sha512sums=('0fc6671b11412d8ecaef45cc3cdd57ab5970af7e08b78181d61657b74bea1a6fed717d00a5c951d2e47ad9c046839be998f39ae0fc5a7b616d5c569f044a12e9'
'fbaa20b0a043d0e39ba9149a5e445765d184892c4385640b445b91a456264ca8365d890eb4a83e76d8f5767b097a5405dc1f2c374adf7e9cfa1211bfc7fd7063'
'b3d9a2032cce91ee4faf81522a30a2877540b3fc7a0d43f8fe4f01c16efb0b8f6e73cfe26028b3a070296d7156abf511d3e11f93635ca2de8a4d67322b0ade60'
'3652880a2b1899950a8d534d57ffded396e4aa3238831993481d29a527a518ca1210c13c20330281d59c9b1c0287aed1a0312b152dc82e7f75aaaf284310a880'
)

build() {
  cd $srcdir	
  patch -p0 < fix-mongoose.patch
  cd $srcdir/nDPI-$_ndpiver
  ./autogen.sh
  ./configure
  make
  export NDPI_HOME=$srcdir/nDPI-$_ndpiver
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=$pkgdir/usr --datadir=/usr/share
  make geoip
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make install

  mv $pkgdir/usr/{man,share/}
  mkdir -p $pkgdir/usr/lib/systemd/system
  install -m644 "$srcdir/$pkgname@.service" "$pkgdir/usr/lib/systemd/system"

}

post_install() {

    echo -e "${bold_green}==>${color_reset} ${bold_white}Enable/start your redis.service befose use ntopng!${color_reset}"
    echo -e " ${bold_blue}#${color_reset} ${bold_white}systemctl ${bold_underline_white}enable${bold_white} redis${color_reset}"
    echo -e " ${bold_blue}#${color_reset} ${bold_white}systemctl ${bold_underline_white}start${bold_white} redis${color_reset}"
    echo -e ""
    echo -e "${bold_green}==>${color_reset} ${bold_white}After enable/start ntopng@ service!${color_reset}"
    echo -e " ${bold_blue}#${color_reset} ${bold_white}systemctl ${bold_underline_white}enable${bold_white} ntopng@<interface>${color_reset}"
    echo -e " ${bold_blue}#${color_reset} ${bold_white}systemctl ${bold_underline_white}start${bold_white} ntopng@<interface>${color_reset}"
    echo -e ""
    echo -e "Now open ${bold_underline_white}http://localhost:3000/${color_reset} on your favourite browser."
    echo -e " ${bold_blue}->${color_reset} ${bold_white}More info at https://www.ntop.org/${color_reset}" 

}
