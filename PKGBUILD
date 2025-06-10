# Contributor: Mr.Smith1974 < ... >
# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=vpinball
pkgver=10.8.1_3155_8054cc2
pkgrel=2
pkgdesc="An open source pinball table editor and simulator - BGFX standalone (binary) version"
arch=('x86_64')
url="https://github.com/vpinball/vpinball"
license=('GPL-3.0-or-later' 'LicenseRef-MAME')
depends=('python' 'glibc' 'gcc-libs' 'python-lxml' 'python-pillow' 'libxkbcommon' 'libx11' 'nasm' 'wayland' 'systemd-libs' 'mesa' 'zlib-ng' 'alsa-lib')
makedepends=('unzip' 'cmake' 'git' 'curl')
provides=('vpinball')
conflicts=('vpinball-git')
source=("https://github.com/vpinball/vpinball/releases/download/v10.8.1-3155-8054cc2/VPinballX_BGFX-10.8.1-3155-8054cc2-linux-x64-Release.zip"
	"vpinball.desktop"
	"visualpinball_screen1.jpg"
	"vpinball-launcher.sh")
sha256sums=('fae99ec876bd1bccb67e98e8a4cc1719948a11e95166e1ec97b9c9a43b58460c'
            '1fd5a1252bf2932416ec4d2b68f6a4060c87e996a3dfccaacf59b1b3326b5590'
            'ca5d4a89d1a137eba199ebd91463d3df7fe90fd47ff41c73d6f456d879ab5011'
            '3741acd5c8b82673fd287bb8a14ad4784a7312bcbc6351c7fbb737d0500ec299')
# Will not build with lto!!
options=('!lto')

build() {
  unzip -o "VPinballX_BGFX-10.8.1-3155-8054cc2-linux-x64-Release.zip"
}  # build

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/opt/vpinball/tables"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/doc/vpinball"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cd "${pkgdir}/opt/${pkgname}"
  tar -xf ${srcdir}/VPinballX*.tar.gz
  #
  chmod 775 "${pkgdir}/opt/vpinball/tables"
  #
  install -Dm 644 "${pkgdir}/opt/${pkgname}/docs/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv docs/* "${pkgdir}/usr/share/doc/vpinball/" 
  install -Dm 644 "${srcdir}/vpinball-launcher.sh"		"${pkgdir}/opt/vpinball/vpinball-launcher.sh"
  install -Dm 644 "${pkgdir}/opt/vpinball/assets/vpinball.png"  "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vpinball.png"
  install -Dm 644 "${srcdir}/vpinball.desktop"			"${pkgdir}/usr/share/applications/vpinball.desktop"
  install -Dm 644 "${srcdir}/visualpinball_screen1.jpg"		"${pkgdir}/usr/share/pixmaps/visualpinball_screen1.jpg"
  ln -s "/opt/vpinball/VPinballX_BGFX" 				"${pkgdir}/usr/bin/VPinballX_BGFX"
}  # package

post_install() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

post_remove() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}
