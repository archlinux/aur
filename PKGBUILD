# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Lukas Winkler <derwinlu+aur at gmail . com>
# Modified from aur package dwarffortress-ironhand 
# Contributor: Chris Waddell <christopher at cwaddell . com >
# Contributor: Christoph Hoopmann <choopm at 0pointer.org>
# Contributor: Klaas Boesche <aurkagebe _at_ googlemail.com>
# Modified from aur package dwarffortress-mayday by
# Contributor: Patrick Chilton <chpatrick _at_ gmail _dot_ com>
# Original from community by
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Daenyth <Daenyth+Arch [AT] gmail [DOT] com>
# Contributor: djnm <nmihalich [at} gmail dott com>

pkgname=dwarffortress-spacefox
pkgver=0.47.04
_dfver=47_04
_sfver=47.04
_ufver=0.47.04
pkgrel=1
pkgdesc="A single-player fantasy game. You control a dwarven outpost or an adventurer in a randomly generated persistent world. Packed with Spacefox's tileset and graphics pack.  Does not replace other dwarffortress packages."
arch=(i686 x86_64)
url="http://www.bay12forums.com/smf/index.php?topic=129219.0"
install="dwarffortress-sf.install"
license=('custom:dwarffortress-sf')
makedepends=(unrar unzip git cmake)
depends_i686=(glew glu gtk2 libsndfile libxdamage ncurses openal sdl_image sdl_ttf zlib)
depends_x86_64=(lib32-glew lib32-glu lib32-gtk2 lib32-libsndfile lib32-libxdamage lib32-ncurses lib32-openal lib32-sdl_image lib32-sdl_ttf lib32-zlib)
optdepends=('nvidia-utils: If you have nvidia graphics'
            'catalyst-utils: If you have ATI graphics'
            'alsa-lib: for alsa sound'
            'libpulse: for pulse sound')
if test "$CARCH" == "x86_64"; then
    optdepends=('lib32-nvidia-utils: If you have nvidia graphics'
                'lib32-catalyst-utils: If you have ATI graphics'
                'lib32-alsa-lib: for alsa sound'
                'lib32-libpulse: for pulse sound')
fi

backup=('opt/df_linux-sf/data/init/colors.txt'
        'opt/df_linux-sf/data/init/init.txt'
        'opt/df_linux-sf/data/init/d_init.txt'
        'opt/df_linux-sf/data/init/interface.txt')

source=("df_${_dfver}.tar.bz2::http://www.bay12games.com/dwarves/df_${_dfver}_linux.tar.bz2"
        "spacefox_${_sfver}.zip::https://github.com/DFgraphics/Spacefox/archive/${_sfver}.zip"
        "unfuck_${_ufver}.zip::https://github.com/svenstaro/dwarf_fortress_unfuck/archive/${_ufver}.zip"
        "dwarffortress-sf"
        "dwarffortress-sf.desktop"
        "dwarffortress-sf.png"
        "LICENSE-sf")

sha256sums=('1de5872bf3ac32906a0082129ec88d6879b6ac7059a3513607d628090b1328e6'
            '51d71a5b205e5d5d48d511dbe4a1eda666da322a9dc9392f3a78305b9ef205fa'
            'a337437ab917a12e5fb3c8f65720e3f5f6e742900db5754bdc517ad95befdc8b'
            'a2ffa10c38bbd611d3ef72a8ebc7b0dda202786293168c40b7befbbab39a394b'
            '21fe09beb0fce25562cca51257998fded7c36588fcbac3e5c8c4f87075cbe6fd'
            '83183abc70b11944720b0d86f4efd07468f786b03fa52fe429ca8e371f708e0f'
            '769a5f6a7587a1fd1982beec159ad26d8ff6bf28e5e06747458dd71b5e3fbfc8')


_installname=df_linux-sf


build() {
  # build df unfuck
  cd "$srcdir/dwarf_fortress_unfuck-${_ufver}"
  mkdir -p build && cd build
  cmake ..
  make
}

package() {
  cd $srcdir/df_linux
  install -dm755 $pkgdir/opt/
  install -dm755 -o root -g games $pkgdir/opt/${_installname}

  # cp df
  cp -r $srcdir/df_linux/* $pkgdir/opt/${_installname}/

  # cp tileset
  cp -rf $srcdir/Spacefox-${_sfver}/* $pkgdir/opt/${_installname}/

  # fix libs
  install -Dm755 $srcdir/dwarf_fortress_unfuck-${_ufver}/build/libgraphics.so $pkgdir/opt/${_installname}/libs/libgraphics.so
  #ln -s /usr/lib32/libpng.so $pkgdir/opt/${_installname}/libs/libpng.so.3
  rm $pkgdir/opt/${_installname}/libs/{libgcc_s.so.1,libstdc++.so.6}

  # permissions
  find $pkgdir/opt/${_installname} -type d -exec chmod 755 {} +
  find $pkgdir/opt/${_installname} -type f -exec chmod 644 {} +
  chmod 755 $pkgdir/opt/${_installname}/libs/Dwarf_Fortress
  chmod 664 $pkgdir/opt/${_installname}/data/index
  chown -R root:games $pkgdir/opt/${_installname}

  install -d -m775 -o root -g games $pkgdir/opt/${_installname}/data/save
  install -Dm755 $srcdir/dwarffortress-sf $pkgdir/usr/bin/dwarffortress-sf
  install -Dm644 $srcdir/dwarffortress-sf.desktop $pkgdir/usr/share/applications/dwarffortress-sf.desktop
  install -Dm644 $srcdir/dwarffortress-sf.png $pkgdir/usr/share/pixmaps/dwarffortress-sf.png
  install -Dm644 $srcdir/df_linux/readme.txt $pkgdir/usr/share/licenses/dwarffortress-spacefox/readme.txt
  install -Dm644 $srcdir/LICENSE-sf $pkgdir/usr/share/licenses/dwarffortress-spacefox/LICENSE-sf
}
