# Maintainer:

: ${_install_path:=usr/lib}

_pkgname="art-rawconverter"
pkgname="$_pkgname-bin"
pkgver=1.26.1
pkgrel=1
pkgdesc="Raw image converter forked from RawTherapee with ease of use in mind"
url="https://github.com/artpixls/ART"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=('glibc')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

_pkgsrc="ART-$pkgver-linux64"
_pkgext="tar.xz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/releases/download/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('fa55c8679fc6ae6c90ef8309538516437e39ec4713b562f6a28e87a2106e9222')

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
  mkdir -pm755 "$pkgdir/$_install_path"
  cp -r "$_pkgsrc" "$pkgdir/$_install_path/$_pkgname"

  # symlinks
  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf "/$_install_path/$_pkgname/ART" "$pkgdir/usr/bin/art"
  ln -sf "/$_install_path/$_pkgname/ART-cli" "$pkgdir/usr/bin/art-cli"

  mkdir -pm755 "$pkgdir/usr/share/man/man1"
  ln -sf "/$_install_path/$_pkgname/share/man/man1/ART.1" "$pkgdir/usr/share/man/man1/art.1"

  # icon
  install -Dm644 "$srcdir/$_pkgsrc/share/icons/hicolor/256x256/apps/ART.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # launcher
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
