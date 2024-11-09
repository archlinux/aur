# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on Aaron Paden <aaronbpaden@gmail.com> PKGBUILD for pcem
pkgname=pcem-git
_pkgname=pcem
pkgver=17.r206.g803ccef1
pkgrel=1
pkgdesc="Emulator for various IBM PC computers and clones - development version"
url="http://pcem-emulator.co.uk/"
arch=('x86_64' 'i686')
license=('GPL-2.0-or-later')
depends=('wxgtk3' 'openal' 'sdl2' 'alsa-lib' 'libpcap')
makedepends=('git' 'ninja' 'meson' 'cmake')
conflicts=('pcem')
source=("git+https://github.com/sarah-walker-pcem/pcem.git"
        pcem.desktop
        pcem.png
        COPYING)
sha256sums=('SKIP'
            '8a76c42335a8d102b12a3c12fbcb5969106270a7a04f07f9eff6d9cf5b13b504'
            '3d241d236527fc01ee8a284d201b95d9ee937f18aa4a4b20a5534853381472e1'
            '61b65d8be67f0acb3a370ce0826c073b7c54a5c08b502ed6f7ffec94a300477f')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
  cd "${srcdir}/pcem"
  export WX_CONFIG=wx-config
  mkdir -p build
  cd build
  cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_NETWORKING=ON -DUSE_PCAP_NETWORKING=ON -DUSE_ALSA=ON -DPLUGIN_ENGINE=ON -DFORCE_X11=ON ..
  ninja
}

package() {
  cd "${srcdir}/pcem/build"
  DESTDIR="$pkgdir" ninja install
  # Based on pcem stable PKGBUILD
  install -Dm644 ../../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 ../../pcem.desktop "$pkgdir/usr/share/applications/pcem.desktop"
  install -Dm644 ../../pcem.png "$pkgdir/usr/share/pcem"
}

# vim:set ts=2 sw=2 et:

