# Maintainer:

# basic info
_pkgname="art-rawconverter"
pkgname="$_pkgname-bin"
pkgver=1.22.1
pkgrel=1
pkgdesc="Raw image converter forked from RawTherapee with ease of use in mind"
url="https://bitbucket.org/agriggio/art"
license=('GPL-3.0-or-later')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

source=("$_pkgname-$pkgver.tar.xz"::"$url/downloads/ART-$pkgver-linux64.tar.xz")
sha256sums=('d877ab7ca407f734e2352020413d762df5e5e0e3fbd2709c00b4ac8c44ce7d0e')

prepare() {
  cp -rl "ART-$pkgver-linux64" "$_pkgname-$pkgver"

  cat "$_pkgname-$pkgver/share/applications/ART.desktop" \
    | sed 's/Name=ART/Name=ART Raw Converter/' \
    | sed 's/Exec=ART/Exec=art/' \
    | sed "s/Icon=ART/Icon=$_pkgname/" \
      > "$_pkgname.desktop"
}

package() {
  local OPT_PATH="opt/$_pkgname"

  # Install the package files
  install -dm755 "$pkgdir/opt"
  cp --reflink=auto -r "$_pkgname-$pkgver" "$pkgdir/$OPT_PATH"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/$OPT_PATH/ART" "$pkgdir/usr/bin/art"
  ln -s "/$OPT_PATH/ART-cli" "$pkgdir/usr/bin/art-cli"

  install -dm755 "$pkgdir/usr/share/man/man1"
  ln -s "/$OPT_PATH/share/man/man1/ART.1" "$pkgdir/usr/share/man/man1/art.1"

  # .desktop
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

  # icons
  local SRC_LOC="$srcdir/$_pkgname-$pkgver/share/icons/hicolor"
  local DEST_LOC="$pkgdir/usr/share/icons/hicolor"
  for i in 16 24 48 128 256; do
    install -Dm644 "$SRC_LOC/${i}x${i}/apps/ART.png" "$DEST_LOC/${i}x${i}/apps/$_pkgname.png"
  done

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
