# Maintainer: Jay <ermywhadc@relay.firefox.com>

pkgname=conkyluanv-autoscale-fixed
pkgver=1.22.1
pkgrel=2
pkgdesc="Lightweight system monitor for X with independent scaling of upload and download speed graphs"
arch=('x86_64' 'i686')
url="https://github.com/Jayhub-ai/conkyluanv-autoscale-fixed"
license=('GPL3')
depends=('alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 
         'imlib2' 'lua' 'librsvg' 'libxinerama' 'libxnvctrl' 'libpulse' 'hicolor-icon-theme'
         'gcc-libs' 'glibc' 'fontconfig' 'libx11' 'libxext' 'libxfixes' 'ncurses' 'systemd-libs'
         'wayland' 'pango')
makedepends=('cmake' 'git' 'man-db' 'docbook2x' 'docbook-xsl' 'pandoc' 'python-yaml'
             'wayland-protocols')
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
source=("git+https://github.com/Jayhub-ai/conkyluanv-autoscale-fixed.git" "xmms2-optional.patch")
sha256sums=('SKIP' 'SKIP')
install="${pkgname}.install"

prepare() {
  cd "$srcdir/conkyluanv-autoscale-fixed"
  
  # Apply the patch to make XMMS2 optional
  patch -p1 -i "$srcdir/xmms2-optional.patch"
}

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
    -D BUILD_CMUS=ON \
    -D BUILD_IPV6=ON \
    -D BUILD_WAYLAND=ON \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -B build

  cmake --build build
}

package() {
  cd "$srcdir/conkyluanv-autoscale-fixed"
  
  DESTDIR="$pkgdir" cmake --install build
  
  # Install documentation
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install example configuration files
  install -Dm644 data/conky.conf "$pkgdir/usr/share/doc/$pkgname/examples/conky.conf"
  install -Dm644 data/conky_no_x11.conf "$pkgdir/usr/share/doc/$pkgname/examples/conky_no_x11.conf"
  
  # Make sure the icon is installed properly
  install -Dm644 data/logo/conky-logomark-violet.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/conky-logomark-violet.svg"
  
  # Create a symlink with the simpler "conky" name
  ln -sf conky-logomark-violet.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/conky.svg"
  
  # Make sure the desktop file is installed properly and uses the correct icon name
  install -Dm644 data/conky.desktop "$pkgdir/usr/share/applications/conky.desktop"
  sed -i 's/Icon=conky-logomark-violet/Icon=conky/g' "$pkgdir/usr/share/applications/conky.desktop"
} 
