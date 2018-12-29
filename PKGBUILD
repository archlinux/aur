# Maintainer: Barry Smith <brrtsm at gmmal dot com>
# Contributor: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click> Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=3.8
_ndpiver=2.6
pkgrel=2
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL3')
depends=('redis' 'geoip' 'libmariadbclient' 'libpcap' 'sqlite' 'libmaxminddb')
makedepends=('glib2' 'automake' 'libtool' 'wget' 'curl' 'libxml2')
install=install.sh
source=("https://github.com/ntop/$pkgname/archive/$pkgver.tar.gz"
	"https://github.com/ntop/nDPI/archive/$_ndpiver.tar.gz"
	"$pkgname@.service" )

sha512sums=('2236f9931fc606e4d0a6da379c480a48bacd441cf199a310ea690a03d74d08f369825ea02e3c13828a10f716a5531d4e6774876f253ab348a52bcf8bd8d5107f'
'5b82786741c3e160a7519f800a52802a39dad198a89fa61fbf45beffeab911c2c25bec4319c7f93011d0cacb6b734ded8637abc0ae3cbd7dd3686a6e2ebb78a2'
'b3d9a2032cce91ee4faf81522a30a2877540b3fc7a0d43f8fe4f01c16efb0b8f6e73cfe26028b3a070296d7156abf511d3e11f93635ca2de8a4d67322b0ade60')

build() {
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
