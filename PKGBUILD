# Maintainer: snit <snit@cock.li>
# Contributor: Alice Jenkinson <virtual.aur at zero-x dot nz>

_pkgname="katawa-shoujo"
pkgname="$_pkgname-bin"
pkgver=1.3.1
pkgrel=5
pkgdesc="A bishoujo-style visual novel by Four Leaf Studios"
url="https://www.katawa-shoujo.com"
license=("CC-BY-NC-ND-3.0")
arch=("x86_64")

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

options=("!strip")

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
  cd "$_pkgsrc"

  # main files
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp --reflink=auto -a game renpy "Katawa Shoujo.py" "$pkgdir/usr/share/$_pkgname/"

  install -dm755 "$pkgdir/usr/share/$_pkgname/lib"
  cp --reflink=auto -a lib/linux-x86_64 lib/pythonlib2.7 "$pkgdir/usr/share/$_pkgname/lib/"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
BASE="/usr/share/katawa-shoujo"
LIB="\$BASE/lib/linux-x86_64"
BASEFILE="Katawa Shoujo"

exec "\$LIB/\$BASEFILE" \$RENPY_PYARGS -EO "\$BASE/\$BASEFILE.py" "\$@"
END

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
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # manual
  install -Dm644 'Game Manual.pdf' "$pkgdir/usr/share/doc/$pkgname/gamemanual.pdf"
}
