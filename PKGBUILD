# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname=i8086emu-git
pkgver=0.9.2.r35.g1143f09
pkgrel=1
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

prepare() {
  cd "$srcdir/${pkgname%-git}/${pkgname%-git}/"
  rm -v \
    install-sh \
    mkinstalldirs
}

build() {
  cd "$srcdir/${pkgname%-git}/${pkgname%-git}/"

  # unset CFLAGS
  # ./configure \
  #   --prefix="/usr" \
  #   --bindir="/usr/bin" \
  #   --datadir="/usr/share" \
  #   --sysconfdir="/etc" \
  #   --localstatedir="/var" \
  #   --libdir="/usr/lib" \
  #   --infodir="/usr/share/info" \
  #   --mandir="/usr/share/man" \
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr/ ..
  time make
}

package() {

  cd "$srcdir/${pkgname%-git}/${pkgname%-git}"
  install -dm755 "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm644 docs/* README "$pkgdir/usr/share/doc/${pkgname%-git}/"

  cd "$srcdir/${pkgname%-git}/${pkgname%-git}/build"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 bin/* "$pkgdir/usr/bin/"

  install -dm755 "$pkgdir/usr/lib"
  install -Dm644 lib/* "$pkgdir/usr/lib"

}
