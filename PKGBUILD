# Maintainer: aisuneko icecat <iceneko@protonmail.ch>
pkgname=gaw3
pkgver=20250128
pkgrel=1
pkgdesc="Gtk analog waveform viewer - tool for viewing analog data, such as the output of Spice simulations"
arch=('i686' 'x86_64')
url="http://www.rvq.fr/linux/gaw.php"
license=('GPL')
depends=('gtk3')
optdepends=('alsa-lib')
provides=('gaw')
conflicts=('gaw')

_file="${pkgname}-${pkgver}.tar.gz"
_html=$(curl -s "https://www.rvq.fr/php/ndl.php?id=${_file}" | tr '\n' ' ')
_form=$(grep -oP "<td>${_file}</td>.*?<\/form>" <<< "$_html")
_act_path=$(grep -oP 'action="\K[^"]+' <<< "$_form")
_act="https://www.rvq.fr/${_act_path#/}"
_args=$(grep -oP '<input[^>]+type="hidden"[^>]+>' <<< "$_form" | \
        sed -nE 's/.*name="([^"]+)".*value="([^"]+)".*/-F \1=\2/p' | \
        tr '\n' ' ')
DLAGENTS=("https::/usr/bin/curl -sC - $_args -o %o %u")

source=("${_file}::${_act}")
sha256sums=('9791d3f9b55b60dafa799d918a171d47a6164377ea5214749c7854f27d7990dc')

build() {
  cd ${pkgname}-$pkgver
  export CFLAGS+=" -std=gnu17"
  ./configure --prefix=/usr
  make
}


package() {
  cd ${pkgname}-$pkgver
  make DESTDIR="$pkgdir/" install
}

# will throw a "libfakeroot internal error: payload not recognized!"... seems to be harmless for now
