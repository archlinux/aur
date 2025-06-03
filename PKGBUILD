# Maintainer: Jay <ermywhadc@relay.firefox.com>

pkgname=conkyluanv-autoscale-fixed
pkgver=1.22.1
pkgrel=1
pkgdesc="Lightweight system monitor for X with independent scaling of upload and download speed graphs"
arch=('x86_64' 'i686')
url="https://github.com/Jayhub-ai/conkyluanv-autoscale-fixed"
license=('GPL3')
depends=('alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 
         'imlib2' 'lua' 'librsvg' 'libxinerama' 'libxnvctrl' 'libpulse' 'hicolor-icon-theme'
         'gcc-libs' 'glibc' 'fontconfig' 'libx11' 'libxext' 'libxfixes' 'ncurses' 'systemd-libs')
makedepends=('cmake' 'git' 'man-db' 'docbook2x' 'docbook-xsl' 'pandoc' 'python-yaml')
optdepends=('nvidia: for NVIDIA GPU monitoring'
            'audacious: for Audacious music player monitoring'
            'pulseaudio: for PulseAudio volume monitoring'
            'wireless_tools: for wireless connection monitoring'
            'hddtemp: for disk temperature monitoring'
            'mpd: for MPD music player monitoring'
            'curl: for weather and online data monitoring'
            'lua-cairo: for advanced drawing with Cairo'
            'lua-imlib2: for image manipulation and rendering'
            'apcupsd: for UPS monitoring'
            'xmms2: for XMMS2 music player monitoring'
            'cmus: for CMUS music player monitoring')
provides=('conky')
conflicts=('conky')
replaces=('conky' 'torsmo')
source=("git+https://github.com/Jayhub-ai/conkyluanv-autoscale-fixed.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/conkyluanv-autoscale-fixed"
  
  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D RELEASE=true \
    -D BUILD_CURL=ON \
    -D BUILD_XDBE=ON \
    -D BUILD_IMLIB2=ON \
    -D BUILD_RSS=OFF \
    -D BUILD_WLAN=ON \
    -D BUILD_NVIDIA=ON \
    -D BUILD_WEATHER_METAR=OFF \
    -D BUILD_PULSEAUDIO=ON \
    -D BUILD_LUA_CAIRO=ON \
    -D BUILD_LUA_IMLIB2=ON \
    -D BUILD_APCUPSD=ON \
    -D BUILD_MPD=ON \
    -D BUILD_HDDTEMP=ON \
    -D BUILD_XMMS2=ON \
    -D BUILD_CMUS=ON \
    -D BUILD_IPV6=ON \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -B build

  cmake --build build
}

package() {
  cd "$srcdir/conkyluanv-autoscale-fixed"
  
  DESTDIR="$pkgdir" cmake --install build
  
  # Install documentation
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install example configuration files
  install -Dm644 data/conky.conf "$pkgdir/usr/share/doc/$pkgname/examples/conky.conf"
  install -Dm644 data/conky_no_x11.conf "$pkgdir/usr/share/doc/$pkgname/examples/conky_no_x11.conf"
} 
