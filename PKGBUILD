# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=anirem-git
pkgver=2.0.1
pkgrel=1
pkgdesc="A tool to passivly check for updates on seasons, for proxer.me"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/AniRem"
license=('BSD')
depends=('qt5-base' 'qt5-datasync' 'qt5-mvvmwidgets' 'qt5-restclient>=2.0.0' 'qt5-mvvmdatasyncwidgets' 'qt5-svg')
makedepends=('qt5-tools' 'git' 'qpmx-qpmsource')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
provides=('seasonproxer' 'anirem')
conflicts=('seasonproxer' 'anirem')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/AniRem.git#tag=$pkgver"
		"$pkgname.rule"
		"manual://proxer-api-key.h")
DLAGENTS+=('manual::/usr/bin/echo The proxer API key must be provided externally. Check the README.md on upstream to see how to get/handle that file; exit 1;')
sha256sums=('SKIP'
            '545f8b65bab4cd044f3cef353d0be2ac02420288a32950f35515eed5fe4ac033'
            'SKIP')

prepare() {
  mkdir -p build

  cd "$_pkgfqn"
  echo "INSTALL_HEADERS = /usr/include" > install.pri
  echo "CONFIG += no_quick" >> install.pri
  ln -s ../proxer-api-key.h
}

build() {
  cd build

  qmake "../$_pkgfqn/"
  make qmake_all
  make
  make lrelease
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
  ln -s Ani-Rem "$pkgdir/usr/bin/anirem"

  # license
  cd "../$_pkgfqn"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
