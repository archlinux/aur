# New Maintainer: Rein Fernhout <me at levitati.ng>
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
pkgver=0.47.05
_pkgver=47_05
_sfver=47.05
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

backup=(opt/$pkgname/data/init/colors.txt
        opt/$pkgname/data/init/init.txt
        opt/$pkgname/data/init/d_init.txt
        opt/$pkgname/data/init/interface.txt)

source=(git+https://github.com/svenstaro/dwarf_fortress_unfuck.git#tag=${pkgver}
		https://www.bay12games.com/dwarves/df_${_pkgver}_linux.tar.bz2
		spacefox_${_pkgver}.zip::https://github.com/DFgraphics/Spacefox/archive/${_sfver}.zip
        dwarffortress-sf
        dwarffortress-sf.desktop
        dwarffortress-sf.png
        LICENSE-sf)

sha256sums=(
            '1b80b0f76ed2268957b16f4046fa665f0a194d96932fd8d285da829e5a585c25'
            'ac74a6dbb7d7d9621f430405080322ab50c35f6632352ff2ea923f6dc5affca3'
            'e9608bdf9d47dbcf42567c57430a110f19ac5040fc55b87d47b927a0c3f24f5d'
            'a2ffa10c38bbd611d3ef72a8ebc7b0dda202786293168c40b7befbbab39a394b'
            '21fe09beb0fce25562cca51257998fded7c36588fcbac3e5c8c4f87075cbe6fd'
            '83183abc70b11944720b0d86f4efd07468f786b03fa52fe429ca8e371f708e0f'
            '769a5f6a7587a1fd1982beec159ad26d8ff6bf28e5e06747458dd71b5e3fbfc8')

build() {
  cd dwarf_fortress_unfuck
  cmake .
  make
}

package() {
  install -dm755 "$pkgdir"/opt/
  cp -r "$srcdir"/df_linux "$pkgdir"/opt/$pkgname
  rm -r "$pkgdir"/opt/$pkgname/df "$pkgdir"/opt/$pkgname/libs/* "$pkgdir"/opt/$pkgname/g_src

  find "$pkgdir"/opt/$pkgname -type d -exec chmod 755 {} +
  find "$pkgdir"/opt/$pkgname -type f -exec chmod 644 {} +

  install -Dm755 "$srcdir"/df_linux/libs/Dwarf_Fortress "$pkgdir"/opt/$pkgname/libs/Dwarf_Fortress
  install -Dm755 "$srcdir"/dwarf_fortress_unfuck/libgraphics.so "$pkgdir"/opt/$pkgname/libs/libgraphics.so
  install -Dm755 "$srcdir"/dwarffortress-sf "$pkgdir"/usr/bin/$pkgname

  # cp tileset
  cp -rf $srcdir/Spacefox-${_sfver}/* $pkgdir/opt/$pkgname/

  # No idea why we need this. Really. This isn't being loaded dynamically, it's not linked and
  # in general there is no indication this is being used. However, it doesn't work without this symlink.
  ln -s /usr/lib/libpng.so "$pkgdir"/opt/$pkgname/libs/libpng.so.3

  # Set pkgname in runscript
  sed -i "s/^pkgname=.*/pkgname=$pkgname/" "$pkgdir"/usr/bin/$pkgname

  # Desktop launcher with icon
  install -Dm644 "$srcdir"/dwarffortress-sf.desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm644 "$srcdir"/dwarffortress-sf.png     "$pkgdir"/usr/share/pixmaps/"$pkgname".png

  install -Dm644 "$srcdir"/df_linux/readme.txt "$pkgdir"/usr/share/licenses/$pkgname/readme.txt
}

# vim:set ts=2 sw=2 et:
