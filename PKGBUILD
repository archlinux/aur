# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Nathaniel Stickney <nstickney@gmail.com>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=dwarffortress-ironhand
_pkgname=dwarffortress
_pkgver=47_05
pkgver="0.${_pkgver/_/.}"
pkgrel=2
pkgdesc="A single-player fantasy game in which you build a dwarven outpost or play an adventurer in a randomly generated world"
arch=('x86_64' 'i686')
url="http://www.bay12games.com/dwarves/"
license=('custom:dwarffortress')
depends=(gcc-libs glew glib2 glu gtk3 libsndfile openal sdl sdl_image sdl_ttf)
makedepends=(git cmake)
optdepends=(
  'alsa-lib: for alsa sound'
  'libpulse: for pulse sound'
  'nvidia-utils: If you have nvidia graphics'
)
options=('!strip' '!buildflags')
install=${_pkgname}.install
# I made a fucking github repo with the sole purpose of unfucking df a bit
# We try to compile whatever little bit of df is open source
#source=("dwarffortress-unfuck-$pkgver.tar.gz::https://github.com/svenstaro/dwarf_fortress_unfuck/archive/$pkgver.tar.gz"
source=("dwarffortress-unfuck-$pkgver.zip::https://github.com/svenstaro/dwarf_fortress_unfuck/archive/$pkgver.zip"
  dwarffortress
  dwarffortress.desktop
  "Ironhand_$_pkgver.zip::http://dffd.bay12games.com/download.php?id=14804&f=Ironhand_$_pkgver.zip"
  dwarffortress.png)
source_x86_64=(http://www.bay12games.com/dwarves/df_"${_pkgver}"_linux.tar.bz2)
source_i686=(http://www.bay12games.com/dwarves/df_"${_pkgver}"_linux32.tar.bz2)
# sha256sums=('2d509739df22277dec9c0dc3f7fa9351c9844c7a2027b143e22ceb2b48c7e301'
sha256sums=(
  '1b80b0f76ed2268957b16f4046fa665f0a194d96932fd8d285da829e5a585c25'
  '211eaec6559d4fd5c08341dbed1f27bfab997a57bdf61fd268f9940e244652c5'
  'e79e3d945c6cc0da58f4ca30a210c7bf1bc3149fd10406d1262a6214eb40445a'
  'b9123465079c14101fa82d40dceec3fd11e5d8527f4af6ae65c1fc7907727414'
  '83183abc70b11944720b0d86f4efd07468f786b03fa52fe429ca8e371f708e0f'
)
sha256sums_x86_64=('ac74a6dbb7d7d9621f430405080322ab50c35f6632352ff2ea923f6dc5affca3')
sha256sums_i686=('542b29e4aae6ba71ae2e56e176c041ec0f6471e9c299db98695d4b0ddfd96ac9')

conflicts=(dwarffortress dwarffortress-obsidian)
provides=("dwarffortress=$pkgver")

build() {
  # shellcheck disable=2154
  cd "$srcdir"/dwarf_fortress_unfuck-"$pkgver" || exit
  cmake .
  make
}

package() {
  # shellcheck disable=2154
  install -dm755 "$pkgdir"/opt/
  cp -r "$srcdir"/df_linux "$pkgdir"/opt/"$_pkgname"
  rm -r "$pkgdir"/opt/"$_pkgname"/df "$pkgdir"/opt/"$_pkgname"/libs/* "$pkgdir"/opt/"$_pkgname"/g_src

  # cp -r "$srcdir/Dwarf Fortress"/* "$pkgdir"/opt/"$_pkgname"

  find "$pkgdir"/opt/"$_pkgname" -type d -exec chmod 755 {} +
  find "$pkgdir"/opt/"$_pkgname" -type f -exec chmod 644 {} +

  install -Dm755 "$srcdir"/df_linux/libs/Dwarf_Fortress "$pkgdir"/opt/"$_pkgname"/libs/Dwarf_Fortress
  # install -Dm755 "$srcdir"/dwarf_fortress_unfuck-"$pkgver"/libgraphics.so "$pkgdir"/opt/"$_pkgname"/libs/libgraphics.so
  install -Dm755 "$srcdir"/dwarf_fortress_unfuck-"$pkgver"/libgraphics.so "$pkgdir"/opt/"$_pkgname"/libs/libgraphics.so
  install -Dm755 "$srcdir"/dwarffortress "$pkgdir"/usr/bin/"$_pkgname"

  # No idea why we need this. Really. This isn't being loaded dynamically, it's not linked and
  # in general there is no indication this is being used. However, it doesn't work without this symlink.
  ln -s /usr/lib/libpng.so "$pkgdir"/opt/"$_pkgname"/libs/libpng.so.3

  # Set pkgname in runscript
  sed -i "s/^pkgname=.*/pkgname=$_pkgname/" "$pkgdir"/usr/bin/"$_pkgname"

  # Desktop launcher with icon
  install -Dm644 "$srcdir"/dwarffortress.desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
  install -Dm644 "$srcdir"/dwarffortress.png "$pkgdir"/usr/share/pixmaps/"$_pkgname".png
  install -Dm644 "$srcdir"/df_linux/readme.txt "$pkgdir"/usr/share/licenses/"$pkgname"/readme.txt
}

# vim:set ts=2 sw=2 et:
