# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>
# Contributor: Jaseem Abid <jaseemabid@gmail.com>

_pkgname=gnome-usage
pkgname=$_pkgname-git
pkgver=3.28.0.26.g3e1b5bf
pkgrel=1
pkgdesc="GNOME application to view information about use of system resources"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Apps/Usage"
license=(GPL3)
depends=(gtk3 libgtop)
makedepends=(git meson vala)
optdepends=('accountsservice: show user tags for processes')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname.git"
        "0001-Fix-build-with-vala-0.42.patch")
sha256sums=('SKIP'
            '9ffe8de8386f5f4aaadea3bca74509b38649ff98124e0f9b7dd37580c854ec34')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/./g;s/_/./g;'
}

prepare() {
  git -C $_pkgname apply $srcdir/0001-Fix-build-with-vala-0.42.patch
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
