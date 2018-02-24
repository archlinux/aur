# Maintainer: Barry Smith <brrtsm at gmmal dot com>
# Contributor: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click> Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=3.2
_ndpiver=2.2
pkgrel=1
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL3')
depends=('redis' 'geoip' 'libmariadbclient' 'libpcap' 'sqlite')
makedepends=('glib2' 'automake' 'libtool' 'wget' 'curl' 'libxml2')
source=("https://github.com/ntop/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/ntop/nDPI/archive/$_ndpiver.tar.gz"
        "$pkgname@.service"
        "luajit.patch")

sha512sums=('75c12d30e9253b6a33c8f464a40b5dc27ba8b9d623a73ba8fb6a02a8fbbd4091f30ab10f83d9538f1acc479dcb91ae66d3eba7e2f52187f1398c73336f4aa1b6'
'ee1e0a1cc87a3971408877bd5d3154f6bd5d4ddcd2437c8e03e5d8a5093da2b1cbfefad1e28e77145af4286eecbd341ef90f94aa5c7f36a98e3625e9948e96d6'
'b3d9a2032cce91ee4faf81522a30a2877540b3fc7a0d43f8fe4f01c16efb0b8f6e73cfe26028b3a070296d7156abf511d3e11f93635ca2de8a4d67322b0ade60'
'ca3ddd814c2be339ed58a61e95002be3d03b1d425b3fb1cdc3b20c7f724038f9d18444537d564bb39543434bde3a8a79daf856837b75d3d6ea48447cd8796c64')

build() {
  patch $srcdir/$pkgname-$pkgver/Makefile.in luajit.patch
  cd $srcdir/$pkgname-$pkgver
  ln -sf ../nDPI-$_ndpiver nDPI
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
