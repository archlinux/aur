# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori-no-zeitgeist
_pkgname=midori
pkgver=0.5.11
pkgrel=1
pkgdesc='Lightweight web browser (GTK3) without the zeitgeist dependency'
arch=('x86_64' 'i686' 'armv7h')
url='http://www.midori-browser.org/'
license=('LGPL2.1')
install='midori.install'
conflicts=('midori')
provides=('midori')
depends=('webkit2gtk' 'libxss' 'gcr')
makedepends=('bzr' 'intltool' 'vala' 'cmake' 'ninja')
optdepends=('gst-plugins-base: HTML5 OGG videos support'
  'gst-plugins-good: HTML5 H264 and WebM videos support'
  'gst-libav: HTML5 H264 videos support'
  'aria2: download utility')
options=('!emptydirs')
source=("http://www.midori-browser.org/downloads/${_pkgname}_${pkgver}_all_.tar.bz2")
sha256sums=('96191a96be71144ae848a409fae5a1d6d52a00e583f33122081f47ead9c49c3d')

prepare() {
  cd "$_pkgname-$pkgver"

  # The latest release of vala is a bit stricter than the previous one
  sed 's/protected Tally/public Tally/g' -i midori/midori-notebook.vala
  sed 's/%d other files/%u other files/g' -i extensions/transfers.vala
  for f in transfers adblock/widgets apps history-list notes; do
    sed 's/.remove (iter/.remove (ref iter/g' -i "extensions/$f.vala"
  done
}

build() {
  cd "$_pkgname-$pkgver"

  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DHALF_BRO_INCOM_WEBKIT2=ON \
    -DCMAKE_C_FLAGS="$CFLAGS -w" \
    -DUSE_ZEITGEIST=0 \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C "$_pkgname-$pkgver/build" install
}

# getver: -u 2 midori-browser.org/download/source
# vim:set ts=2 sw=2 et:
