# Maintainer:

## links
# https://bitbucket.org/agriggio/art
# https://github.com/agriggio/ART-releases/releases

_pkgname="art-rawconverter"
pkgname="$_pkgname-bin"
pkgver=1.24.1
pkgrel=1
pkgdesc="Raw image converter forked from RawTherapee with ease of use in mind"
url="https://bitbucket.org/agriggio/art"
license=('GPL-3.0-or-later')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

_url="https://github.com/agriggio/ART-releases"
_pkgsrc="ART-$pkgver-linux64"
_pkgext="tar.xz"
source=("$_pkgname-$pkgver.$_pkgext"::"$_url/releases/download/v$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('3a400a52e1990986bcfe49781f8c2f46428d485b568d0071d8a6f58698b6837c')

prepare() {
  cat "$_pkgsrc/share/applications/ART.desktop" \
    | sed 's/Name=ART/Name=ART Raw Converter/' \
    | sed 's/Exec=ART/Exec=art/' \
    | sed "s/Icon=ART/Icon=$_pkgname/" \
      > "$_pkgname.desktop"
}

package() {
  local OPT_PATH="opt/$_pkgname"

  # main files
  install -dm755 "$pkgdir/opt"
  cp --reflink=auto -r "$_pkgsrc" "$pkgdir/$OPT_PATH"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/$OPT_PATH/ART" "$pkgdir/usr/bin/art"
  ln -s "/$OPT_PATH/ART-cli" "$pkgdir/usr/bin/art-cli"

  install -dm755 "$pkgdir/usr/share/man/man1"
  ln -s "/$OPT_PATH/share/man/man1/ART.1" "$pkgdir/usr/share/man/man1/art.1"

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
