# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Nathaniel Stickney <nstickney@gmail.com>
# shellcheck disable=2034

_pkgver=47_05
pkgname=dwarffortress-ironhand
pkgver="0.${_pkgver/_/.}"
pkgrel=3
pkgdesc="Build a fortress and try to help your dwarves survive against a deeply generated world."
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
options=('!buildflags')
install=dwarffortress.install
conflicts=(dwarffortress)
provides=("dwarffortress=$pkgver")

source=(
  "https://github.com/svenstaro/dwarf_fortress_unfuck/archive/$pkgver.zip"
  "https://github.com/DFgraphics/Ironhand/archive/refs/tags/${_pkgver/_/.}.zip"
  dwarffortress
  dwarffortress.desktop
  dwarffortress.png
)
source_x86_64=(http://www.bay12games.com/dwarves/df_"${_pkgver}"_linux.tar.bz2)
source_i686=(http://www.bay12games.com/dwarves/df_"${_pkgver}"_linux32.tar.bz2)

sha256sums=(
  '1b80b0f76ed2268957b16f4046fa665f0a194d96932fd8d285da829e5a585c25'
  '81ed0703fb93e76b1dd56a40e85bf781e104f1c23fbc66770871cd36e7183a00'
  'fb86b0130b7839d7015709da78a236a743a5dbfe41ed8414b53c77e6cdc3da45'
  'febeac567c649224aae1614802a3f904e57ce93a014694c6179c98dbfb52c4ca'
  '83183abc70b11944720b0d86f4efd07468f786b03fa52fe429ca8e371f708e0f'
)
sha256sums_x86_64=('ac74a6dbb7d7d9621f430405080322ab50c35f6632352ff2ea923f6dc5affca3')
sha256sums_i686=('542b29e4aae6ba71ae2e56e176c041ec0f6471e9c299db98695d4b0ddfd96ac9')

prepare() {
  # install the tileset
  cp -r "$srcdir"/Ironhand-"${pkgver#0.}"/* "$srcdir"/df_linux/

  # http://www.bay12games.com/dwarves/mantisbt/view.php?id=9893
  rm "$srcdir"/df_linux/libs/{libgcc_s.so.1,libstdc++.so.6}
}

build() {
  cd "$srcdir"/dwarf_fortress_unfuck-"$pkgver" || exit
  cmake .
  make
}

package() {
  # install game files
  install -dm755 "$pkgdir"/opt/
  cp -r "$srcdir"/df_linux "$pkgdir"/opt/dwarffortress
  install -Dm644 "$srcdir"/dwarf_fortress_unfuck-"$pkgver"/libgraphics.so \
    "$pkgdir"/opt/dwarffortress/libs/libgraphics.so

  # fix the permissions (just in case)
  find "$pkgdir"/opt/dwarffortress -type d -exec chmod 755 {} +
  find "$pkgdir"/opt/dwarffortress -type f -exec chmod 644 {} +
  chmod 755 "$pkgdir"/opt/dwarffortress/libs/Dwarf_Fortress

  # install launcher script, .desktop, icon, and license
  install -Dm755 "$srcdir"/dwarffortress "$pkgdir"/usr/bin/dwarffortress
  install -Dm644 "$srcdir"/dwarffortress.desktop \
    "$pkgdir"/usr/share/applications/dwarffortress.desktop
  install -Dm644 "$srcdir"/dwarffortress.png \
    "$pkgdir"/usr/share/pixmaps/dwarffortress.png
  install -Dm644 "$srcdir"/df_linux/readme.txt \
    "$pkgdir"/usr/share/licenses/"$pkgname"/readme.txt
}
