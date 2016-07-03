# Maintainer: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=2.4
pkgrel=4
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL3')
depends=('redis' 'geoip')
# Add ndpi as dep once issues is fixed with 404 on source
makedepends=('glib2' 'automake' 'libtool' 'geoip' 'libpcap' 'wget' 'libxml2' 'sqlite' 'curl' 'libmariadbclient')
source=("http://downloads.sourceforge.net/project/ntop/ntopng/ntopng-2.4-stable.tar.gz" "ntopng@.service" "ntopng-2.4-stable.tar.gz.sig" "ntopng@.service.sig")

sha512sums=('515dd7889ae3aaf2482371bb2c55ab7300cf4207fe07f37029b7529bfb710379c19a54f58cf6df87e42454c0c99d15291af334adff676252301d9edd0acf3c7a'
            'cb83d75e867c28bfaa6d5a6bea60660d75fe35c96bb3c000c3ce947c1e34352914f0e5231e07b875cb4c613071a5d1988cc582410898704b5e065575d67c05b4'
            'SKIP'
            'SKIP')

build() {
  cd ntopng-2.4-stable
  ./autogen.sh && ./configure 
  make geoip
  make
}

package() {
  cd ntopng-2.4-stable

#  make install
  make DESTDIR="$pkgdir/" install

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
