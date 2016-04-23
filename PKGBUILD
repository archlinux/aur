# Maintainer: Fernando Manfredi <contact at acidhub.click>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>

pkgname=ntopng
pkgver=2.2
pkgrel=2
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL3')
depends=('redis' 'geoip')
makedepends=('glib2' 'automake' 'libtool' 'geoip' 'libpcap' 'wget' 'libxml2' 'sqlite' 'curl' 'libmariadbclient')
source=("http://sourceforge.net/projects/ntop/files/$pkgname/$pkgname-$pkgver.tar.gz"
        ntopng@.service)

sha256sums=('4fccfc9e9f333addcd3c957b4520c471117bc2df5655d6eabf328c7385fb255e'
            '034d4fa2a6616a6240edc74e278b96e45730e7acc12d60a7b4458b04906c127b')

build() {
  cd "$srcdir/ntopng-$pkgver"
  ./autogen.sh && ./configure --prefix=$pkgdir/usr
  make geoip
  make
}

package() {
  cd "$srcdir/ntopng-$pkgver"

  make DESTDIR=$pkgdir install

  mkdir -p $pkgdir/usr/lib/systemd/system
  install -m644 "$srcdir/ntopng@.service" "$pkgdir/usr/lib/systemd/system"

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
