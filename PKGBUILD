# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: hybraries <macwolf@archlinux.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Navi <navitwo.at.gmail.dot.com>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Andrew Mcclain <tananod@mega.zik.dj>

pkgname=midori-bzr
pkgver=r7166
pkgrel=1
pkgdesc='Lightweight web browser based on WebKit and GTK3 (development version)'
arch=('x86_64' 'i686')
url='http://www.twotoasts.de/index.php/midori/'
license=('LGPL')
depends=('gcr' 'libxss' 'zeitgeist' 'webkit2gtk')
makedepends=('bzr' 'pkg-config' 'python2' 'libxml2' 'gtk3' 'intltool'
             'python2-docutils' 'libsoup' 'vala' 'librsvg' 'cmake')
optdepends=('aria2: download utility'
            'steadyflow: download manager'
            'gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support')
provides=('midori')
conflicts=('midori' 'midori-gtk2-git' 'midori-git' 'midori-gtk2-bzr')
options=('!emptydirs' '!makeflags')
install='midori.install'
source=("midori::bzr+https://code.launchpad.net/~midori/midori/trunk")
md5sums=('SKIP')

pkgver() {
  cd midori
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd midori

  # The latest release of vala is a bit stricter than the previous one
  sed 's/protected Tally/public Tally/g' -i midori/midori-notebook.vala
  sed 's/%d other files/%u other files/g' -i extensions/transfers.vala
  for f in transfers adblock/widgets apps history-list notes; do
      sed 's/.remove (iter/.remove (ref iter/g' -i "extensions/$f.vala"
  done
}

build() {
  cd midori
  [[ -d build ]] && rm -rf build
  mkdir -p build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DHALF_BRO_INCOM_WEBKIT2=ON \
    -DUSE_GTK3=1
  make
}

package() {
  cd midori/build
  DESTDIR="$pkgdir" make install
}
