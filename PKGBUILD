# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

_name=sxiv
pkgname="${_name}-mao-git"
pkgver=2025.04.14
pkgrel=1
pkgdesc="Simple (or small or suckless) X Image Viewer with easymotion"
arch=('i686' 'x86_64')
url="https://github.com/DreamMaoMao/${_name}"
license=('GPL2')
depends=('imlib2' 'libexif' 'libxft' 'hicolor-icon-theme')
makedepends=('git')
provides=("${_name}")
conflicts=('sxiv' 'sxiv-git')
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git log -1 --format="%cd" --date=short | sed 's/-/./g'
}

prepare() {
  cd "${srcdir}/${_name}"
  # use your customisations if present
  [[ -f $SRCDEST/config.h ]] && cp "$SRCDEST"/config.h .

  # Allow custom FLAGS
  sed -i Makefile -e 's|^CFLAGS\s*=|CFLAGS +=|' -e 's|^LDFLAGS\s*=|LDFLAGS +=|'
}

build() {
  cd "$srcdir/${_name}"
  export CFLAGS="$CFLAGS $CPPFLAGS"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/${_name}"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  make -C icon PREFIX="/usr" DESTDIR="$pkgdir" install
  install -Dm644 sxiv.desktop "$pkgdir/usr/share/applications/${_name}.desktop"
}

# vim:set ts=2 sw=2 et:
