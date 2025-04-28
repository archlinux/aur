# Maintainer:

: ${_install_path:=usr/lib}

_pkgname="art-rawconverter"
pkgname="$_pkgname-bin"
pkgver=1.25.4
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
sha256sums=('b9a95bc80a797d7bff2166f626be53cda18b7d494101c5db3acb9cdac1cd6667')

prepare() {
  cat "$_pkgsrc/share/applications/ART.desktop" \
    | sed 's/Name=ART/Name=ART Raw Converter/' \
    | sed 's/Exec=ART/Exec=art/' \
    | sed "s/Icon=ART/Icon=$_pkgname/" \
      > "$_pkgname.desktop"

  # don't make extra launcher
  sed -E 's&^(mkdesktop)$&# \1&' -i "$_pkgsrc/ART"
}

package() {
  # main files
  install -dm755 "$pkgdir/$_install_path"
  cp --reflink=auto -r "$_pkgsrc" "$pkgdir/$_install_path/$_pkgname"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/$_install_path/$_pkgname/ART" "$pkgdir/usr/bin/art"
  ln -srf "$pkgdir/$_install_path/$_pkgname/ART-cli" "$pkgdir/usr/bin/art-cli"

  install -dm755 "$pkgdir/usr/share/man/man1"
  ln -srf "$pkgdir/$_install_path/$_pkgname/share/man/man1/ART.1" "$pkgdir/usr/share/man/man1/art.1"

  # launcher
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

  # icons
  local SRC_LOC="$srcdir/$_pkgsrc/share/icons/hicolor"
  local DEST_LOC="$pkgdir/usr/share/icons/hicolor"
  for i in 16 24 48 128 256; do
    install -Dm644 "$SRC_LOC/${i}x${i}/apps/ART.png" "$DEST_LOC/${i}x${i}/apps/$_pkgname.png"
  done

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
