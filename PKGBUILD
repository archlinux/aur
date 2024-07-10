# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=turbo-editor-git
_pkgname=${pkgname%%-*}
pkgver=r450.697580e
pkgrel=1
arch=('x86_64')
pkgdesc="Text editor based on Scintilla and Turbo Vision"
url="https://github.com/magiblot/turbo"
license=('MIT')
provides=('turbo-editor')
conflicts=('turbo-editor')
depends=('file' 'libmagic.so'
         'gpm' 'libgpm.so'
         'ncurses' 'libncursesw.so')
optdepends=('wl-clipboard: Clipboard integration for Wayland'
            'xsel: Clipboard integration for Xorg'
            'xclip: Clipboard integration for Xorg')
makedepends=('cmake' 'git')
source=("git+$url.git"
        "tvision::git+${url%/*}/tvision.git")
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.deps/tvision.url "$srcdir"/tvision
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake $_pkgname \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build/
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/$_pkgname/COPYRIGHT" \
                 "$pkgdir/usr/share/licenses/$pkgname/License.txt"
  install -Dm644 "$srcdir/$_pkgname/source/scintilla/License.txt" \
                 "$pkgdir/usr/share/licenses/$pkgname/License-Scintilla.txt"
}
