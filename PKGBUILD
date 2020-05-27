# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andre Klitzing <aklitzing () gmail () com>

_pkgname=msitools
pkgname=$_pkgname-git
pkgver=r825.7ac1e76
pkgrel=1
pkgdesc="Set of programs to inspect and build Windows Installer (.MSI) files (Git)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/msitools"
license=('GPL')
depends=('libgsf' 'gcab')
makedepends=('intltool' 'git' 'vala')
conflicts=('msitools')
provides=('msitools')
source=(git+https://github.com/GNOME/msitools.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_pkgname"
  arch-meson $srcdir/$_pkgname build
  ninja -C build

}

check() {
  meson test -C $srcdir/$_pkgname/build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" meson install -C $srcdir/$_pkgname/build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
