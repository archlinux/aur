# Maintainer:

: ${_install_path:=usr/lib}

_pkgname="art-rawconverter"
pkgname="$_pkgname-bin"
pkgver=1.25.1
pkgrel=1
pkgdesc="Raw image converter forked from RawTherapee with ease of use in mind"
url="https://github.com/artpixls/ART"
license=('GPL-3.0-or-later')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

_pkgsrc="ART-$pkgver-linux64"
_pkgext="tar.xz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/releases/download/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('59521d14932136fc63a88f2cfabcd436e6b541d03be87787677ae82bf1a9ec28')

prepare() {
  cat "$_pkgsrc/share/applications/ART.desktop" \
    | sed 's/Name=ART/Name=ART Raw Converter/' \
    | sed 's/Exec=ART/Exec=art/' \
    | sed "s/Icon=ART/Icon=$_pkgname/" \
      > "$_pkgname.desktop"
}

package() {
  # main files
  install -dm755 "$pkgdir/$_install_path"
  cp --reflink=auto -r "$_pkgsrc" "$pkgdir/$_install_path/$_pkgname"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/$_install_path/$_pkgname/ART" "$pkgdir/usr/bin/art"
  ln -s "/$_install_path/$_pkgname/ART-cli" "$pkgdir/usr/bin/art-cli"

  install -dm755 "$pkgdir/usr/share/man/man1"
  ln -s "/$_install_path/$_pkgname/share/man/man1/ART.1" "$pkgdir/usr/share/man/man1/art.1"

  # .desktop
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

  # icons
  local SRC_LOC="$srcdir/$_pkgsrc/share/icons/hicolor"
  local DEST_LOC="$pkgdir/usr/share/icons/hicolor"
  for i in 16 24 48 128 256; do
    install -Dm644 "$SRC_LOC/${i}x${i}/apps/ART.png" "$DEST_LOC/${i}x${i}/apps/$_pkgname.png"
  done

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
