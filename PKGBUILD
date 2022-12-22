_pkgname=flycast
pkgname="$_pkgname"
pkgver=2.0
pkgrel=1
pkgdesc='A multi-platform Sega Dreamcast, Naomi and Atomiswave emulator'
arch=('x86_64' 'i686')
url="https://github.com/flyinghead/flycast"
license=('GPL2')
depends=('libgl' 'libzip' 'zlib' 'alsa-lib')
makedepends=('git' 'cmake' 'python' 'systemd')
provides=("$_pkgname" reicast)
conflicts=("$_pkgname")
source=(
  "$_pkgname"::"git+$url.git#tag=v$pkgver"
  "SDL"::"git+https://github.com/libsdl-org/SDL"
  "libchdr"::"git+https://github.com/rtissera/libchdr"
  "luabridge"::"git+https://github.com/vinniefalco/LuaBridge"
  "breakpad"::"git+https://github.com/flyinghead/mingw-breakpad"
)
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir/$_pkgname"

  # git submodule update --init --recursive
  for submodule in core/deps/{SDL,libchdr,luabridge,breakpad}; do
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git -c protocol.file.allow=always submodule update ${submodule}
  done
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -B build -S "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make -C build
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="${pkgdir}" install
}
