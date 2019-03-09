# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=syrem
pkgver=3.0.0
pkgrel=3
pkgdesc="A simple reminder application for desktop and mobile, with synchronized reminders"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/Syrem"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-datasync' 'qt5-mvvmwidgets' 'qt5-mvvmdatasyncwidgets' 'qt5-service>=2.0.0')
makedepends=('qt5-tools' 'git' 'qpmx-qpmsource' 'qt5-mvvmdatasyncquick' 'python>=3.6.0')
optdepends=("knotifications: Adds support for KDE notifications, which are more advanced (recompile required)"
			"repkg: Automatically rebuild the package on dependency updates")
provides=('remind-me')
conflicts=('remind-me')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/Syrem.git#tag=$pkgver"
		"qtservice.patch"
		"$pkgname.rule")
sha256sums=('SKIP'
            'db5a25f08e206e44f47027a9a0d9f863d876383aa85b14c98b6a7928841edfbb'
            '38c7bde0526c138c22b54b98b3b3482e1f2d9dfc14a6a27f3f64d9b3f931a40c')

prepare() {
  mkdir -p build
  cd "$_pkgfqn"
  git apply ../qtservice.patch
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
  ln -s syrem "$pkgdir/usr/bin/remind-me"
  ln -s syremd "$pkgdir/usr/bin/remind-med"

  # license
  cd "../$_pkgfqn"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}
