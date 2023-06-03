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
pkgver=5.0.r19368.gdadbeb4bae
pkgrel=1
pkgdesc='A Gamecube / Wii emulator - monthly beta release'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL2')
depends=(
  'alsa-lib' 'bluez-libs' 'cubeb' 'enet' 'hidapi' 'libevdev' 'libgl' 'libmgba-git'
  'libpulse' 'libspng' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls' 'mbedtls2' 'minizip-ng'
  'pugixml' 'qt6-base' 'sfml' 'zlib'
  'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so' 'libfmt.so'
  'libminiupnpc.so' 'libswscale.so' 'libudev.so' 'libusb-1.0.so'
)
makedepends=('cmake' 'git' 'ninja' 'python')
optdepends=('pulseaudio: PulseAudio backend')
source=("$_projectname::git+https://github.com/dolphin-emu/dolphin.git#commit=dadbeb4bae7e7fa23af2b46e0add4143094dc107" "https://github.com/dolphin-emu/dolphin/commit/4d61ec1f4f5ae87f49ec85f30a3167d56c9706a4.patch")
sha256sums=('SKIP')

prepare() {
  # init submodules
  cd $_projectname
  patch --forward --strip=1 --input="../4d61ec1f4f5ae87f49ec85f30a3167d56c9706a4.patch"
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

sha256sums=('SKIP'
            'eacce3ae34270f8d1b4a9cac9f37fd19506613653d663f07b57695680c3b7828')
