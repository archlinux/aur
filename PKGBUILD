# Maintainer: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>
# Contributor: Patrick Chilton <chpatrick _at_ gmail _dot_ com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Daenyth <Daenyth+Arch [AT] gmail [DOT] com>
# Contributor: djnm <nmihalich [at} gmail dott com>
# Contributor: Mark Pustjens <pustjens@dds.nl>
pkgname=dwarffortress-obsidian
pkgver=0.34.11
_dfver=34_11
_dfgver=34_11
pkgrel=1
pkgdesc="A single-player fantasy game. You control a dwarven outpost or an adventurer in a randomly generated persistent world. Obsidian tileset."
arch=(i686 x86_64)
# WIP Thread: http://www.bay12forums.com/smf/index.php?topic=126934
url="http://mayday.w.staszic.waw.pl/df.php"
install="$pkgname.install"
license=('custom:dwarffortress')
depends=(gtk2 glu sdl_image libsndfile openal sdl_ttf glew)
makedepends=(unzip git)
if [[ $CARCH == 'x86_64' ]]; then
  depends=(gcc-multilib lib32-gtk2 lib32-glu lib32-sdl_image lib32-libsndfile lib32-openal
           lib32-libxdamage lib32-ncurses lib32-sdl_ttf lib32-glew lib32-libpng)
  optdepends=('lib32-nvidia-utils: If you have nvidia graphics'
              'lib32-catalyst-utils: If you have ATI graphics'
              'lib32-alsa-lib: for alsa sound'
              'lib32-libpulse: for pulse sound')
fi
backup=('opt/df_linux/data/init/colors.txt'
        'opt/df_linux/data/init/init.txt'
        'opt/df_linux/data/init/d_init.txt'
        'opt/df_linux/data/init/interface.txt')
conflicts=(dwarffortress)
provides=(dwarffortress)
noextract=(dfg_${_dfgver}_win.zip df_${_dfver}_linux.tar.bz2)
# I made a fucking github repo with the sole purpose of unfucking df a bit
# We try to compile whatever little bit of df is open source
source=(http://www.bay12games.com/dwarves/df_${_dfver}_linux.tar.bz2
        obsidian.zip::http://dffd.wimbli.com/download.php?id=7728\&f=%5B16x16%5D+Obsidian+%28v.0.8%29.zip
        git://github.com/svenstaro/dwarf_fortress_unfuck.git
        dwarffortress
        dwarffortress.desktop
        dwarffortress.png)
md5sums=('33e26a93e5914f7545fa1aaa53706eeb'
         'c3556f60ab81e2d4d586184ec7605cd6'
         'SKIP'
         'c19aacc31e8df354827db352fecfd200'
         'c8984d1eea6e409ecf339d6ee9e91e42'
         'b1d51f82400073af9bb179e34a9209d0')

build() {
  cd $srcdir/dwarf_fortress_unfuck
  make
}

package() {
  cd "${srcdir}"
  tar -f "df_${_dfver}_linux.tar.bz2" -x \
  --exclude "df_linux/raw" \
  --exclude "df_linux/data/art" \
  --exclude "df_linux/data/init/colors.txt" \
  --exclude "df_linux/data/init/init.txt"

  unzip -qod obsidian "obsidian.zip" \
    "\[16x16\]\ Obsidian/raw/*" \
    "\[16x16\]\ Obsidian/data/art/*" \
    "\[16x16\]\ Obsidian/data/init/colors.txt" \
    "\[16x16\]\ Obsidian/data/init/init.txt"

  cp -rf $srcdir/obsidian/"[16x16] Obsidian"/* $srcdir/df_linux

  cd $srcdir/df_linux
  install -dm755 $pkgdir/opt/
  cp -r $srcdir/df_linux/ $pkgdir/opt/

  # Yay for precompiled stuff with junk permissions! :D
  find $pkgdir/opt/df_linux -type d -exec chmod 755 {} +
  find $pkgdir/opt/df_linux -type f -exec chmod 644 {} +

  install -Dm755 $srcdir/dwarffortress $pkgdir/usr/bin/dwarffortress

  chmod 755 $pkgdir/opt/df_linux/libs/Dwarf_Fortress
  install -Dm755 $srcdir/dwarf_fortress_unfuck/libs/libgraphics.so $pkgdir/opt/df_linux/libs/libgraphics.so
  ln -s /usr/lib32/libpng.so $pkgdir/opt/df_linux/libs/libpng.so.3
  rm $pkgdir/opt/df_linux/libs/{libgcc_s.so.1,libstdc++.so.6}

  install -d -m775 -o root -g games $pkgdir/opt/df_linux/data/save

  # This probably is overkill, but I don't know what specific files df needs permission for in here.
  chmod 775 $pkgdir/opt/df_linux
  chown root:games $pkgdir/opt/df_linux
  chown -R root:games $pkgdir/opt/df_linux/data
  find $pkgdir/opt/df_linux/data -type d -exec chmod 775 {} +
  find $pkgdir/opt/df_linux/data -type f -exec chmod 664 {} +

  # Desktop launcher with icon
  install -Dm644 $srcdir/dwarffortress.desktop $pkgdir/usr/share/applications/dwarffortress.desktop
  install -Dm644 $srcdir/dwarffortress.png     $pkgdir/usr/share/pixmaps/dwarffortress.png

  install -Dm644 $srcdir/df_linux/readme.txt $pkgdir/usr/share/licenses/dwarffortress/readme.txt
}

# vim:set ts=2 sw=2 et:
