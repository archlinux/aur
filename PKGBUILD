# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_reponame=XUiDesigner
_pkgname=${_reponame,,}
pkgname=$_pkgname-git
pkgver=1.0.r10.g52b85db
pkgrel=1
pkgdesc='An easy to use tool to generator/design X11-based LV2 plugins (git version)'
arch=(x86_64)
url='https://github.com/brummer10/XUiDesigner'
license=(custom:0BSD)
depends=(cairo python xxd)
makedepends=(git lilv)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/brummer10/$_reponame.git"
        'libxputty::git+https://github.com/brummer10/libxputty.git')
md5sums=('SKIP'
         'SKIP')


pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.libxputty.url "$srcdir"/libxputty
  git -c protocol.file.allow=always submodule update

  # Don't run update-desktop-database at 'make install'
  # - handled by pacman
  sed -i -e '/update-desktop-database/d' XUiDesigner/Makefile
}

build() {
  cd $_pkgname
  make
}

package() {
  depends+=(liblilv-0.so libserd-0.so libsord-0.so libsratom-0.so)
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  # documentation
  install -Dm644 README*.md -t "$pkgdir"/usr/share/doc/$pkgname
  # license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
