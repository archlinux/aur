#Maintainer: Larzid <juanitocampamocha@gmail.com>
pkgname=sotw
pkgver=1.8.4
pkgrel=4
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
install=post.install
changelog=
source=('git+https://github.com/prolog/shadow-of-the-wyrm.git' 'https://www.shadowofthewyrm.org/assets/ShadowOfTheWyrm-assets.zip')
noextract=()
md5sums=('SKIP' '52976400bb40914727117018c4038950')
validpgpkeys=()

build() {
 	cd shadow-of-the-wyrm
 	# Put the assets in the right folder
 	cp -R ../assets ./
	premake5 --lua_include=/usr/include/lua5.1 --lua_link=lua5.1 gmake
	make config=release
}

package() {
# Create launch script
    echo "#!/bin/bash" > ${srcdir}/shadow-of-the-wyrm/sotw.sh
    echo "cd /usr/share/sotw" >> ${srcdir}/shadow-of-the-wyrm/sotw.sh
    echo "./sotw" >> ${srcdir}/shadow-of-the-wyrm/sotw.sh
    chmod +x ${srcdir}/shadow-of-the-wyrm/sotw.sh

# Create the .desktop entry.
    echo "[Desktop Entry]
    Version=$pkgver
    Name=Shadow Of The Wyrm
    GenericName=SOTW
    Type=Application
    Comment=A single player, traditional roguelike by Julian Day.
    Icon=sotw_icon
    Exec=sotw
    Terminal=false
    SartupNotify=false
    Keywords=game;roguelike;
    Categories=Game;" > ${srcdir}/sotw.desktop

# Tweak game settings.
    # Setup log directory.
    sed -i '16s|.*|log_dir=/var/sotw/log|' ${srcdir}/shadow-of-the-wyrm/sotw/swyrm.ini
    mkdir ${pkgdir}/var
    mkdir ${pkgdir}/var/sotw
    mkdir ${pkgdir}/var/sotw/log
    chmod -R 777 ${pkgdir}/var/sotw
    # Set system dump directory.
    sed -i '39s|.*|syschardump_dir=/var/sotw|' ${srcdir}/shadow-of-the-wyrm/sotw/swyrm.ini
    # Set score file location.
    sed -i '49s|.*|scorefile_dir=/var/sotw|' ${srcdir}/shadow-of-the-wyrm/sotw/swyrm.ini
    # Set disallow score for narrative mode and console commands.
    sed -i '636s|.*|_disallow_score_on_exploration=1|' ${srcdir}/shadow-of-the-wyrm/sotw/swyrm.ini

# Do the actual packaging
  install -D -m644 ${srcdir}/shadow-of-the-wyrm/LICENSE "${pkgdir}/usr/share/licenses/sotw/LICENSE"
  install -d ${srcdir}/shadow-of-the-wyrm/sotw "${pkgdir}/usr/share/sotw"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/sotw "${pkgdir}/usr/share/sotw/sotw"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/howdoi.txt "${pkgdir}/usr/share/sotw/howdoi.txt"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/LICENSE "${pkgdir}/usr/share/sotw/LICENSE"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/README.md "${pkgdir}/usr/share/sotw/README.md"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/shadowofthewyrmtext_blank.ini "${pkgdir}/usr/share/sotw/shadowofthewyrmtext_blank.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/shadowofthewyrmtext_en.ini "${pkgdir}/usr/share/sotw/shadowofthewyrmtext_en.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/swyrm.ini "${pkgdir}/usr/share/sotw/swyrm.ini"
  cp -R ${srcdir}/shadow-of-the-wyrm/assets ${pkgdir}/usr/share/sotw/assets
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/data ${pkgdir}/usr/share/sotw/data
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/docs ${pkgdir}/usr/share/sotw/docs
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/licenses ${pkgdir}/usr/share/sotw/licenses
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/logs ${pkgdir}/usr/share/sotw/logs
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/scripts ${pkgdir}/usr/share/sotw/scripts
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/texts ${pkgdir}/usr/share/sotw/texts
  mkdir ${pkgdir}/usr/share/icons/
  mkdir ${pkgdir}/usr/share/applications/
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw_icon.ico ${pkgdir}/usr/share/icons/sotw_icon.png
  cp -R ${srcdir}/sotw.desktop ${pkgdir}/usr/share/applications/sotw.desktop
  install -D ${srcdir}/shadow-of-the-wyrm/sotw.sh ${pkgdir}/usr/bin/sotw
}
