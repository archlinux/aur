pkgname=ccache-git
pkgver=v3.2.2_12_g26b042a
pkgrel=1
pkgdesc="A compiler cache"
arch=('i686' 'x86_64')
url="http://ccache.samba.org/"
license=('GPL3')
depends=('zlib')
makedepends=('git' 'asciidoc')
conflicts=('ccache')
provides=('ccache')
source=("git://git.samba.org/ccache.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/ccache
  git describe | sed 's/[- ]/_/g'
}

build() {
  cd ${srcdir}/ccache
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc

  make
  make docs
}

check() {
  cd ${srcdir}/ccache
  make test
}

package() {
  cd ${srcdir}/ccache

  install -Dm 755 ccache ${pkgdir}/usr/bin/ccache
  install -Dm 644 ccache.1 ${pkgdir}/usr/share/man/man1/ccache.1

  install -d ${pkgdir}/usr/lib/ccache/bin
  ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/cc 
  ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/gcc
  ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/g++
  ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/cpp
  ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/c++
  ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-cc
  ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-gcc
  ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-g++
  ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-cpp
  ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-c++
}
