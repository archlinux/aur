# Maintainer: Paul Bell <linux "at" dpb "dot" org "dot" uk>
# Contributor: Natalia Portillo <claunia@clania.com>
pkgname=rpcemu
pkgver=0.9.4
pkgrel=1
pkgdesc="An Emulator of classic Acorn computer systems, such as the Risc PC and A7000"
url="http://www.marutan.net/rpcemu/"
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('qt5-base')
optdepends=('apulse: PulseAudio emulation for ALSA'
            'lib32-apulse: PulseAudio emulation for ALSA (32-bit)')
backup=('usr/share/rpcemu/rpc.cfg')
install="$pkgname.install"
source=("http://www.marutan.net/rpcemu/cgi/download.php?sFName=${pkgver}/rpcemu-${pkgver}.tar.gz")
sha256sums=('4df41542600a313aa7f618eee57e8b9e536a4c7753473013fdd9f926b7839ecf')
_pkgnames=("rpcemu-recompiler" "rpcemu-interpreter")

# set the _bool variable for whether you want rpcemu-recompiler (_bool=0)
# or rpcemu-interpreter (_bool=1) to be used in the run script
_bool=0
# set _apulse to anything (e.g. "1") for non-pulseaudio users using apulse to
# be able to use ALSA for audio in the emulator
_apulse=

build() {
  # need to add "-fcommon". GCC 10 has apparently changed how multiple symbols
  # defined in different sources are dealt with by default
  export CFLAGS="$CFLAGS -fcommon"
  # build rpcemu-interpreter first...
  cd "$srcdir/${pkgname}-${pkgver}/src/qt5"
  qmake-qt5
  make
  # now build rpcemu-recompiler
  sed -e "s/CONFIG += debug_and_release/CONFIG += debug_and_release dynarec/" \
      -i "$srcdir/${pkgname}-${pkgver}/src/qt5/rpcemu.pro"
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
  install -Dm755 "${_pkgnames[@]}" "$_basedir"
  cp -R "hostfs" "netroms" "poduleroms" "riscos-progs" "roms" "$_basedir"

  # create a script to set working directory (to find rom) and run ${_pkgnames[$_bool]}
  # and apply optional use of apulse. Note: dirname and readlink are used for
  # portability (i.e. relocating install for using multiple RISCOS versions)
  echo -e '#!/bin/sh'"\n"'cd "$(dirname "$(readlink -f "$0")")"'"\n${_apulse:+apulse }./${_pkgnames[$_bool]}" >"$_basedir/$pkgname"

  chmod 755 "$_basedir/$pkgname"
  ln -s "$_systdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # these must be writable (group) for rpcemu to function
  # make sure you're in the "users" group!
  chown -R root:users "$_basedir"
  chmod -R g+w "$_basedir"/{cmos.ram,rpc.cfg,roms,hostfs}
}
