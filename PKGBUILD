# Maintainer: James An <james@jamesan.ca>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: 3ED <krzysztof1987 at googlemail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte-xfce
_pkgname=${pkgname%-xfce}
pkgver=3.11.91.r18.g40c8c60
pkgrel=3
pkgdesc="Menu editor for Xfce"
arch=('any')
license=('LGPL')
url="http://www.gnome.org"
groups=('xfce4-goodies')
depends=('gnome-menus' 'hicolor-icon-theme' 'python2-gobject' 'gtk3')
makedepends=('intltool' 'libxslt' 'docbook-xsl' 'git' 'gnome-common')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-xfce-devel")
install="$_pkgname.install"
source=("$_pkgname"::"git+https://gitlab.gnome.org/GNOME/$_pkgname.git"
        'unicode.patch')
md5sums=('SKIP'
         '171d6819609a8e16d7950314dc78b352')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname

  patch -p1 < ../unicode.patch
}

build() {
  cd $_pkgname

  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr PYTHON=/usr/bin/python2
  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install
  python2 -m compileall "$pkgdir"/usr/lib/python2.7/site-packages/Alacarte/
}
