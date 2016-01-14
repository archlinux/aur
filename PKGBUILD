# Maintainer: Lukas Winkler <derwinlu+aur at gmail . com>
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
pkgver=0.42.04
_dfver=42_04
_sfver=42.04
_ufver=0.42.04
pkgrel=1
pkgdesc="A single-player fantasy game. You control a dwarven outpost or an adventurer in a randomly generated persistent world. Packed with Spacefox's tileset and graphics pack.  Does not replace other dwarffortress packages."
arch=(i686 x86_64)
url="http://www.bay12forums.com/smf/index.php?topic=129219.0"
install="dwarffortress-sf.install"
license=('custom:dwarffortress-sf')
makedepends=(unrar unzip git cmake)
depends_i686=(glew glu gtk2 libsndfile libxdamage ncurses openal sdl_image sdl_ttf)
depends_x86_64=(lib32-glew lib32-glu lib32-gtk2 lib32-libsndfile lib32-libxdamage lib32-ncurses lib32-openal lib32-sdl_image lib32-sdl_ttf)
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
        "spacefox_${_sfver}.zip::https://github.com/fricy/Spacefox/archive/${_sfver}.zip"
        "unfuck_${_ufver}.zip::https://github.com/svenstaro/dwarf_fortress_unfuck/archive/${_ufver}.zip"
        "dwarffortress-sf"
        "dwarffortress-sf.desktop"
        "dwarffortress-sf.png"
        "LICENSE-sf")

md5sums=('0e8ef7f63e2a7adc981f0cdd590b5800'
         '03aa752e5517fe456a6484071c1aed7f'
         '9d8620d936ae1783bb779620bacb8b7e'
         '53c9d5bfcb35281c81b78fea23da0698'
         '60de2d654998220f426bbe41f2e57471'
         'b1d51f82400073af9bb179e34a9209d0'
         '531f90ee12c6752762b64418a100a991')


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
