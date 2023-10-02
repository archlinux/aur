# Contributor: Tony Lambiris <tony@libpcap.net>

_basename=wineasio
pkgname="${_basename}-git"
pkgver=1.1.0.r0.g56c3e9d
pkgrel=1

pkgdesc='ASIO driver implementation for Wine'
url='https://github.com/wineasio/wineasio'
arch=('i686' 'x86_64' 'x86_64_v3')
license=('LGPL')

depends=('wine' 'jack')
makedepends=('git')
depends_x86_64+=('lib32-jack')
makedepends_x86_64=('gcc-multilib')
provides=('wineasio')
conflicts=('wineasio')

source=(
  'wineasio'::'git+https://github.com/wineasio/wineasio.git'
  'rtaudio'::'git+https://github.com/falkTX/rtaudio.git'
  'setup_wineasio.sh'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '6ab4819215d9cb2fe5133380ab629538fa5de7ddb0bea82f1b4cef7904cb856d'
)

pkgver() {
  cd "$srcdir/${_basename}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd "${_basename}"

  _submodules=(
    'rtaudio'
  )
  for submodule in ${_submodules[@]} ; do
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git -c protocol.file.allow=always submodule update ${submodule}
  done
}

build() {
  cd "${_basename}"

  if [[ "$CARCH" == 'x86_64' ]] || [[ "$CARCH" == 'x86_64_v3' ]]; then
    make 64
    pushd build64
    winebuild -m64 --dll --fake-module -E ../wineasio.dll.spec asio.c.o main.c.o regsvr.c.o > wineasio.dll
    popd
  fi

  make 32
  cd build32
  winebuild -m32 --dll --fake-module -E ../wineasio.dll.spec asio.c.o main.c.o regsvr.c.o > wineasio.dll
}

package() {
  cd "${_basename}"
  if [[ "$CARCH" == 'x86_64' ]] || [[ "$CARCH" == 'x86_64_v3' ]]; then
    install -dm755 "$pkgdir"/usr/lib/wine/x86_64-{windows,unix}
    install -m644 build64/wineasio64.dll "$pkgdir"/usr/lib/wine/x86_64-windows/
    install -m644 build64/wineasio64.dll.so "$pkgdir"/usr/lib/wine/x86_64-unix/
  fi
  install -dm755 "$pkgdir"/usr/lib32/wine/i386-{windows,unix}
  install -m644 build32/wineasio32.dll "$pkgdir"/usr/lib32/wine/i386-windows/
  install -m644 build32/wineasio32.dll.so "$pkgdir"/usr/lib32/wine/i386-unix/

  cd "$srcdir"
  install -D -m755 setup_wineasio.sh "$pkgdir"/usr/bin/setup_wineasio
}
