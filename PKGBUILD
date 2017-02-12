# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Simon Hafner <hanfersimon@gmail.com>

pkgname=libao-git
pkgver=1.2.2.r2.1f998f5
pkgrel=1
pkgdesc='Cross-platform audio output library and plugins'
url='http://xiph.org/ao/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('alsa-lib')
makedepends=('libpulse' 'git')
provides=("libao=${pkgver}-${pkgrel}")
conflicts=('libao')
backup=('etc/libao.conf')
source=("git+https://github.com/xiph/libao.git"
        'libao.conf')
sha1sums=('SKIP'
          '603f5e6715e7e50e1c8e8c1935c45a897c46e9af')


pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --enable-alsa-mmap

  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/libao.conf "${pkgdir}"/etc/libao.conf
}
