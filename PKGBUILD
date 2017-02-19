# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=npapi-vlc-gtk3
_pkgname=npapi-vlc
pkgver=2.2.5
pkgrel=1
pkgdesc="The modern VLC Epiphany (NPAPI) plugin (GTK3 version)"
arch=('i686' 'x86_64')
url="https://code.videolan.org/videolan/npapi-vlc"
license=('GPL')
depends=('gtk3' 'vlc')
makedepends=('git' 'npapi-sdk')
conflicts=($_pkgname)
provides=($_pkgname)
# This package uses version tags from Git, because there are no official releases
source=("git+https://code.videolan.org/videolan/$_pkgname.git#tag=$pkgver"
        "git+https://code.videolan.org/videolan/libvlcpp.git"
        'gtk3-port.patch')
md5sums=('SKIP'
         'SKIP'
         '31278df3a741294806b04ba21cfa13b7')

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.vlcpp.url "$srcdir/libvlcpp"
  git submodule update

  # GTK3 port
  patch -Np1 -i ../gtk3-port.patch
}

build() {
  cd "$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
}
