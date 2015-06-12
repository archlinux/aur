# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=avida
pkgver=2.12.4
pkgrel=1
pkgdesc="A software platform to study evolution of digital organisms"
arch=('i686' 'x86_64')
url="http://avida.devosoft.org/"
license=('GPL3' 'custom')
depends=('gcc-libs' 'ncurses')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz"
        avida.patch)
md5sums=('db4a687190f9fcc8b8ae84613d536d0a'
         'a7ac844269d3f169f53e8e30005755f5')

prepare() {
  cd "$srcdir/avida-$pkgver-src"
  patch -p 1 < ../avida.patch
}

build() {
  cd "$srcdir/avida-$pkgver-src"
  cmake .
  make
}

package() {
  cd "$srcdir/avida-$pkgver-src"

  # Install binaries and config files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  install -m755 bin/avida* "${pkgdir}/opt/${pkgname}"
  install -m664 -g users avida-core/support/config/*.{cfg,org} "${pkgdir}/opt/${pkgname}"

  # Install headers and libraries
  mkdir -p "${pkgdir}/usr/"{include,lib}
  cp -r libs/apto/include/* "${pkgdir}/usr/include"
  cp -r lib/* "${pkgdir}/usr/lib"

  # Install launchers
  mkdir -p "${pkgdir}/usr/bin"
  echo 'cd /opt/avida && ./avida' > "${pkgdir}/usr/bin/avida"
  echo 'cd /opt/avida && ./avida-viewer' > "${pkgdir}/usr/bin/avida-viewer"
  chmod 755 "${pkgdir}/usr/bin/"{avida,avida-viewer}

  # Install documentation and Apto license
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r avida-core/documentation/* "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 libs/apto/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_APTO"
}
