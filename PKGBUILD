#
# Maintainer: Alexej Magura <sickhadas.code at gmail dot com>
# Contributor: Swen Simon <swsimon at gmail dot com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gmail.com>
#

pkgname=epsxe
_pkgname=ePSXe
pkgver=2.0.5
pkgrel=24
pkgdesc="Enhanced PSX emulator"
url="http://epsxe.com"
arch=('i686' 'x86_64')
depends=(bash libcurl-compat gtk3 sdl_ttf ncurses openssl-1.0)
depends_x86_64=(libxt libcanberra)
license=('unknown')
install=${pkgname}.install
options=(!strip)
replaces=(bin32-epsxe)
source=(${pkgname}.desktop ${pkgname}.png ${pkgname}.sh)
md5sums=(aeb34e2ca34f968630ca133ea821c61c eb0c46b8ae1355c589792f6be1835e47 8d47875ba4f51943cdb6e09c2f25e4b5)

if [[ $CARCH =~ 'x' ]]; then
  source+=("http://www.epsxe.com/files/${_pkgname}${pkgver//./}linux_x64.zip")
  md5sums+=(79fefeb4bff26bf1d374befb35b390df)
else
  source+=("http://www.epsxe.com/files/${_pkgname}${pkgver//./}linux.zip")
  md5sums+=(3e1976822eb260722b31c9f24cb1d6e1)
fi

prepare()
{
  cd "$srcdir"
  mv "${pkgname}_x64" "$pkgname" 2> /dev/null || true
}

package()
{
  cd "$srcdir"
  install -d "${pkgdir}"/usr/{share/doc/"${pkgname}",lib}

  find docs -name 'e???e_*.txt' -execdir install -m 644 -t $pkgdir/usr/share/doc/$pkgname \{\} +

  install -Dm 755 "$pkgname" "$pkgdir/opt/$pkgname/$pkgname"

  cd "$srcdir"
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "$srcdir/epsxe.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "$srcdir/epsxe.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  ln -sf "$HOME/.${pkgname}rc" -T "${pkgdir}/opt/${pkgname}/.${pkgname}rc"
  ln -sf /usr/lib/libncursesw.so "$pkgdir"/opt/$pkgname/libncurses.so.5
  ln -sf /usr/lib/libncursesw.so "$pkgdir"/opt/$pkgname/libtinfo.so.5
}
