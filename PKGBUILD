#Maintainer: Larzid <juanitocampamocha@gmail.com>
pkgname=sotw-dev
pkgver=development
pkgrel=9
epoch=
pkgdesc="Shadow Of The Wyrm by Julian Day - Development branch."
arch=('x86_64')
url="http://www.shadowofthewyrm.org/"
license=('MIT')
groups=()
depends=('sdl2' 'sdl2_mixer' 'sdl2_image' 'xerces-c' 'zlib' 'ncurses' 'lua51' 'boost' 'gtest')
makedepends=('premake' 'git')
checkdepends=()
provides=(sotw)
conflicts=(sotw)
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
 	git checkout develop
	# fix premake file to work with premake5
	sed -i '127s/.*/filter "configurations:Debug"/' premake4.lua
	sed -i '133s/.*/filter "configurations:CursesDebug"/' premake4.lua
	sed -i '139s/.*/filter "configurations:Release"/' premake4.lua
	sed -i '159s/.*/filter "configurations:CursesRelease"/' premake4.lua
	premake5 --lua_include=/usr/include/lua5.1 --lua_link=lua5.1 gmake
	make config=release
	#make config=debug 
}

package() {
  echo "cd /usr/share/sotw" > ${srcdir}/shadow-of-the-wyrm/sotw.sh
  echo "./sotw" >> ${srcdir}/shadow-of-the-wyrm/sotw.sh
  chmod +x ${srcdir}/shadow-of-the-wyrm/sotw.sh
  install -D -m644 ${srcdir}/shadow-of-the-wyrm/LICENSE "${pkgdir}/usr/share/licenses/sotw/LICENSE"
  install -d -m777 ${srcdir}/shadow-of-the-wyrm/sotw "${pkgdir}/usr/share/sotw"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/sotw "${pkgdir}/usr/share/sotw/sotw"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/howdoi.txt "${pkgdir}/usr/share/sotw/howdoi.txt"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/LICENSE "${pkgdir}/usr/share/sotw/LICENSE"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/README.md "${pkgdir}/usr/share/sotw/README.md"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/shadowofthewyrmtext_blank.ini "${pkgdir}/usr/share/sotw/shadowofthewyrmtext_blank.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/shadowofthewyrmtext_en.ini "${pkgdir}/usr/share/sotw/shadowofthewyrmtext_en.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/swyrm.ini "${pkgdir}/usr/share/sotw/swyrm.ini"
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/assets ${pkgdir}/usr/share/sotw/assets
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/data ${pkgdir}/usr/share/sotw/data
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/docs ${pkgdir}/usr/share/sotw/docs
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/licenses ${pkgdir}/usr/share/sotw/licenses
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/logs ${pkgdir}/usr/share/sotw/logs
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/scripts ${pkgdir}/usr/share/sotw/scripts
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/texts ${pkgdir}/usr/share/sotw/texts
  install -D ${srcdir}/shadow-of-the-wyrm/sotw.sh ${pkgdir}/usr/bin/sotw
}
