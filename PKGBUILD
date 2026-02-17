# Contributor: Antoine Viallon <antoine at lesviallon dot fr>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

_name=tilibs
pkgname=libticables-git
pkgver=1.18.r127.g791d2535
pkgrel=1
pkgdesc="TI Link Cable library"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL-2.0-only')
depends=('glibc' 'glib2' 'libusb')
makedepends=('git')
options=('!libtool')
install=libticables-git.install
conflicts=('libticables')
provides=('libticables')
source=(${_name}::git+https://github.com/debrouxl/tilibs.git
        69-libticables.rules)
md5sums=('SKIP'
         '2e38fe89764f129c567b06afbbdfdcd0')


pkgver() {
  cd ${_name}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_name}/${pkgname%-*}/trunk
  autoreconf -fi
}

build() {
  cd ${_name}/${pkgname%-*}/trunk
  ./configure --prefix=/usr --enable-libusb10
  make
}

package() {
  cd ${_name}/${pkgname%-*}/trunk
  make install DESTDIR="${pkgdir}"

  install -Dm644 "${srcdir}/69-libticables.rules" "${pkgdir}/usr/lib/udev/rules.d/69-libticables.rules"
}
