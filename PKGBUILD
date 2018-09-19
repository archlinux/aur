# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=syrem
pkgver=3.0.0
pkgrel=1
pkgdesc="A simple reminder application for desktop and mobile, with synchronized reminders"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/Syrem"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-datasync' 'qt5-mvvmwidgets' 'qt5-mvvmdatasyncwidgets' 'qt5-service')
makedepends=('qt5-tools' 'git' 'qpmx-qpmsource' 'qt5-mvvmdatasyncquick' 'python>=3.6.0')
optdepends=("knotifications: Adds support for KDE notifications, which are more advanced (recompile required)"
			"repkg: Automatically rebuild the package on dependency updates")
provides=('remind-me')
conflicts=('remind-me')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/Syrem.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '194396e4a4e7c6e0ffcc38e0b76f15b01fd111134e530bf295999ef126480cd3')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake "CONFIG+=no_quick" \
        "CONFIG+=no_auto_lupdate" \
        "CONFIG+=systemd_service" \
        "INSTALL_HEADERS+=/usr/include" \
        "../$_pkgfqn/"
  make qmake_all
  make
  make lrelease
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # license
  cd "../$_pkgfqn"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}
