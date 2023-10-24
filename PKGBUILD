pkgbase=cataclysm-bn
pkgname=(cataclysm-bn cataclysm-bn-tiles)
pkgname=cataclysm-bn
pkgver=0.4
_pkgver=0.4
pkgrel=1
pkgdesc="Cataclysm: Bright Nights, A fork/variant of Cataclysm:DDA by CleverRaven"
url="https://docs.cataclysmbn.org"
arch=('x86_64')
license=("CCPL")
depends=('ncurses' 'hicolor-icon-theme' 'gettext')
makedepends=('sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'freetype2' 'astyle')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/cataclysmbnteam/Cataclysm-BN/archive/refs/tags/cbn-${_pkgver}.tar.gz")
sha256sums=('d96b6e40c0ecc0fbaa12b671bb24a4b881225789e709a868aaf746b0061ad34d')

build() {
  cd "Cataclysm-BN-cbn-$_pkgver"

  export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}"
  export CXXFLAGS="${CXXFLAGS/-fcf-protection}"
  export CXXFLAGS="${CXXFLAGS/-fstack-clash-protection}"

  make PREFIX=/usr PCH=0 RELEASE=1 USE_XDG_DIR=1 LTO=1 RUNTESTS=0 LOCALIZE=1 LANGUAGES=all
  make PREFIX=/usr PCH=0 RELEASE=1 USE_XDG_DIR=1 LTO=1 RUNTESTS=0 LOCALIZE=1 LANGUAGES=all TILES=1 SOUND=1
  ./lang/compile_mo.sh
}

package_cataclysm-bn() {
  cd "Cataclysm-BN-cbn-$_pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr PCH=0 RELEASE=1 USE_XDG_DIR=1 LTO=1 RUNTESTS=0 LOCALIZE=1 LANGUAGES=all install

  # Docs
  install -d "$pkgdir/usr/share/doc/cataclysm-bn"
  cp -r doc/* "$pkgdir/usr/share/doc/cataclysm-bn"

  # undo symlink
  rm "$pkgdir/usr/share/cataclysm-bn/json/external_tileset/README.md"
  rm "$pkgdir/usr/share/cataclysm-bn/json/mapgen/lab/README.md"

  # License
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Languages
  cd lang/mo
  for i in *; do
    install -d "${pkgdir}/usr/share/locale/${i}/LC_MESSAGES"
    cp "${i}/LC_MESSAGES/cataclysm-bn.mo" "${pkgdir}/usr/share/locale/${i}/LC_MESSAGES"
  done

  # Help
  cd ./../..
  cp -r --no-preserve=ownership "./data/help" "${pkgdir}/usr/share/${pkgname}/"
}

package_cataclysm-bn-tiles() {
  pkgdesc="Cataclysm: Bright Nights, A fork/variant of Cataclysm:DDA by CleverRaven"
  depends=('cataclysm-bn' 'sdl2_image' 'sdl2_ttf' 'freetype2' 'sdl2_mixer')
  cd "Cataclysm-BN-cbn-$_pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr PCH=0 RELEASE=1 USE_XDG_DIR=1 LTO=1 LOCALIZE=1 LANGUAGES=all TILES=1 SOUND=1 install

  # Icons
  cd build-data/osx/AppIcon.iconset
  for i in *.png
  do
    local _isize="$(echo "$i" | sed -Ee 's/icon_([[:digit:]]+)x\1\.png/\1x\1/')"
    install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/$_isize/apps/cataclysm-bn.png"
  done
  cd ../../..

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # hack: remove overlapping files
  cd "$pkgdir/../cataclysm-bn"
  find . -type f -exec rm -f "$pkgdir"/{} \;
  cd "$pkgdir"
  find . -type d -empty -delete
}
