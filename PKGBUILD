# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=moneychanger-git
pkgver=20140509
pkgrel=1
pkgdesc="A QT/C++ client for Open-Transactions"
arch=('i686' 'x86_64')
depends=('open-transactions' 'qt5-base')
makedepends=('gcc' 'git' 'libidn' 'make')
url="https://github.com/Open-Transactions/Moneychanger"
license=('AGPL3')
source=(${pkgname%-git}::git+https://github.com/Open-Transactions/Moneychanger)
sha256sums=('SKIP')
provides=('moneychanger' 'moneychanger-qt')
conflicts=('moneychanger' 'moneychanger-qt')
install=moneychanger.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  qmake-qt5 "QMAKE_CXXFLAGS += -std=c++11" project/moneychanger.pro
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  for _license in `find doc/license -type f -printf '%f\n'`; do
    install -Dm 644 doc/license/$_license $pkgdir/usr/share/license/moneychanger/$_license
  done

  msg 'Installing documentation...'
  install -Dm 644 README.md $pkgdir/usr/share/doc/moneychanger/README.md
  for _doc in `find doc -mindepth 1 -maxdepth 1 -type f -printf '%f\n'`; do
    install -Dm 644 doc/$_doc $pkgdir/usr/share/doc/moneychanger/$_doc
  done

  msg 'Installing appdirs...'
  install -dm 755 $pkgdir/usr/share/moneychanger
  for _appdir in bitcoin-api jsoncpp moneychanger-qt nmcrpc project src; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/moneychanger/$_appdir
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
