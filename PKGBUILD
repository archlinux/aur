# Contributor: Oleg `Kanedias` Chernovskiy <kanedias@xaker.ru>

pkgname=marcfs-git
pkgver=0.6.0.r0.801e616
pkgrel=1
pkgdesc="FUSE-based file system backed by Mail.ru Cloud storage"
arch=('i686' 'x86_64')
url="https://gitlab.com/Kanedias/MARC-FS"
license=('GPL3')
depends=('fuse3' 'curl' 'jsoncpp')
optdepends=('jemalloc: to reduce memory pressure')
makedepends=('make' 'cmake' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://gitlab.com/Kanedias/MARC-FS.git"
                         "git+https://github.com/JosephP91/curlcpp.git"
                         "git+https://github.com/google/googletest.git")
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  git submodule init
  git config submodule.contrib/curlcpp.url $srcdir/curlcpp
  git config submodule.contrib/googletest.url $srcdir/googletest
  git submodule update

  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  make DESTDIR="$pkgdir/" install
}
