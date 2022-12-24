# Maintainer: ThaChillera ThaChillera@protonmail.com

# Shamelessly copied from:
# dolphin-emu-git by Daniel Peukert <daniel@peukert.cc>

# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>

# latest version obtained from this API endpoint: https://dolphin-emu.org/update/latest/beta/
_projectname="dolphin-emu"
_mainpkgname="$_projectname-beta"
_noguipkgname="$_projectname-beta-nogui"
pkgbase="$_mainpkgname-git"
pkgname=("$_mainpkgname-git" "$_noguipkgname-git")
pkgver=5.0.r17995.g8bad821019
pkgrel=1
pkgdesc='A Gamecube / Wii emulator - monthly beta release'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL2')
depends=(
  'alsa-lib' 'bluez-libs' 'enet' 'hidapi' 'libevdev' 'libgl' 'libpng'
  'libpulse' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls' 'pugixml' 'qt5-base'
  'sfml' 'zlib'
  'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so'
  'libminiupnpc.so' 'libswscale.so' 'libudev.so' 'libusb-1.0.so'
)
makedepends=('cmake' 'git' 'ninja' 'python')
optdepends=('pulseaudio: PulseAudio backend')
source=("$_projectname::git+https://github.com/dolphin-emu/dolphin.git#commit=8bad821019721b9b72701b495da95656ace5fea5")
sha256sums=('SKIP')

prepare() {
  # init submodules
  cd $_projectname
  git submodule update --init

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

pkgver() {
  cd $_projectname

  git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
  cd $_projectname
  cmake -S '.' -B 'build/' -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DDISTRIBUTOR='aur.archlinux.org' \
    -DUSE_SHARED_ENET=ON
  cmake --build 'build/'
}

package_dolphin-emu-beta-git() {
  provides=("$_projectname")
  conflicts=("$_projectname")

  cd $_projectname
  DESTDIR="$pkgdir" cmake --install 'build/'
  install -Dm644 Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/

  rm -rf "$pkgdir/usr/bin/dolphin-emu-nogui"
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib/libdiscord-rpc.a"
	rm -rf "$pkgdir/usr/share/man/man6/$_noguipkgname.6"
}

package_dolphin-emu-beta-nogui-git() {
  depends=("$pkgbase")
  provides=("$_projectname-cli")
  conflicts=("$_projectname-cli")
  
  cd $_projectname
  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 build/Binaries/dolphin-emu-nogui "${pkgdir}"/usr/bin/dolphin-emu-cli
}
