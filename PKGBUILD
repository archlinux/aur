# Maintainer: Proudzhu <proudzhu.fdu at gmail.com>
# Contributor:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=gpicview-git
_pkgname=gpicview
pkgver=r508.b17f1b8
pkgrel=1
pkgdesc='Lightweight image viewer'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde')
depends=('gtk3' 'desktop-file-utils' 'xdg-utils')
install=$_pkgname.install
makedepends=('pkgconfig' 'intltool')
optdepends=('librsvg: For SVG support')
provides=('gpicview')
conflicts=('gpicview')
source=("$_pkgname::git+http://git.lxde.org/git/lxde/gpicview.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  # Apply only one main category (FS#34684)
  sed -i '/^Categories=/ s/Utility;//' gpicview.desktop.in
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --sysconfdir=/etc --prefix=/usr --enable-gtk3
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
