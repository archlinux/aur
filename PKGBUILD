#
# Maintainer: Alexej Magura <sickhadas.code at gmail dot com>
# Contributor: Swen Simon <swsimon at gmail dot com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gmail.com>
#

pkgname=epsxe
_pkgname=ePSXe
pkgver=2.0.5
pkgrel=29
pkgdesc="Enhanced PSX emulator"
url="http://epsxe.com"
arch=('x86_64')
depends=(bash libcurl-compat gtk3 sdl_ttf ncurses openssl-1.0 libxt libcanberra)
makedepends=(unzip tar)
license=('unknown')
install=${pkgname}.install
options=(!strip)
source=(${pkgname}.desktop ${pkgname}.png ${pkgname}.sh http://www.epsxe.com/files/shaders.zip "http://www.epsxe.com/files/${_pkgname}${pkgver//./}linux_x64.zip" "https://archive.org/download/archlinux_pkg_ncurses/ncurses-5.9_20141101-1-x86_64.pkg.tar.xz")
conflicts=(bin32-epsxe)
noextract=(shaders.zip ncurses-5.9_20141101-1-$CARCH.pkg.tar.xz)
md5sums=(aeb34e2ca34f968630ca133ea821c61c eb0c46b8ae1355c589792f6be1835e47 8d47875ba4f51943cdb6e09c2f25e4b5 a863740899adb064b8a28c3fa47d5280 79fefeb4bff26bf1d374befb35b390df d435d3e9481e5786b9e377abe63ce325)

prepare()
{
  cd "$srcdir"

  if [[ $pkgname =~ 32 ]]; then
    mv e???e "$pkgname"
  else
    mv "${pkgname}_x64" "$pkgname"
  fi

  tar xf ncurses*.tar.xz usr/lib/libncursesw.so.5.9 2> /dev/null
  mv usr/lib/libncursesw.so.5.9 .
  rm -rf usr

  ## process shaders ##
  rm -rf shaders tmp
  mkdir tmp
  unzip -q shaders.zip -d tmp
  mv tmp/shaders "$srcdir"
}

package()
{
  cd "$srcdir"
  install -d "$pkgdir"/{usr/share/doc/$pkgname,/opt/$pkgname/shaders}

  find docs -name 'e???e_*.txt' -execdir install -m 644 -t "$pkgdir/usr/share/doc/$pkgname" \{\} +
  find shaders -maxdepth 1 -mindepth 1 -type d | xargs -I: cp -r : "$pkgdir/opt/$pkgname/shaders"
  chmod 644 -R "$pkgdir/opt/$pkgname/shaders"
  find "$pkgdir/opt/$pkgname/shaders" -maxdepth 1 -type d | xargs -I: chmod 645 :

  install -Dm 755 "$pkgname" "$pkgdir/opt/$pkgname/$pkgname"

  install -Dm 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "$srcdir/epsxe.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "$srcdir/epsxe.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  ## NCURSES

  # ln -sf "$HOME/.${pkgname}/${pkgname}rc "$pkgdir/opt/$pkgname/.${pkgname}rc"
  install -m 644 "$srcdir/libncursesw.so.5.9" "$pkgdir/opt/$pkgname/libncursesw.so.5.9"
  cd "$pkgdir/opt/$pkgname"
  ln -sf libncursesw.so.5.9 libncurses.so.5
  ln -sf libncursesw.so.5.9 libtinfo.so.5
}
