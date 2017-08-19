# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=editorconfig-core-c-git
pkgver=0.12.1.r16.g6f3c40d
pkgrel=2
pkgdesc="EditorConfig core library written in C (for use by plugins supporting EditorConfig parsing)"
arch=('i686' 'x86_64')
url="https://github.com/editorconfig/editorconfig-core-c"
license=('BSD')
depends=('glibc' 'pcre')
makedepends=('git' 'cmake>=2.8.7')
provides=('editorconfig-core-c')
conflicts=('editorconfig-core-c')
source=('git+https://github.com/editorconfig/editorconfig-core-c.git')
sha256sums=('SKIP')


prepare() {
  cd "editorconfig-core-c"

  mkdir -p "_build"
}

pkgver() {
  cd "editorconfig-core-c"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "editorconfig-core-c/_build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_BUILD_TYPE=Release -DINSTALL_HTML_DOC=ON ../
  make
}

package() {
  cd "editorconfig-core-c/_build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/editorconfig-core-c/LICENSE"

  # name clash with python-editorconfig
  # https://bugs.archlinux.org/task/53365
  rm "$pkgdir/usr/bin/editorconfig"
}
