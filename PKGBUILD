# Maintainer:

: ${_install_path:=usr/lib}

_pkgname="legcord"
pkgname="$_pkgname-bin"
pkgver=1.0.2
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

source=(
  "legcord.desktop"
  "legcord.png"
)
sha256sums=(
  '6591a419965f775e4fceaa3e56bae05268a2427a5e2b8e7331d40d583804a001'
  '2ac8985edf862912d42083007d1687cb6679f755b5e27ccd015d8266da51eb81'
)
source_x86_64=("${_pkgname^}-$pkgver-linux-x86_64.$_pkgext"::"$url/releases/download/v$pkgver/${_pkgname^}-$pkgver-linux-x64.zip")
source_aarch64=("${_pkgname^}-$pkgver-linux-aarch64.$_pkgext"::"$url/releases/download/v$pkgver/${_pkgname^}-$pkgver-linux-arm64.zip")
sha256sums_x86_64=('770257a252d9a031b7b8b1d762e8517272285849b050f03c76530b7950a867f9')
sha256sums_aarch64=('2962030163d0cf91466b52a5ec5de5298d97ec90bd0cc21cd9493bdb260f0d3f')

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
