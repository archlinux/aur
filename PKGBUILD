# Contributor: Mr.Smith1974 < ... >
# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=vpinball-git
pkgver=r8607.f3618fd
pkgrel=1
pkgdesc="An open source pinball table editor and simulator - BGFX standalone version built with dependencies as defined by the developers"
arch=('x86_64')
url="https://github.com/vpinball/vpinball"
license=('GPL-3.0-or-later' 'LicenseRef-MAME')
depends=('python' 'glibc' 'gcc-libs' 'python-lxml' 'python-pillow' 'libxkbcommon' 'libx11' 'nasm' 'wayland' 'systemd-libs' 'mesa' 'zlib-ng' 'alsa-lib' 'zenity')
makedepends=('unzip' 'cmake' 'git' 'curl')
provides=('vpinball' 'vpinball-git')
conflicts=('vpinball')
source=("${pkgname}::git+https://github.com/vpinball/vpinball.git"
	"vpinball.desktop"
	"visualpinball_screen1.jpg"
	"vpinball-launcher.sh")
sha256sums=('SKIP'
            '1fd5a1252bf2932416ec4d2b68f6a4060c87e996a3dfccaacf59b1b3326b5590'
            'ca5d4a89d1a137eba199ebd91463d3df7fe90fd47ff41c73d6f456d879ab5011'
            '3741acd5c8b82673fd287bb8a14ad4784a7312bcbc6351c7fbb737d0500ec299')
# Will not build with lto!!
options=('!lto')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}  # pkgver

build() {
  cd "${srcdir}/${pkgname}"
  # This installs the necessary (version of) dependencies as the devs advise in their docs:
  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
  platforms/linux-x64/external.sh
  cp make/CMakeLists_bgfx-linux-x64.txt CMakeLists.txt
  cmake -DCMAKE_BUILD_TYPE=Release -B build
  cmake --build build
}  # build

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/opt/vpinball/tables"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/doc/vpinball"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  #
  cp -r build/* "${pkgdir}/opt/vpinball/"
  cp -r build/docs "${pkgdir}/usr/share/doc/vpinball/"
  chmod 775 "${pkgdir}/opt/vpinball/tables"
  #
  ln -s "/opt/vpinball/VPinballX_BGFX" 				"${pkgdir}/usr/bin/VPinballX_BGFX"
  install -Dm 644 "${srcdir}/vpinball-launcher.sh"		"${pkgdir}/opt/vpinball/vpinball-launcher.sh"
  install -Dm 644 "${pkgdir}/opt/vpinball/assets/vpinball.png"  "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vpinball.png"
  install -Dm 644 "${srcdir}/vpinball.desktop"			"${pkgdir}/usr/share/applications/vpinball.desktop"
  install -Dm 644 "${srcdir}/visualpinball_screen1.jpg"		"${pkgdir}/usr/share/pixmaps/visualpinball_screen1.jpg"
  install -Dm 644 "${srcdir}/${pkgname}/LICENSE"		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}  # package

post_install() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

post_remove() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}
