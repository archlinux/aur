# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Matt Coffin <mcoffin13 at gmail.com>

pkgname=bzip2-git
pkgver=r66.ad723d6
pkgrel=1
pkgdesc="A parallel, SMP-based, bzip2-compatible compression utility"
arch=('i686' 'x86_64')
url="http://lbzip2.org/"
license=('GPL3')
depends=('glibc')
makedepends=('perl' 'git' 'meson' 'ninja')
provides=('bzip2')
conflicts=('bzip2')

_gitname="bzip2"
source=($_gitname'::git+https://gitlab.com/federicomenaquintero/bzip2.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  meson builddir --prefix=/usr
  ninja -C builddir
}

check() {
  cd "$srcdir/$_gitname"
  meson test -C builddir --print-errorlogs
}

package() {
  cd "$srcdir/$_gitname"
  DESTDIR="$pkgdir" meson install -C builddir
}
