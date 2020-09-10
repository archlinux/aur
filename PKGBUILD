# Maintainer: Adis Hamzić <adis at hamzadis dot com>

pkgname=foo2zjs-minimal-nightly
pkgver=20200610
pkgrel=1
pkgdesc="foo2zjs printer drivers with the bare minimum compilation options to ensure package stability."
url="http://foo2zjs.rkkda.com/"
license=('GPL' 'custom')
depends=('cups' 'ghostscript')
makedepends=('foomatic-db-engine' 'foomatic-db' 'curl' 'bc')
conflicts=('foo2zjs-nightly')
provides=('foo2zjs-nightly')
arch=('i686' 'x86_64')
source=("http://foo2zjs.rkkda.com/foo2zjs.tar.gz")
md5sums=('SKIP')

pkgver() {
  local modified=$(curl -s 'http://foo2zjs.rkkda.com' | sed -nre 's|.*Tarball last modified: <i>(.+)</i>.*|\1|p')
  if ! [[ "$modified" ]]; then
    echo "Warning: can't find package date, using today"
  fi

  date "+%Y%m%d" -u -d "$modified"
}

build() {
  cd "${srcdir}/foo2zjs"
  make all
}

package() {
  cd "${srcdir}/foo2zjs"
  install -d "${pkgdir}"/usr/share/{applications,pixmaps,cups/model}
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="${pkgdir}" UDEVBIN="${pkgdir}/usr/bin" install
}
