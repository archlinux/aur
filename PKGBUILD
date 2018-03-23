# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=remind-me
pkgver=2.0.1
pkgrel=1
pkgdesc="A simple reminder application for desktop and mobile, with synchronized reminders"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/RemindMe"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-datasync' 'qt5-mvvmwidgets' 'qt5-mvvmdatasyncwidgets')
makedepends=('qt5-tools' 'git' 'qpmx-qpmsource' 'qt5-mvvmdatasyncquick')
optdepends=("knotifications: Adds support for KDE notifications, which are more advanced (recompile required)"
			"repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/RemindMe.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            'c75adc9b16dae39669540352813516e698673a5f2f53034ad3b133c5cab701f3')

prepare() {
  mkdir -p build

  cd "$_pkgfqn"
  echo "INSTALL_HEADERS = /usr/include" >> .qmake.conf
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
  cd RemindMeLib
  make INSTALL_ROOT="$pkgdir" install
  cd ../daemons/RemindMeDesktopDaemon
  make INSTALL_ROOT="$pkgdir" install
  cd ../../gui/RemindMeCore
  make INSTALL_ROOT="$pkgdir" install
  cd ../RemindMeWidgets
  make INSTALL_ROOT="$pkgdir" install
  cd ../..

  # license
  cd "../$_pkgfqn"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
 
