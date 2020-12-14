#Maintainer: Larzid <juanitocampamocha@gmail.com>
pkgname=sotw
pkgver=1.2.5
pkgrel=1
epoch=
pkgdesc="Shadow Of The Wyrm is a single player, traditional roguelike by Julian Day."
arch=('x86_64')
url="http://www.shadowofthewyrm.org/"
license=('MIT')
groups=()
depends=('sdl2' 'sdl2_image' 'xerces-c' 'zlib' 'ncurses' 'lua51' 'boost' 'gtest')
makedepends=('premake' 'git')
checkdepends=()
provides=(sotw)
conflicts=(sotw-dev)
replaces=()
backup=()
options=()
changelog=
source=('git+https://github.com/prolog/shadow-of-the-wyrm.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd shadow-of-the-wyrm
	git checkout master
	sed -i -e 's|\"lua copy_libs.lua\"|_OPTIONS["lua_link"].." copy_libs.lua"|g' premake4.lua
	premake5 --lua_include=/usr/include/lua5.1 --lua_link=lua5.1 gmake
	make config=release
	#make config=debug
}

package() {
  echo "#!/bin/sh" > ${srcdir}/shadow-of-the-wyrm/sotw.sh
  echo "cd /usr/share/shadow-of-the-wyrm" >> ${srcdir}/shadow-of-the-wyrm/sotw.sh
  echo "./ShadowOfTheWyrm" >> ${srcdir}/shadow-of-the-wyrm/sotw.sh
  chmod +x ${srcdir}/shadow-of-the-wyrm/sotw.sh
  install -D -m644 ${srcdir}/shadow-of-the-wyrm/LICENSE "${pkgdir}/usr/share/licenses/shadow-of-the-wyrm/LICENSE"
  install -d -m777 ${srcdir}/shadow-of-the-wyrm "${pkgdir}/usr/share/shadow-of-the-wyrm"
  install -D ${srcdir}/shadow-of-the-wyrm/bin/Release/ShadowOfTheWyrm "${pkgdir}/usr/share/shadow-of-the-wyrm/ShadowOfTheWyrm"
  install -D ${srcdir}/shadow-of-the-wyrm/shadowofthewyrmtext_blank.ini "${pkgdir}/usr/share/shadow-of-the-wyrm/shadowofthewyrmtext_blank.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/shadowofthewyrmtext_en.ini "${pkgdir}/usr/share/shadow-of-the-wyrm/shadowofthewyrmtext_en.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/swyrm.ini "${pkgdir}/usr/share/shadow-of-the-wyrm/swyrm.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/version_info.txt "${pkgdir}/usr/share/shadow-of-the-wyrm/version_info.txt"
  cp -R ${srcdir}/shadow-of-the-wyrm/assets ${pkgdir}/usr/share/shadow-of-the-wyrm/assets
  cp -R ${srcdir}/shadow-of-the-wyrm/data ${pkgdir}/usr/share/shadow-of-the-wyrm/data
  cp -R ${srcdir}/shadow-of-the-wyrm/docs ${pkgdir}/usr/share/shadow-of-the-wyrm/docs
  cp -R ${srcdir}/shadow-of-the-wyrm/licenses ${pkgdir}/usr/share/shadow-of-the-wyrm/licenses
  cp -R ${srcdir}/shadow-of-the-wyrm/scripts ${pkgdir}/usr/share/shadow-of-the-wyrm/scripts
  cp -R ${srcdir}/shadow-of-the-wyrm/texts ${pkgdir}/usr/share/shadow-of-the-wyrm/texts
  install -D ${srcdir}/shadow-of-the-wyrm/sotw.sh ${pkgdir}/usr/bin/sotw
}
