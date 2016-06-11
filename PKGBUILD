# $Id$
# Maintainer: Kerrick Staley <kerrick@kerrickstaley.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jeremy Newton (Mystro256) <alexjnewt@gmail.com>

pkgname=dolphin-emu-debugfast-git
pkgver=4.0.r9442.gb968a90
pkgver() {
  cd dolphin
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='A Gamecube / Wii / Triforce emulator, Git version with DebugFast'
arch=('x86_64')
url='http://dolphin-emu.org'
license=('GPL2')

makedepends=('cmake' 'git')
depends=('bluez-libs' 'enet' 'ffmpeg' 'libao' 'libevdev' 'miniupnpc'
         'portaudio' 'sfml' 'soundtouch' 'xdg-utils' 'wxgtk')
optdepends=('pulseaudio: PulseAudio backend')

options=('!emptydirs')

source=('git+https://github.com/dolphin-emu/dolphin.git')
md5sums=('SKIP')

prepare() {
  cd dolphin

  # Compatibility with miniupnpc 1.9.20150730, which requires a new ttl argument.
  sed 's/upnpDiscover(2000, nullptr, nullptr, 0, 0, \&upnperror)/upnpDiscover(2000, nullptr, nullptr, 0, 0, 2, \&upnperror)/' -i Source/Core/Core/NetPlayServer.cpp

  # Change "dolphin-emu" to "dolphin-emu-debugfast" in a bunch of files
  sed -ri 's/dolphin-emu/dolphin-emu-debugfast/g' \
    CMakeLists.txt \
    Source/Core/DolphinWX/CMakeLists.txt \
    Source/Core/DolphinWX/Info.plist.in \
    Data/dolphin-emu.desktop \
    Languages/{gettextize,po.props,po.rules}
  sed -ri '/^URL: /! s/dolphin-emu/dolphin-emu-debugfast/g' \
    Installer/dolphin-emu.spec

  # Change name in .desktop file
  sed -ri 's/Name=Dolphin Emulator/Name=DebugFast Dolphin Emulator/' Data/dolphin-emu.desktop

  # Turn on debug mode in .desktop file
  sed -ri 's/^Exec=.*/& -d/' Data/dolphin-emu.desktop

  # Add text "DebugFast" to icon
  _edit_svg

  # Move files so they don't conflict with regular dolphin-emu
  mv Data/dolphin-emu{,-debugfast}.desktop
  mv Data/dolphin-emu{,-debugfast}.svg
  mv Data/dolphin-emu{,-debugfast}.png
  mv Data/dolphin-emu{,-debugfast}.6
  mv Data/dolphin-emu{,-debugfast}-nogui.6
  mv Installer/dolphin-emu{,-debugfast}.spec
  mv Languages/po/dolphin-emu{,-debugfast}.pot
}

_edit_svg() {
  text_tag=$(cat <<'EOF'
<text x="1024" y="1536"
      font-size="240"
      font-family="Verdana"
      text-anchor="middle"
      font-weight="bold"
      fill="#E02020"
>DebugFast</text>
EOF
)
  text_tag_one_line="$(echo "$text_tag" | tr '\n' ' ')"
  sed -ri "s|</svg>|$text_tag_one_line\n&|" Data/dolphin-emu.svg
}

build() {
  cd dolphin

  mkdir -p build && cd build

  # -DFASTLOG='TRUE' enables DebugFast
  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_CXX_FLAGS='-fno-pie' \
    -DENABLE_LTO='TRUE' \
    -DENABLE_SDL='TRUE' \
    -DUSE_SHARED_ENET='TRUE' \
    -DFASTLOG='TRUE'
  make
}

package() {
  cd dolphin/build

  make DESTDIR="${pkgdir}" install
}
