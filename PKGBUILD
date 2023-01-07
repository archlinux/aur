#Maintainer: Larzid <juanitocampamocha@gmail.com>
pkgname=sotw
pkgver=1.5.2
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
source=('git+https://github.com/prolog/shadow-of-the-wyrm.git' 'https://i.imgur.com/z9QmK0X.png')
noextract=()
md5sums=('SKIP' 'SKIP')
validpgpkeys=('SKIP')

build() {
    cd shadow-of-the-wyrm
    # git checkout develop
    premake5 --lua_include=/usr/include/lua5.1 --lua_link=lua5.1 gmake
    make config=release
}

package() {
# Create launch script.
    echo "#!/bin/sh" > ${srcdir}/shadow-of-the-wyrm/sotw.sh
    echo "cd /usr/share/shadow-of-the-wyrm" >> ${srcdir}/shadow-of-the-wyrm/sotw.sh
    echo "./ShadowOfTheWyrm" >> ${srcdir}/shadow-of-the-wyrm/sotw.sh
    chmod +x ${srcdir}/shadow-of-the-wyrm/sotw.sh

# Create the .desktop entry.
    echo "[Desktop Entry]
    Version=$pkgver
    Name=Shadow Of The Wyrm
    GenericName=SOTW
    Type=Application
    Comment=A single player, traditional roguelike by Julian Day.
    Icon=sotw
    Exec=sotw
    Terminal=false
    SartupNotify=false
    Keywords=game;roguelike;
    Categories=Game;" > ${srcdir}/sotw.desktop

# Tweak game settings.
    # Setup log directory.
    sed -i -e 's|'"log_dir="'|'"log_dir=/var/sotw"'|g' ${srcdir}/shadow-of-the-wyrm/swyrm.ini
    mkdir ${pkgdir}/var
    mkdir ${pkgdir}/var/sotw
    chmod 777 ${pkgdir}/var/sotw
    # Set system dump directory.
    sed -i -e 's|'"syschardump_dir="'|'"syschardump_dir=/var/sotw"'|g' ${srcdir}/shadow-of-the-wyrm/swyrm.ini
    # Set disallow score for narrative mode and console commands.
    sed -i -e 's|'"_disallow_score_on_exploration=0"'|'"_disallow_score_on_exploration=1"'|g' ${srcdir}/shadow-of-the-wyrm/swyrm.ini

# Do the actual packaging.
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
    mkdir ${pkgdir}/usr/share/icons/
    mkdir ${pkgdir}/usr/share/applications/
    cp -R ${srcdir}/z9QmK0X.png ${pkgdir}/usr/share/icons/sotw.png
    cp -R ${srcdir}/sotw.desktop ${pkgdir}/usr/share/applications/sotw.desktop
    install -D ${srcdir}/shadow-of-the-wyrm/sotw.sh ${pkgdir}/usr/bin/sotw
}
