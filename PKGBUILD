# Maintainer: Jonathan Hilger <joni.hilger@yahoo.de>
pkgname=vpinball
pkgver=r7991.e910e3c
pkgrel=1
pkgdesc="An open source pinball table editor and simulator (BGFX standalone version)"
arch=('x86_64')
url="https://github.com/vpinball/vpinball"
license=('GPLv3.0+' 'MAME')
depends=('python' 'bzip2' 'glibc' 'xz' 'libxcb' 'systemd-libs' 'zlib' 'alsa-lib' 'libdrm' 'gcc-libs')
makedepends=('unzip' 'alsa-lib' 'freeimage' 'cmake' 'git' 'gcc' 'pkgconf' 'autoconf' 'automake' 'libtool' 'nasm' 'bison' 'curl' 'systemd' 'libx11' 'mesa' 'libxext' 'zlib-ng' 'wayland' 'libxkbcommon')
#makedepends=('unzip' 'alsa-lib' 'freeimage' 'sdl2' 'sdl3' 'cmake' 'git' 'gcc' 'pkgconf' 'autoconf' 'automake' 'libtool' 'nasm' 'bison' 'curl' 'systemd' 'libx11' 'mesa' 'libxext' 'zlib-ng' 'wayland' 'libxkbcommon')
provides=('vpinball')
source=("${pkgname}::git+https://github.com/vpinball/vpinball.git"
	"vpinball.desktop"
	"visualpinball_screen1.jpg")
sha256sums=('SKIP'
            '4f094e7177ecde9afdafa29805635084aae5967560d33b46c8f95ef732898b93'
            'ca5d4a89d1a137eba199ebd91463d3df7fe90fd47ff41c73d6f456d879ab5011')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}  # pkgver

build() {
  cd "${srcdir}/${pkgname}"
  CFLAGS= platforms/linux-x64/external.sh
  cp make/CMakeLists_bgfx-linux-x64.txt CMakeLists.txt
  cmake -DCMAKE_BUILD_TYPE=Release -B build
  cmake --build build
}  # build

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/opt/vpinball"
  #
  cp -r ${srcdir}/${pkgname}/build/* ${pkgdir}/opt/vpinball/
  #
  ln -s "/opt/vpinball/VPinballX_BGFX" 				"${pkgdir}/usr/bin/VPinballX_BGFX"
  install -Dm 644 "${srcdir}/vpinball.desktop"			"${pkgdir}/usr/share/applications/vpinball.desktop"
  install -Dm 644 "${srcdir}/visualpinball_screen1.jpg"		"${pkgdir}/usr/share/pixmaps/visualpinball_screen1.jpg"
  install -Dm 644 "${srcdir}/vpinball/LICENSE"			"${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}  # package
