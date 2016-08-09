# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Madotsuki <madotsuki at cock dot li>

_pkgname=utox
pkgname=utox-multidevice-static-git
pkgver=0.9.7.r46.g1e74d75
pkgrel=1
pkgdesc='Lightweight Tox client'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/GrayHatter/uTox'
license=('GPL3')
depends=('desktop-file-utils'
         'fontconfig'
         'libfilteraudio-git'
         'hicolor-icon-theme'
         'libdbus'
         'libxext'
         'libxrender'
         'openal'
         'toxcore'
         'v4l-utils')
makedepends=('git')
optdepends=('gtk3: GTK file picker')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+https://github.com/GrayHatter/uTox.git#branch=multidevice"
	"toxcore::git+https://github.com/GrayHatter/toxcore.git#branch=multi-device"
)
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd toxcore

  autoreconf -if
  ./configure --disable-ntox --disable-tests --disable-shared --prefix=$PWD
  make && make install

  cd "../$pkgname"
  CFLAGS=-I../toxcore/include LDFLAGS=-L../toxcore/lib make
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
