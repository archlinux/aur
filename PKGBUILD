# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Thomas Queiroz <thomasqueirozb@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=qtspim
pkgver=9.1.22
pkgrel=1
pkgdesc="New user interface for spim, a MIPS simulator."
arch=('x86_64')
url="http://spimsimulator.sourceforge.net/"
license=('BSD')
depends=('qt5-base')
makedepends=('qt5-tools' 'subversion' 'icu')
source=("svn://svn.code.sf.net/p/spimsimulator/code/#revision=739")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/code/QtSpim"
  sed -i 's/zero_imm/is_zero_imm/g' parser_yacc.cpp
  sed -i 's/^int data_dir/bool data_dir/g' parser_yacc.cpp
  sed -i 's/^int text_dir/bool text_dir/g' parser_yacc.cpp
  sed -i 's/^int parse_error_occurred/bool parse_error_occurred/g' parser_yacc.cpp
}

build() {
  cd "$srcdir/code/QtSpim"

  qmake
  sed -i 's|$(COPY) help/qtspim.qhc help/qtspim.qhc;||' Makefile
  make
}

package() {
  cd "$srcdir/code"

  install -D QtSpim/QtSpim "$pkgdir/usr/bin/qtspim"

  install -d "$pkgdir/usr/share/qtspim"
  cp -r QtSpim/help "$pkgdir/usr/share/qtspim"

  install -Dm644 Documentation/spim.man "$pkgdir/usr/share/man/man1/qtspim.1"
  install -Dm644 Setup/qtspim_debian_deployment/qtspim.desktop \
    "$pkgdir/usr/share/applications/qtspim.desktop"
  install -Dm644 Setup/qtspim_debian_deployment/copyright \
    "$pkgdir/usr/share/licenses/$pkgname/copyright"
  install -Dm644 Setup/NewIcon48x48.png "$pkgdir/usr/share/qtspim/qtspim.png"
}
