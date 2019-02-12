# Maintainer: JP Cimalando <jp-dev@inbox.ru>
pkgname=fmidi-git
pkgver=v0.1.r31.666cd72
pkgrel=1
pkgdesc="Library and programs to read and play back MIDI files"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/fmidi"
license=('custom')
groups=()
depends=('libev' 'rtmidi')
makedepends=('git' 'cmake' 'boost')
provides=('fmidi')
conflicts=('fmidi')
replaces=()
backup=()
options=('staticlibs')
install=
source=('fmidi::git+https://github.com/jpcima/fmidi.git'
        'fmt::git+https://github.com/fmtlib/fmt.git')
md5sums=('SKIP'
         'SKIP')
noextract=()

pkgver() {
  cd "$srcdir/fmidi"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/fmidi"
  git submodule init
  git config submodule.thirdparty/fmt.url "$srcdir"/fmt
  git submodule update
}

build() {
  install -d "$srcdir/fmidi-static"
  cd "$srcdir/fmidi-static"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFMIDI_STATIC=ON \
        ../fmidi
  make

  install -d "$srcdir/fmidi-shared"
  cd "$srcdir/fmidi-shared"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFMIDI_STATIC=OFF \
        ../fmidi
  make
}

package() {
  make DESTDIR="$pkgdir/" -C "$srcdir/fmidi-static" install
  make DESTDIR="$pkgdir/" -C "$srcdir/fmidi-shared" install
  install -D -m644 "$srcdir/fmidi/LICENSE.md" \
          "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
