# Maintainer: ThaChillera ThaChillera@protonmail.com

# Shamelessly copied from:
# dolphin-emu-git by Daniel Peukert <daniel@peukert.cc>

# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>

# latest version obtained from this API endpoint: https://dolphin-emu.org/update/latest/beta/
_projectname="dolphin-emu"
_mainpkgname="$_projectname-beta"
pkgbase="$_mainpkgname-git"
pkgname=("$_mainpkgname-git")
pkgver=5.0.r19870.g032c77b462
pkgrel=1
pkgdesc='A Gamecube / Wii emulator - monthly beta release'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL2')
depends=(
  'alsa-lib' 'bluez-libs' 'cubeb' 'enet' 'hidapi' 'libevdev' 'libgl' 'libpulse'
  'libspng' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls2' 'minizip-ng' 'pugixml'
  'qt6-base' 'qt6-svg' 'sfml' 'zlib-ng'
  'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so' 'libfmt.so'
  'libminiupnpc.so' 'libsfml-network.so' 'libsfml-system.so' 'libswscale.so'
  'libudev.so' 'libusb-1.0.so'
)
makedepends=('cmake' 'git' 'ninja' 'python')
optdepends=('pulseaudio: PulseAudio backend')
source=("$_projectname::git+https://github.com/dolphin-emu/dolphin.git#commit=032c77b462a220016f23c5079e71bb23e0ad2adf" "minizip-ng.diff")
sha256sums=('SKIP' 'fe51c280d87665ab91d4921bd1fb77a1eaa36ef201e32b470fde5f8d06406cc7')

prepare() {
  # init submodules
  cd $_projectname

  # Fix minizip-ng name for Arch
	patch --forward --input="../minizip-ng.diff"

  git submodule update --init --recursive

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
    -DDISTRIBUTOR='aur.archlinux.org/packages/dolphin-emu-beta-git' \
    -DENABLE_AUTOUPDATE=OFF \
    -DENABLE_NOGUI=OFF \
    -DUSE_SHARED_ENET=ON \
    -DUSE_SYSTEM_FMT=OFF
  cmake --build 'build/'
}

package_dolphin-emu-beta-git() {
  provides=("$_projectname")
  conflicts=("$_projectname")

  cd $_projectname
  DESTDIR="$pkgdir" cmake --install 'build/'
  install -Dm644 Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/

	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib/libdiscord-rpc.a"
  rm -rf "$pkgdir/usr/share/man/man6/dolphin-emu-nogui*"
}
