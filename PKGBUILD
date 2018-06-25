# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori
pkgver=0.5.11
pkgrel=8
pkgdesc='Lightweight web browser'
arch=('x86_64')
url='http://midori-browser.org/'
license=('LGPL')
provides=('midori')
replaces=('midori-gtk3')
depends=('aria2' 'gcr' 'libxss' 'webkit2gtk' 'zeitgeist')
makedepends=('bzr' 'cmake' 'intltool' 'ninja' 'vala')
optdepends=('gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support')
options=('!emptydirs')
source=("http://www.midori-browser.org/downloads/${pkgname}_${pkgver}_all_.tar.bz2")
sha256sums=('96191a96be71144ae848a409fae5a1d6d52a00e583f33122081f47ead9c49c3d')

# NOTE: Set GTK_CSD=1 for enabling client side decorations for Midori

prepare() {
  cd "$pkgname-$pkgver"

  sed 's/protected Tally/public Tally/g' -i midori/midori-notebook.vala
  sed 's/%d other files/%u other files/g' -i extensions/transfers.vala
  for f in transfers adblock/widgets apps history-list notes; do
      sed 's,.remove (iter,.remove (ref iter,g' -i "extensions/$f.vala"
  done
}

build() {
  mkdir -p build
  cd build
  cmake "../$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DHALF_BRO_INCOM_WEBKIT2=ON \
    -DCMAKE_C_FLAGS="$CFLAGS -w" \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# getver: -u 2 midori-browser.org/download/source
# vim: ts=2 sw=2 et:
