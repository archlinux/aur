# Maintainer:
# Contributor: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="fuse-ext2"
pkgname="$_pkgname-git"
pkgver=0.0.11.r2.ge8f1063
pkgrel=1
pkgdesc="A multi OS FUSE module to mount ext2, ext3 and ext4 file system devices and/or images with read write support"
url="https://github.com/alperakcan/fuse-ext2"
license=('GPL-2.0-only')
arch=('x86_64')

depends=(
  'e2fsprogs'
  'fuse2'
)
makedepends=(
  'git'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  autoreconf --install --symlink
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
