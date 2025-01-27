# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Klemen Košir <klemen913@gmail.com>

pkgname=cataclysm-dda-git
pkgver=experimental.2025.01.27
pkgrel=1
pkgdesc="A post-apocalyptic roguelike."
#url="http://cataclysmrl.blogspot.com/"
url="https://cataclysmdda.org/"
arch=('i686' 'x86_64')
license=("CCPL:by-sa")
conflicts=('cataclysm-dda' 'cataclysm-dda-ncurses' 'cataclysm-dda-tiles')
depends=('ncurses' 'gettext')
makedepends=('sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'freetype2' 'git' 'libbacktrace-git' 'qt5-base')
optdepends=('sdl2_image: for tiles'
            'sdl2_ttf: for tiles'
            'freetype2: for tiles'
            'sdl2_mixer: for tiles')
options=('!strip')
_gitbranch=master
#source=("$pkgname::git+https://github.com/CleverRaven/Cataclysm-DDA.git#branch=$_gitbranch")
# The git repo is more than a GB
# so uncomment to download a zip snapshot
source=("src_archive.zip::https://github.com/CleverRaven/Cataclysm-DDA/archive/$_gitbranch.zip")
sha512sums=('SKIP')

prepare() {
  # Handle both zip archive and git sources
  [ ! -f src_archive.zip ] || mv "Cataclysm-DDA-$_gitbranch" "$pkgname"
}

pkgver() {
  cd "$pkgname"

  # no git metadata in archives, so fake it if git describe fails
  (set -o pipefail; git describe --tags --long | sed 's/-/./g') || echo "experimental.$(date +%Y.%m.%d)"
}

build() {
  cd "$pkgname"

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109418
  # -Werror=maybe-uninitialized has false positives, including in gcc libs, so we disable it here.
  export LDFLAGS=${LDFLAGS/-Wl,-z,pack-relative-relocs}

  # gold linker is used in LTO=1 builds, but it doesn't support `-z pack-relative-relocs` flag.
  # https://rfc.archlinux.page/0023-pack-relative-relocs/
  # https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/21
  export CXXFLAGS="$CXXFLAGS -Wno-error=maybe-uninitialized"

  export CXXFLAGS="${CXXFLAGS//-Wp,-D_GLIBCXX_ASSERTIONS/}"

  make PREFIX=/usr RELEASE=1 USE_XDG_DIR=1 LANGUAGES=all LTO=0 TESTS=0 RUNTESTS=0 LINTJSON=0 ASTYLE=0 PCH=0 BACKTRACE=1 LIBBACKTRACE=1
  make PREFIX=/usr RELEASE=1 USE_XDG_DIR=1 LANGUAGES=all LTO=0 TESTS=0 RUNTESTS=0 LINTJSON=0 ASTYLE=0 PCH=0 TILES=1 SOUND=1 BACKTRACE=1 LIBBACKTRACE=1
  # make PREFIX=/usr LINTJSON=0 RELEASE=1 PCH=0 LIBBACKTRACE=1 object_creator
}

package() {
  cd "cataclysm-dda-git"

  # no DESTDIR
  make PREFIX="$pkgdir/usr" \
  RELEASE=1 ZLEVELS=1 USE_XDG_DIR=1 PCH=0 \
  install

  make PREFIX="$pkgdir/usr" \
  RELEASE=1 ZLEVELS=1 USE_XDG_DIR=1 PCH=0 TILES=1 SOUND=1 \
  install

  #install -Dm755 ./object_creator/object_creator "$pkgdir/usr/bin/object_creator"

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
