# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgbase=qpmx
pkgname=(qpmx qpmx-gitsource qpmx-qpmsource)
pkgver=1.0.0
pkgrel=2
pkgdesc="A frontend for qpm, to provide source and build caching"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/$pkgname"
license=('BSD')
depends=('qt5-base' 'qt5-jsonserializer')
makedepends=('qt5-tools' 'git')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/$pkgname.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '6029d42b05d32d99a6e673e5a7c95ac657e6258f88835f8aff05bde7535e543b')

prepare() {
  mkdir -p build
  
  cd "$_pkgfqn"
  git submodule update --init --recursive
  echo "CONFIG += no_installer" >> .qmake.conf
}

build() {
  cd build
  
  qmake -r "../$_pkgfqn/"
  make
}

package_qpmx() {
  optdepends=("qpmx-qpmsource: Adds support for cloning qpm packages"
			  "qpmx-gitsource: Adds support for cloning git and github packages"
			  "repkg: Automatically rebuild the package on dependency updates")
			  
  cd build/qpmx
  make INSTALL_ROOT="$pkgdir" install
  
  cd "../../$_pkgfqn"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgbase}.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}

package_qpmx-qpmsource() {
  depends=('qpmx' 'qpm')

  cd build/plugins/qpmsource
  make INSTALL_ROOT="$pkgdir" install
}

package_qpmx-gitsource() {
  depends=('qpmx' 'git')
  
  cd build/plugins/gitsource
  make INSTALL_ROOT="$pkgdir" install
}
