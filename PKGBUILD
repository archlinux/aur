# Maintainer: kmille <arch@androidloves.me>
# Contributor: Hai Zhang <dreaming.in.code.zh@gmail.com>

pkgname=fprint_demo
pkgver=0.4
pkgrel=3
pkgdesc='A simple GTK+ application to demonstrate and test libfprint'"'"'s capabilities'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/fprint/fprint_demo/'
license=('GPL2')
depends=('gtk2' 'libfprint-0=0.7')
makedepends=(git)
groups=(fprint-git)
source=('https://github.com/dsd/fprint_demo/archive/v0.4.tar.gz')
md5sums=('41e78e420716f300b8776047b3c9fc5b')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's|libfprint|libfprint-0|' configure.ac
  sed -i 's|include <libfprint/|include <libfprint-0/|g' src/{*.c,*.h}

  # fix: -Werror=format-security
  sed -i 's|GTK_BUTTONS_CLOSE, error->message);|GTK_BUTTONS_CLOSE, "%s", error->message);|' src/verify.c
}

build() {
  cd "${pkgname}-${pkgver}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
