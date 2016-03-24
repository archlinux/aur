#original package by:
# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200

pkgname=corsix-th-git
pkgver=0.50.r228.ge8bb00e
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital, git version'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake')
depends=('lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg' 'timidity-freepats')
install=corsix-th.install
source=("git+https://github.com/CorsixTH/CorsixTH.git"
	"CorsixTH.desktop"
        "corsix-th.sh")

sha256sums=('SKIP'
	    '71f882fc453f3df2ebda089ab9994f7698f212c98686098944743aedc1b882ea'
	    '3614197a30498774fff4055ee54d82a812a8b88eba353b70c3288a09ff700158')

pkgver() {
  cd "CorsixTH"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd CorsixTH

  cmake -DCMAKE_BUILD_TYPE=Release -Wno-dev \
        -DLUA_PROGRAM_PATH=/usr/bin/lua -DLUA_INCLUDE_DIR=/usr/include -DLUA_LIBRARY=/usr/lib/liblua.so \
        -DCMAKE_INSTALL_PREFIX=/usr/share/ .
  cd CorsixTH
  make
}

package() {
  make -C CorsixTH/CorsixTH DESTDIR="$pkgdir/" install
  # launcher
  install -Dm0755 corsix-th.sh "$pkgdir"/usr/bin/CorsixTH
  # license
  install -Dm0644 CorsixTH/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  # .desktop integration
  install -Dm0644 CorsixTH.desktop "$pkgdir"/usr/share/applications/CorsixTH.desktop
}
