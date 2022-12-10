# Contributor: Oleg `Kanedias` Chernovskiy <kanedias@xaker.ru>

pkgname=marcfs-git
pkgver=0.8.1.r0.ga09b634
pkgrel=1
pkgdesc="FUSE-based file system backed by Mail.ru Cloud storage"
arch=('i686' 'aarch64' 'x86_64')
url="https://gitlab.com/Kanedias/MARC-FS"
license=('GPL3')
depends=('fuse3' 'curl' 'jsoncpp')
optdepends=('jemalloc: to reduce memory pressure')
makedepends=('meson' 'cmake' 'pkgconf' 'gcc')
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

  printf "%s" "$(git describe --long --tags --always | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  git submodule init
  git config submodule.contrib/curlcpp.url $srcdir/curlcpp
  git config submodule.contrib/googletest.url $srcdir/googletest
  git -c protocol.file.allow=always submodule update

  mkdir build
  meson setup --buildtype=plain --prefix=/usr build .
  meson compile --jobs=$(nproc) -C build
}

package() {
  cd "$srcdir/${pkgname%-git}"

  meson install -C build --destdir "$pkgdir"
}
