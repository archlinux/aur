# Maintainer: aur.chaotic.cx

: ${_install_path:=usr/lib}

_pkgname="art-rawconverter"
pkgname="$_pkgname-bin"
pkgver=1.26.10
pkgrel=1
pkgdesc="Raw image converter forked from RawTherapee with ease of use in mind"
url="https://github.com/artraweditor/ART"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

depends=('glibc')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

if [[ "${CARCH::1}" == "a" ]]; then
  _pkgarch="linux-aarch64"
else
  _pkgarch="linux64"
fi

_pkgsrc="ART-$pkgver-$_pkgarch"
_pkgext="tar.xz"
source_x86_64=("$_pkgname-$pkgver-x86_64.$_pkgext"::"$url/releases/download/$pkgver/ART-$pkgver-linux64.$_pkgext")
source_aarch64=("$_pkgname-$pkgver-aarch64.$_pkgext"::"$url/releases/download/$pkgver/ART-$pkgver-linux-aarch64.$_pkgext")

sha256sums_x86_64=('7a58560e98be5c849cec1b31d0512a99b199ee6357623ef377c0f8cda065cc55')
sha256sums_aarch64=('b46e672facf650c2a3d3608d88217f7b78f8e63b661959b6082c2dff1d63c915')

prepare() {
  cat "$_pkgsrc/share/applications/ART.desktop" \
    | sed 's/Name=ART/Name=ART Raw Converter/' \
    | sed 's/Exec=ART/Exec=art/' \
    | sed "s/Icon=ART/Icon=$_pkgname/" \
      > "$_pkgname.desktop"

  # prevent extra launcher
  sed -e 's&function mkdesktop&function _mkdesktop&g' -i "$_pkgsrc/ART"
  sed -e '1r /dev/stdin' -i "$_pkgsrc/ART" << 'END'
ART_MKDESKTOP=no
mkdir -p "$HOME/.config/ART"
touch "$HOME/.config/ART/no-desktop"
END
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
