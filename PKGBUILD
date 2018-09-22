# Maintainer: Paul Bell <linux at dpb dot org dot uk>
# Contributor: Natalia Portillo <claunia@clania.com>
pkgname=rpcemu
pkgver=0.9.0
pkgrel=1
pkgdesc="An Emulator of classic Acorn computer systems, such as the Risc PC and A7000"
url="http://www.marutan.net/rpcemu/"
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('qt5-base')
source=("http://www.marutan.net/rpcemu/cgi/download.php?sFName=${pkgver}/rpcemu-${pkgver}.tar.gz")
sha256sums=('772f2648cd141943d4182fb9518ebc9730e00cbdd492dc5c3c1b447d8cb1f86d')
install="$pkgname.install"
_pkgname="rpcemu-recompiler"

prepare() {
  # dynarec/recompiler is the default (_verbool=0)
  # set _verbool=1 for "interpreter"
  local _verbool=0
  if [ "$_verbool" -eq 0 ]; then
    sed -e "s/CONFIG += debug_and_release/CONFIG += debug_and_release dynarec/" \
        -i "$srcdir/${pkgname}-${pkgver}/src/qt5/rpcemu.pro"
  else
    _pkgname="rpcemu-interpreter"
  fi
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}/src/qt5"
  qmake-qt5
  make
}

package() {
  local _systdir="/usr/share"
  local _basedir="$pkgdir/$_systdir/$pkgname"

  cd "$srcdir/${pkgname}-${pkgver}"
  install -dm755 "$pkgdir/usr/bin"

  # must be writable (group) for rpcemu to function
  install -dm775 "$_basedir"

  # install as provided
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 {cmos.ram,readme.txt,rpc.cfg} -t "$_basedir"
  install -Dm755 "$_pkgname" "$_basedir/$_pkgname"
  cp -a "hostfs" "poduleroms" "riscos-progs" "roms" "$_basedir"

  # create a script to set working directory (to find roms) and run $_pkgname
  echo -e '#!/bin/sh'"\ncd $_systdir/$pkgname\n./$_pkgname" >"$_basedir/$pkgname"
  chmod 755 "$_basedir/$pkgname"
  ln -s "$_systdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # these must be writable (group) for rpcemu to function
  chown root:users -R "$_basedir"
  chmod g+w "$_basedir"/{cmos.ram,rpc.cfg,roms,hostfs,hostfs/Network}
}
