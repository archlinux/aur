# Maintainer: wchurch58 

pkgname=dolphin-emu-fresh
pkgver=5.0
pkgrel=1
pkgdesc='A GameCube / Wii / Triforce emulator'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL')
depends=('alsa-lib' 'bluez-libs' 'cairo' 'enet' 'gcc-libs' 'gdk-pixbuf2'
         'glib2' 'glibc' 'gtk2' 'hidapi' 'libevdev' 'libgl' 'libpng' 'libpulse'
         'libsm' 'libx11' 'libxi' 'libxrandr' 'libxxf86vm' 'lzo' 'mbedtls'
         'miniupnpc' 'pango' 'sfml' 'zlib' 'pulseaudio' 'ffmpeg' 'pugixml'
	'bluez' 'bluez-utils-compat' 'bluez-firmware' 'bluez-plugins'
	'bluez-libs' 'bluez-qt' 'bluez-tools' 'curl' 'xorg-xinput'
         'libeudev' 'libusb' 'libgusb' 'libusb-compat' 'lib32-libusb' 'libtiger'
	'pangomm' 'pangox-compat' 'libglvnd' 'sndio' 'alsa-plugins' 'alsa-firmware'
	'alsa-utils' 'alsa-lib' 'pulseaudio-alsa' 'alsa-oss' 'vulkan-headers' 'vulkan-validation-layers'
	'vulkan-trace' 'vulkan-extra-layers' 'vulkan-icd-loader' 'spirv-tools')

makedepends=('cmake' 'git' 'qt5-base' 'pango' 'fakeroot')
source=('dolphin::git+https://github.com/dolphin-emu/dolphin.git')
sha256sums=('SKIP')
conflicts=('dolphin-emu')
provides=('dolphin-emu')

build() {
#git clone https://github.com/dolphin-emu/dolphin.git
mkdir -p dolphin/build
cd dolphin/build

cmake .. \
	-DOpenGL_GL_PREFERENCE=GLVND \
	-DUSE_X11=1 \
	-DUSE_EGL=1 \
	-DUSE_SHARED_ENET=TRUE \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DENABLE_QT2=TRUE \
	-DCMAKE_BUILD_TYPE=Release

make -j1
}

package() {
cd dolphin/build

make DESTDIR="${pkgdir}" install
install -Dm 644 ../Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/

mkdir -p ${pkgdir}/usr/lib
cp -R ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib
rm -rf ${pkgdir}/usr/lib64

}


# vim: ts=2 sw=2 et:
