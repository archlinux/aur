# Contributor: Mr.Smith1974 < ... >
# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=vpinball-git
pkgver=r8029.6e386e1
pkgrel=1
pkgdesc="An open source pinball table editor and simulator (BGFX standalone version)"
arch=('x86_64')
url="https://github.com/vpinball/vpinball"
license=('GPL-3.0-or-later' 'LicenseRef-MAME')
depends=('python' 'glibc' 'vpinball-bgfx.cmake' 'gcc-libs' 'hidapi' 'sdl3-git' 'sdl3_mixer-git' 'sdl3_image-git' 'libserum-concentrate-git' 'sdl3_ttf-git' 'libpupdmd-git' 'freeimage-vpinball-git' 'libpinmame-git' 'libaltsound-git' 'libdmdutil-git' 'libdof-git' 'ffmpeg' 'python-lxml' 'python-pillow' 'unordered_dense-git' 'libinih' 'plog')
makedepends=('unzip' 'cmake' 'git' 'curl')
provides=('vpinball')
source=("${pkgname}::git+https://github.com/vpinball/vpinball.git"
	"vpinball.desktop"
	"visualpinball_screen1.jpg")
sha256sums=('SKIP'
            '4f094e7177ecde9afdafa29805635084aae5967560d33b46c8f95ef732898b93'
            'ca5d4a89d1a137eba199ebd91463d3df7fe90fd47ff41c73d6f456d879ab5011')
options=('!lto')
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}  # pkgver

build() {
  cd "${srcdir}/${pkgname}"
  cp make/CMakeLists_bgfx-linux-x64.txt CMakeLists.txt
  cmake -DCMAKE_BUILD_TYPE=Release -DPOST_BUILD_COPY_EXT_LIBS=FALSE -B build
  cmake --build build
}  # build

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/opt/vpinball"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/doc/vpinball"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  #
  cp -r build/tables build/flexdmd build/assets build/scripts build/plugins ${pkgdir}/opt/vpinball/
  cp -r build/docs "${pkgdir}/usr/share/doc/vpinball/"
  #
  ln -s "/opt/vpinball/VPinballX_BGFX" "${pkgdir}/usr/bin/VPinballX_BGFX"
  install -Dm 755 "${srcdir}/${pkgname}/build/VPinballX_BGFX"	"${pkgdir}/opt/vpinball/VPinballX_BGFX"
  install -Dm 644 "${srcdir}/vpinball.desktop"			"${pkgdir}/usr/share/applications/vpinball.desktop"
  install -Dm 644 "${srcdir}/visualpinball_screen1.jpg"		"${pkgdir}/usr/share/pixmaps/visualpinball_screen1.jpg"
  install -Dm 644 "${srcdir}/vpinball/LICENSE"			"${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}  # package
