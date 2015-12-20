# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=dwarffortress-ironhand
pkgver=0.42.03
_pkgver=42_03
pkgrel=1
pkgdesc="A single-player fantasy game. You control a dwarven outpost or an adventurer in a randomly generated persistent world."
arch=(i686 x86_64)
url="http://www.bay12games.com/dwarves/"
license=('custom:dwarffortress')
depends=(gtk2 glu sdl_image libsndfile openal sdl_ttf glew gcc-libs)
makedepends=(git cmake)
options=('!strip' '!buildflags')
install=dwarffortress.install
if [[ $CARCH == 'x86_64' ]]; then
  makedepends+=(gcc-multilib)
  depends=(gcc-libs-multilib lib32-gtk2 lib32-glu lib32-sdl_image lib32-libsndfile lib32-openal
           lib32-libxdamage lib32-ncurses lib32-sdl_ttf lib32-glew)
  optdepends=('lib32-nvidia-utils: If you have nvidia graphics'
              'lib32-catalyst-utils: If you have ATI graphics'
              'lib32-alsa-lib: for alsa sound'
              'lib32-libpulse: for pulse sound')
fi
# I made a fucking github repo with the sole purpose of unfucking df a bit
# We try to compile whatever little bit of df is open source
source=(http://www.bay12games.com/dwarves/df_${_pkgver}_linux.tar.bz2
        git://github.com/svenstaro/dwarf_fortress_unfuck.git#tag=${pkgver}
        dwarffortress
        dwarffortress.desktop
        dwarffortress.png
        'http://dffd.bay12games.com/download.php?id=11349&f=Ironhand_42_03A_Upgrade.zip')
sha256sums=('6bc36b3562da0a8d6e1f14d269e2a4ce04b8f2f6ffc516b542bc7ac8ae50b3cc'
            'SKIP'
            '7dc1f0ed0d496b21f4f240334f77dc43b728823f3e1c4ea25ce768691346ec07'
            '0c279596f88b5fca4e0676627bfc6739b5da9416cc099abf5865ee6c0fd13435'
            '83183abc70b11944720b0d86f4efd07468f786b03fa52fe429ca8e371f708e0f'
            '17b8209d90cfffc8bcae9ac69fe5c302cbd38016012a6af1841269be6972a70b')

build() {
  cd $srcdir/dwarf_fortress_unfuck

  cmake .
  make
}

package() {
  install -dm755 $pkgdir/opt/
  cp -r $srcdir/df_linux $pkgdir/opt/$pkgname
  rm -r $pkgdir/opt/$pkgname/df $pkgdir/opt/$pkgname/libs/* $pkgdir/opt/$pkgname/g_src

  cp -r $srcdir/"Dwarf Fortress"/* $pkgdir/opt/$pkgname

  find $pkgdir/opt/$pkgname -type d -exec chmod 755 {} +
  find $pkgdir/opt/$pkgname -type f -exec chmod 644 {} +

  install -Dm755 $srcdir/df_linux/libs/Dwarf_Fortress $pkgdir/opt/$pkgname/libs/Dwarf_Fortress
  install -Dm755 $srcdir/dwarf_fortress_unfuck/libgraphics.so $pkgdir/opt/$pkgname/libs/libgraphics.so
  install -Dm755 $srcdir/dwarffortress $pkgdir/usr/bin/$pkgname

  # No idea why we need this. Really. This isn't being loaded dynamically, it's not linked and
  # in general there is no indication this is being used. However, it doesn't work without this symlink.
  [[ $CARCH == "x86_64" ]] && ln -s /usr/lib32/libpng.so $pkgdir/opt/$pkgname/libs/libpng.so.3
  [[ $CARCH == "i686" ]] && ln -s /usr/lib/libpng.so $pkgdir/opt/$pkgname/libs/libpng.so.3

  # Set pkgname in runscript
  sed -i "s/^pkgname=.*/pkgname=$pkgname/" $pkgdir/usr/bin/$pkgname

  # Desktop launcher with icon
  install -Dm644 $srcdir/dwarffortress.desktop $pkgdir/usr/share/applications/"$pkgname".desktop
  install -Dm644 $srcdir/dwarffortress.png     $pkgdir/usr/share/pixmaps/"$pkgname".png

  install -Dm644 $srcdir/df_linux/readme.txt $pkgdir/usr/share/licenses/$pkgname/readme.txt
}

# vim:set ts=2 sw=2 et:
