# Maintainer: doggone
# Contributor: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Army
# Contributor: Bastien Dejean <baskerville@lavabit.com>

_name=sxiv
pkgname="${_name}-pango-git"
pkgver=2016.07.28
pkgrel=1
pkgdesc='Simple X Image Viewer'
arch=('i686' 'x86_64')
url="https://github.com/Hjdskes/${_name}"
license=('GPL2')
depends=('imlib2' 'desktop-file-utils' 'xdg-utils' 'hicolor-icon-theme' 'libexif' 'pango')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git+${url}.git#branch=pango")
md5sums=('SKIP')

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
