# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname=i8086emu-git
pkgver=0.9.2.r35.g1143f09
pkgrel=2
pkgdesc="cross-platform emulator for the Intel 8086 microprocessor"
arch=('x86_64')
url="https://sourceforge.net/projects/i8086emu/"
license=('GPL2')
depends=('gtk2' 'beep')
makedepends=('git' 'nasm' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://git.code.sf.net/p/i8086emu/git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}/${pkgname%-git}/"

  # i8086text
 ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --infodir=/usr/share/doc \
    usegtk=0
  make CFLAGS="-fPIC $CFLAGS" 

  # i8086gui
  mkdir cmake_build_gui
  cd cmake_build_gui
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr/ ..
  make
}

package() {

  # i8086text
  cd "$srcdir/${pkgname%-git}/${pkgname%-git}/"
  make DESTDIR="$pkgdir" install

  # i8086gui
  install -Dm755 \
    "$srcdir/${pkgname%-git}/${pkgname%-git}/cmake_build_gui/bin/i8086gui" \
    "$pkgdir/usr/bin/"

}
