# Maintainer: snit <snit@cock.li>
# Contributor: Alice Jenkinson <virtual.aur at zero-x dot nz>

_pkgname="katawa-shoujo"
pkgname="$_pkgname-bin"
pkgver=1.3.2
pkgrel=1
pkgdesc="A bishoujo-style visual novel by Four Leaf Studios"
url="https://www.katawa-shoujo.com"
license=("CC-BY-NC-ND-3.0")
arch=("x86_64")

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

options=("!strip")

_pkgsrc="Katawa Shoujo-$pkgver-linux"
source=(
  "ks.tar.zst::https://cdn.fhs.sh/ks/bin/${pkgver}/%5B4ls%5D_katawa_shoujo_${pkgver}-%5Blinux-x86%5D%5BBA993979%5D.tar.zst"
  "katawa-shoujo.png"
)

sha256sums=(
  'c76b644b9d7582b20c50d0a984e426b6a85d8c564325e73ad29637210e31e0af'
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
