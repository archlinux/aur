# Contributor: Tony Lambiris <tony@libpcap.net>

_basename=wineasio
pkgname=${_basename}-git
pkgver=r99
pkgrel=1

pkgdesc="ASIO driver implementation for Wine"
url="https://github.com/wineasio/wineasio"
arch=('i686' 'x86_64' 'x86_64_v3')
license=('LGPL')

depends=('wine' 'jack')
depends_x86_64+=('lib32-jack')
makedepends_x86_64=('gcc-multilib')
provides=('wineasio')
conflicts=('wineasio')

source=(
  "git+https://github.com/wineasio/wineasio.git"
  "git+https://github.com/falkTX/rtaudio.git"
)
sha256sums=('SKIP' 'SKIP')
install="$pkgname".install

pkgver() {
  cd "$srcdir/${_basename}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_basename}"
  git submodule init
  git config submodule.rtaudio.url $srcdir/rtaudio
  git submodule update
}

build() {
  cd "${_basename}"
  
  if [[ "$CARCH" == 'x86_64' ]] || [[ "$CARCH" == 'x86_64_v3' ]]; then
    make 64
    cd build64
    winebuild -m64 --dll --fake-module -E ../wineasio.dll.spec asio.c.o main.c.o regsvr.c.o > wineasio.dll
    cd ..
  fi

  make 32
  cd build32
  winebuild -m32 --dll --fake-module -E ../wineasio.dll.spec asio.c.o main.c.o regsvr.c.o > wineasio.dll
}

package() {
  cd "${_basename}"
  if [[ "$CARCH" == 'x86_64' ]] || [[ "$CARCH" == 'x86_64_v3' ]]; then
    install -D -m755 build64/wineasio.dll "$pkgdir"/usr/lib/wine/x86_64-windows/wineasio.dll
    install -D -m755 build64/wineasio.dll.so "$pkgdir"/usr/lib/wine/x86_64-unix/wineasio.dll.so
  fi
  install -D -m755 build32/wineasio.dll "$pkgdir"/usr/lib32/wine/i386-windows/wineasio.dll
  install -D -m755 build32/wineasio.dll.so "$pkgdir"/usr/lib32/wine/i386-unix/wineasio.dll.so
}
