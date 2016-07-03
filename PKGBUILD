# Maintainer: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=2.4
pkgrel=5
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL3')
depends=('redis' 'geoip')
# Add ndpi as dep once issues is fixed with 404 on source
makedepends=('glib2' 'automake' 'libtool' 'geoip' 'libpcap' 'wget' 'libxml2' 'sqlite' 'curl' 'libmariadbclient')
source=("http://downloads.sourceforge.net/project/ntop/ntopng/ntopng-2.4-stable.tar.gz" "ntopng@.service" "ntopng-2.4-stable.tar.gz.sig" "ntopng@.service.sig")

sha512sums=('515dd7889ae3aaf2482371bb2c55ab7300cf4207fe07f37029b7529bfb710379c19a54f58cf6df87e42454c0c99d15291af334adff676252301d9edd0acf3c7a'
            'b3d9a2032cce91ee4faf81522a30a2877540b3fc7a0d43f8fe4f01c16efb0b8f6e73cfe26028b3a070296d7156abf511d3e11f93635ca2de8a4d67322b0ade60'
            'SKIP'
            'SKIP')

build() {
  cd ntopng-2.4-stable
  ./autogen.sh
  ./configure --prefix=$pkgdir/usr
  make geoip
  make
}

package() {
  cd ntopng-2.4-stable

  make install

  mv $pkgdir/usr/man $pkgdir/usr/share/
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
