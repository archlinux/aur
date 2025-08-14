# Maintainer: Aetf <aetf at unlimited-code dot works>
pkgname=libtsm-patched-git
_gitname=libtsm
pkgver=4.0.2.r41.gba2aea2
pkgrel=1
pkgdesc="Terminal-emulator State Machine. Patched flavor (using patches from http://github.com/Aetf/libtsm)"
arch=('x86_64' 'armv7h' 'aarch64')
url="http://www.freedesktop.org/wiki/Software/kmscon/$_gitname"
license=('MIT')
depends=(glibc)
makedepends=('meson' 'git' 'libxkbcommon')
provides=('libtsm-patched' 'libtsm')
conflicts=('libtsm' 'libtsm-patched')
options=(!libtool)
source=('git+https://github.com/Aetf/libtsm.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r "s/^$_gitname-//;s/^v//;s/([^-]*-g)/r\\1/;s/-/./g"
}

prepare() {
  cd "$srcdir/$_gitname"

  arch-meson . build -Dtests=false -Dgtktsm=false
}

build() {
  cd "$srcdir/$_gitname/build"
  meson compile
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_gitname/COPYING"
  install -Dm644 LICENSE_htable "$pkgdir/usr/share/licenses/$_gitname/LICENSE_htable"

  cd build
  meson install --destdir "$pkgdir/"
}

# vim:set ts=2 sw=2 et:
