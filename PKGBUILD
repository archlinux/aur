# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Klemen Košir <klemen913@gmail.com>

pkgname=cataclysm-dda-git
pkgver=0.G.2024.01.05
_pkgver=0.G
pkgrel=1
pkgdesc="A post-apocalyptic roguelike."
#url="http://cataclysmrl.blogspot.com/"
url="https://cataclysmdda.org/"
arch=('i686' 'x86_64')
license=("CCPL:by-sa")
conflicts=('cataclysm-dda' 'cataclysm-dda-ncurses' 'cataclysm-dda-tiles')
depends=('ncurses' 'gettext')
makedepends=('sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'freetype2' 'git' 'libbacktrace-git')
optdepends=('sdl2_image: for tiles'
            'sdl2_ttf: for tiles'
            'freetype2: for tiles'
            'sdl2_mixer: for tiles')
options=('!strip')
#source=("$pkgname"::'git://github.com/CleverRaven/Cataclysm-DDA.git#branch=master')
# The git repo is more than a GB
# so download a snapshot while waiting for shallow clone support in makepkg
# (you may uncomment the alternate source/pkgver() if you would prefer to use that)
source=(
  'https://github.com/CleverRaven/Cataclysm-DDA/archive/master.zip'
)
sha512sums=('SKIP')

pkgver() {
  cd "Cataclysm-DDA-master"
  #git describe --tags --long | sed 's/-/.r/; s/-/./'
  # no git metadata in the snapshot, so fake it
  echo "${_pkgver}.$(date +%Y.%m.%d)"
}

prepare() {
  cd "Cataclysm-DDA-master"
  sed -i 's/ncursesw5-config/ncursesw6-config/' Makefile
}

build() {
  cd "Cataclysm-DDA-master"

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109418
  # -Werror=maybe-uninitialized has false positives, including in gcc libs, so we disable it here.
  CXXFLAGS="$CXXFLAGS -Wno-error=maybe-uninitialized" make PREFIX=/usr RELEASE=1 USE_XDG_DIR=1 LANGUAGES=all LTO=1 TESTS=0 RUNTESTS=0 LINTJSON=0 ASTYLE=0 PCH=0 LIBBACKTRACE=1
  CXXFLAGS="$CXXFLAGS -Wno-error=maybe-uninitialized" make PREFIX=/usr RELEASE=1 USE_XDG_DIR=1 LANGUAGES=all LTO=1 TESTS=0 RUNTESTS=0 LINTJSON=0 ASTYLE=0 PCH=0 TILES=1 SOUND=1 LIBBACKTRACE=1
  CXXFLAGS="$CXXFLAGS -Wno-error=maybe-uninitialized" make PREFIX=/usr LINTJSON=0 RELEASE=1 PCH=0 LIBBACKTRACE=1 object_creator
}

package() {
  cd "Cataclysm-DDA-master"

  # no DESTDIR
  make PREFIX="$pkgdir/usr" \
  RELEASE=1 ZLEVELS=1 USE_XDG_DIR=1 PCH=0 \
  install

  make PREFIX="$pkgdir/usr" \
  RELEASE=1 ZLEVELS=1 USE_XDG_DIR=1 PCH=0 TILES=1 SOUND=1 \
  install

  install -Dm755 ./object_creator/object_creator "$pkgdir/usr/bin/object_creator"

  # Icons
  pushd build-data/osx/AppIcon.iconset
  for i in *.png
  do
    local _isize="$(echo "$i" | sed -Ee 's/icon_([[:digit:]]+)x\1\.png/\1x\1/')"
    install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/$_isize/apps/cataclysm-dda.png"
  done
  popd

  # Docs
  install -d "$pkgdir/usr/share/doc/cataclysm-dda"
  cp -r doc/* "$pkgdir/usr/share/doc/cataclysm-dda"
  rm "$pkgdir/usr/share/doc/cataclysm-dda/"*.6
  install -Dm644 doc/cataclysm.6 "$pkgdir/usr/share/man/man6/cataclysm.6"
  install -Dm644 doc/cataclysm-tiles.6 "$pkgdir/usr/share/man/man6/cataclysm-tiles.6"

  # undo symlink
  rm "$pkgdir/usr/share/doc/cataclysm-dda/JSON_LOADING_ORDER.md"
  cp 'data/json/LOADING_ORDER.md' "$pkgdir/usr/share/doc/cataclysm-dda/JSON_LOADING_ORDER.md"

  # License
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Languages
  pushd lang/mo
  for i in *; do
    install -d "${pkgdir}/usr/share/locale/${i}/LC_MESSAGES"
    cp "${i}/LC_MESSAGES/cataclysm-dda.mo" "${pkgdir}/usr/share/locale/${i}/LC_MESSAGES"
  done
  popd
}
