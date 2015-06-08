# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Army
# Contributor: Bastien Dejean <baskerville@lavabit.com>

_name=sxiv
pkgname="${_name}-git"
pkgver=2015.01.05.g47e6cd0
pkgrel=1
pkgdesc="Simple (or small or suckless) X Image Viewer"
arch=('i686' 'x86_64')
url="https://github.com/muennich/${_name}"
license=('GPL2')
depends=('imlib2' 'libexif' 'desktop-file-utils')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
install="${_name}.install"
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

prepare() {
  cd "${srcdir}/${_name}"
  # use your customisations  
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
