# Maintainer: Daniel Kamil Kozar <dkk089@gmail.com>

pkgname=libfprint-vfs_proprietary-git
_reponame=libfprint-vfs_proprietary-driver
pkgver=r15.685bc48
pkgrel=1
pkgdesc="libfprint with support for the Validity/VFS proprietary driver"
arch=(x86_64)
url="https://github.com/rindeal/libfprint-vfs_proprietary-driver"
license=(LGPL)
depends=(libusb nss pixman glib2 vfs495-daemon)
makedepends=(git meson gtk-doc vfs495-daemon)
provides=(libfprint)
conflicts=(libfprint)
source=("git+https://github.com/rindeal/libfprint-vfs_proprietary-driver.git"
        'build-vfs_proprietary.patch')
md5sums=('SKIP'
         'e2380ef4f08f88cfe285b6cc710a2739')

pkgver() {
  cd "$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_reponame"
  git submodule init
  git submodule update --recursive
  cd libfprint
  patch -p1 -i "${srcdir}/build-vfs_proprietary.patch"
  cd libfprint/drivers
  ln -s ../../../vfs_proprietary
}

build() {
  cd "${_reponame}/libfprint"
  arch-meson -D drivers=vfs_proprietary -D x11-examples=false -D doc=false build
  ninja -v -C build
}

check() {
  cd "${_reponame}/libfprint/build"
  meson test
}

package() {
  DESTDIR="$pkgdir" ninja -C "${_reponame}/libfprint/build" install
}
