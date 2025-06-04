# Maintainer: snit <snit@cock.li>
# Contributor: Cravix < dr dot neemous at gmail dot com >

_pkgname="katawa-shoujo"
pkgname="$_pkgname"
pkgver=1.3.1
pkgrel=5
pkgdesc="A bishoujo-style visual novel by Four Leaf Studios"
url="https://www.katawa-shoujo.com"
license=("CC-BY-NC-ND-3.0")
arch=('any')

options=('!debug' '!strip')

_pkgsrc="Katawa Shoujo-$pkgver-linux"
source=(
  "[4ls]_katawa_shoujo_${pkgver}-[linux-x86][18161880].tar.bz2::https://cdn.fhs.sh/ks/bin/gold_${pkgver}/%5B4ls%5D_katawa_shoujo_${pkgver}-%5Blinux-x86%5D%5B18161880%5D.tar.bz2"
  "katawa-shoujo.png"
)
sha256sums=(
  'ec5a05cfcf1d5981ecdbfa71904c279a215e79bdfeb256b2ad6927109a0007da'
  'dcd08ef958f785ac52b88a255680e385051d6b6a9626e57f00acb44021d7c0ee'
)

package() {
  depends=('renpy6-bin')

  # main files
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp --reflink=auto -a "$_pkgsrc/game" "$_pkgsrc/Katawa Shoujo.py" "$pkgdir/usr/share/$_pkgname/"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
RENPY="/usr/bin/renpy6"
if [ ! -e "\$RENPY" ]; then
  RENPY="/usr/bin/renpy"
fi
exec "\$RENPY" "/usr/share/katawa-shoujo"
END

  # .desktop
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=Katawa Shoujo
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Type=Application
Categories=Game;
END

  # icon
  install -Dm644 "$srcdir/$_pkgname.png" -t "$pkgdir/usr/share/pixmaps/"

  # license
  install -Dm644 "$_pkgsrc/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # manual
  install -Dm644 "$_pkgsrc/Game Manual.pdf" "$pkgdir/usr/share/doc/$pkgname/gamemanual.pdf"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
