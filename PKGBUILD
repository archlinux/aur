# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>
# Contributor: Trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_pkgname=errands
pkgname=$_pkgname-c-git
pkgver=46.2.4.r393.g29181ee
pkgrel=1
pkgdesc="Todo application for those who prefer simplicity. (Rewrite in C. Experimental / potentially data-breaking)"
arch=('x86_64')
url="https://github.com/mrvladus/Errands"
license=('MIT')
depends=(
  'libadwaita'
  'gtksourceview5'
  'libical'
  'libportal'
  'curl'
  'webkitgtk-6.0'
)
makedepends=(
  'git'
  'blueprint-compiler'
  'gcc'
  'make'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  $pkgname::git+$url.git#branch=rewrite-in-c
  LICENSE::https://raw.githubusercontent.com/mrvladus/Errands/master/LICENSE
)
sha256sums=('SKIP'
            '6a13dd0186cd67d3533ead401ea891f7864388eb72f9d4b5bc76ade8adb040a0')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  # Todo: Remove when the dev adds a symbolic icon
  sed -i 's#$(DATA_DIR)/icons/io.github.mrvladus.Errands-symbolic.svg#$(DATA_DIR)/icons/io.github.mrvladus.List-symbolic.svg#g' Makefile
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" prefix=/usr install

  # Install license file downloaded from the master branch
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
