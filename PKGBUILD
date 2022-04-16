# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Army
# Contributor: Bastien Dejean <baskerville@lavabit.com>

_name=sxiv
pkgname="${_name}-photoorg-git"
pkgver=0.r907.e907737
pkgrel=1
pkgdesc="Simple X Image Viewer, photo organiser version"
arch=('i686' 'x86_64')
url="https://github.com/cdown/${_name}"
license=('GPL2')
depends=('imlib2' 'desktop-file-utils' 'xdg-utils' 'hicolor-icon-theme' 'libexif' 'libxft' 'giflib' 'libwebp')
makedepends=('git')
provides=(nsxiv)
conflicts=(nsxiv)
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf '0.r%s.%s' \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
}

# vim:set ts=2 sw=2 et:
