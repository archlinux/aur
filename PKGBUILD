# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=paxchange
pkgver=1.0.0
pkgrel=3
pkgdesc="A tool to synchronize installed packages across multiple machines"
arch=('i686' 'x86_64')
url="https://github.com/Baum42/$pkgname"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-jsonserializer' 'pacman' )
makedepends=('qt5-tools' 'git' 'qpm' 'python')
optdepends=("pacaur: Adds support for synchronizing AUR packages"
			"repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Baum42/$pkgname.git#tag=$pkgver"
		'paxchange.rule')
sha256sums=('SKIP'
            'a30602ce3d02e36374c60bcb61bb97ed68ef580eddc86e4c1ac82dcdd90ebb6a')

prepare() {
  mkdir -p build

  cd "$_pkgfqn"
  ./qpminit.sh

  echo "PAXCHANGE_PLUGINS = pacman" >> .qmake.conf #build pacman plugin only
  echo "PS_STD_PLG = pacman" >> .qmake.conf #use pacman plugin as default
}

build() {
  cd build

  qmake -r "../$_pkgfqn/"
  make
  make lrelease
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  cd "../$_pkgfqn"
  # gui
  install -D -m644 gui/icons/$pkgname.svg "$pkgdir/usr/share/icons/hicolor/scalable/mimetypes/x-${pkgname}-database.svg"
  install -D -m644 gui/application-x-${pkgname}-database.xml "$pkgdir/usr/share/mime/packages/application-x-${pkgname}-database.xml"
  install -D -m644 gui/icons/$pkgname.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -D -m644 gui/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  # pacman plugin
  install -D -m644 plugins/pacman/${pkgname}_install.hook "$pkgdir/usr/share/libalpm/hooks/${pkgname}_install.hook"
  install -D -m644 plugins/pacman/${pkgname}_remove.hook "$pkgdir/usr/share/libalpm/hooks/${pkgname}_remove.hook"
  install -D -m755 plugins/pacman/${pkgname}.sh "$pkgdir/usr/share/libalpm/scripts/${pkgname}.sh"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}
