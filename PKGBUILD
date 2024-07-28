# Maintainer:
# Contributor: Alice Jenkinson <virtual.aur at zero-x dot nz>

_pkgname="katawa-shoujo"
pkgname="$_pkgname-bin"
pkgver=1.3.1
pkgrel=2
pkgdesc="A bishoujo-style visual novel by Four Leaf Studios"
url="http://www.katawa-shoujo.com"
license=("CC-BY-NC-ND-3.0")
arch=("x86_64")

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

options=("!strip")

_pkgsrc="Katawa Shoujo-$pkgver-linux"
source=(
  "[4ls]_katawa_shoujo_${pkgver}-[linux-x86][18161880].tar.bz2"::"https://cdn.fhs.sh/ks/bin/gold_1.3.1/%255B4ls%255D_katawa_shoujo_1.3.1-%255Blinux-x86%255D%255B18161880%255D.tar.bz2"
  "katawa-shoujo.png"
)
sha512sums=(
  "d5f1b49c60b70b272dd5d62c1d49cb9e3c17e3f77339fc593db2122f1c140005bc23ecb7ad9b0d93c0701c77f9bcfcd5c1c67db1cbe3034a3be42a4309387809"
  "109f149c3e183be87ce50b21941bf3551e00859bb59ae3372625757418ed29d897db1a362e83eeac7cb3e8ec2c15386ef4bfe9373eb5ad013cd02df905bc8e80"
)

package() {
  cd "$_pkgsrc"

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
