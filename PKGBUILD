# Maintainer: Carson Rueter <roachh@protonmail.com>

pkgname='denise-git'
_pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator - Git version'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL')
pkgver=v1.1.3.1.r168.g70b30790
pkgrel=1
source=('git+https://bitbucket.org/piciji/denise.git')
sha256sums=('SKIP')
provides=('denise')
conflicts=('denise-bin' 'denise')
depends=('sdl2' 'gtk3' 'openal' 'libpulse')
makedepends=('git')
arch=('i686' 'x86_64')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/icons/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/lib/$_pkgname/translation/
  mkdir -p $pkgdir/usr/lib/$_pkgname/data/
  mkdir -p $pkgdir/usr/lib/$_pkgname/fonts/
  mkdir -p $pkgdir/usr/lib/$_pkgname/img/
  mkdir -p $pkgdir/usr/lib/$_pkgname/shader/

  install -Dm755 out/denise $pkgdir/usr/bin/$_pkgname
  install -Dm644 data/img/$_pkgname.png $pkgdir/usr/share/icons/$_pkgname.png
  install -Dm644 data/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -Dm644 data/translation/* $pkgdir/usr/lib/$_pkgname/translation
  install -Dm644 data/data/* $pkgdir/usr/lib/$_pkgname/data
  install -Dm644 data/fonts/*.ttf $pkgdir/usr/lib/$_pkgname/fonts
  install -Dm644 data/img/bundle/* $pkgdir/usr/lib/$_pkgname/img
  cp -r data/shader $pkgdir/usr/lib/$_pkgname/
}

