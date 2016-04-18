# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=dwarffortress-ironhand
pkgver=0.42.06
_pkgver=42_06
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
        https://github.com/svenstaro/dwarf_fortress_unfuck/commit/3d409680597679998560c6c9fd4ad45b58e27872.patch
        dwarffortress
        dwarffortress.desktop
        'http://dffd.bay12games.com/download.php?id=11348&f=Ironhand_42_06B.zip'
        dwarffortress.png)
sha256sums=('03df8e73bf81e4f7bec9e789a83f8bd20b0b968d73131e4051e005db13fec99f'
            'SKIP'
            '303660f11968bc8a8cb61c91e08334d0e1bc42b58e08759b7edb3b0b9cb08811'
            '7dc1f0ed0d496b21f4f240334f77dc43b728823f3e1c4ea25ce768691346ec07'
            '0c279596f88b5fca4e0676627bfc6739b5da9416cc099abf5865ee6c0fd13435'
            '47e2ebbdaf1f1bb78185609512f4fbba3bd190682a2029195cbf675e25a25391'
            '83183abc70b11944720b0d86f4efd07468f786b03fa52fe429ca8e371f708e0f')

prepare() {
  cd $srcdir/dwarf_fortress_unfuck

  patch -Np1 -i $srcdir/3d409680597679998560c6c9fd4ad45b58e27872.patch
}

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
