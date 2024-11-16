# Maintainer:

: ${_install_path:=usr/lib}

_pkgname="legcord"
pkgname="$_pkgname-bin"
pkgver=1.0.4
pkgrel=1
pkgdesc="Discord client with builtin client mod & theme support."
url="https://github.com/Legcord/Legcord"
license=('OSL-3.0')
arch=('x86_64' 'aarch64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

_pkgsrc="${_pkgname^}-$pkgver-linux-$CARCH"
_pkgext="zip"

noextract=("$_pkgsrc.$_pkgext")

source=("legcord.png")
source_x86_64=("${_pkgname^}-$pkgver-linux-x86_64.$_pkgext"::"$url/releases/download/v$pkgver/${_pkgname^}-$pkgver-linux-x64.zip")
source_aarch64=("${_pkgname^}-$pkgver-linux-aarch64.$_pkgext"::"$url/releases/download/v$pkgver/${_pkgname^}-$pkgver-linux-arm64.zip")

sha256sums=('2ac8985edf862912d42083007d1687cb6679f755b5e27ccd015d8266da51eb81')
sha256sums_x86_64=('b8b8f2c03fc46e0c826c3f047fd6356c9e85489f69ffe44acd154a46a4e91b24')
sha256sums_aarch64=('f1e7de556bf1a6c1f85c68b667bf03cb404ef27211aee15d47aa66fb20a4260c')

package() {
  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  bsdtar -C "$pkgdir/$_install_path/$_pkgname" -xf "$srcdir/$_pkgsrc.$_pkgext"

  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/$_install_path/$_pkgname/legcord" "$pkgdir/usr/bin/legcord"

  install -Dm644 "legcord.png" -t "$pkgdir/usr/share/pixmaps/"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Categories=Internet;Network;InstantMessaging;
END

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
