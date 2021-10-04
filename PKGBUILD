# Maintainer: Alberto Redondo <albertomost at gmail dot com>

_pkgname=tabbed-flexipatch
pkgname=$_pkgname-git
pkgver=r9.73bc3d6
pkgrel=1
pkgdesc='Simple generic tabbed fronted to xembed aware applications (flexipatch version)'
arch=('i686' 'x86_64')
url='https://github.com/bakkeby/tabbed-flexipatch'
license=('MIT/X')
depends=('libxft')
makedepends=('git')
provides=('tabbed')
conflicts=('tabbed')
source=("$_pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  if [[ -f "$SRCDEST/config.h" ]]; then
    echo "  -> config.h found."
    cp -f "$SRCDEST/config.h" config.h
  else
    cp -f config.def.h "$SRCDEST/config.h"
    echo "  -> Using default config. config.h has been created in $SRCDEST. Edit according to your preferences and rebuild."
  fi

  if [[ -f "$SRCDEST/patches.h" ]]; then
    echo "  -> patches.h found."
    cp -f "$SRCDEST/patches.h" patches.h
  else
    cp -f patches.def.h "$SRCDEST/patches.h"
    echo "  -> Not using any patches. patches.h has been created in $SRCDEST. Edit according to your preferences and rebuild."
  fi

  if [[ -f "$SRCDEST/config.mk" ]]; then
    echo "  -> config.mk found."
    cp -f "$SRCDEST/config.mk" config.mk
  else
    cp -f config.mk "$SRCDEST/config.mk"
    echo "  -> Using default config.mk. config.mk has been created in $SRCDEST. Edit if using alpha patch."
  fi
}

build() {
  cd $_pkgname

  make PREFIX=/usr
}

package() {
  cd $_pkgname

  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
