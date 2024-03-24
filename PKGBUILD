# Maintainer: Daniël van de Giessen <aur@dvdgiessen.nl>
pkgname=dbus-app-launcher
pkgver=0.1.0.0
pkgrel=1
pkgdesc="Simple app launcher for D-Bus"
arch=('x86_64')
url="https://github.com/DvdGiessen/dbus-app-launcher"
license=("MIT")
depends=('ghc-libs' 'haskell-dbus' 'haskell-extra')
makedepends=('ghc' 'uusi')
source=("https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz" 'nl.dvdgiessen.dbusapplauncher.service')
sha256sums=('bb09fc801920df9d217a0993064c7848a9811d8b24bd26119aa963f327305490' 'bdf13de2547f626ff797070f493999577b9f499d72e904b5d7801e92d11b0387')

prepare() {
	uusi $pkgname-$pkgver/$pkgname.cabal
}

build() {
	cd $pkgname-$pkgver
	runhaskell Setup configure \
		-O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
		--dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
		--ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
		--ghc-option='-pie'
	runhaskell Setup build
}

package() {
	cd $pkgname-$pkgver
	runhaskell Setup copy --destdir="$pkgdir"
	install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
	rm -rf "$pkgdir"/usr/share/doc/
    cd ..
    install -D -m644 nl.dvdgiessen.dbusapplauncher.service -t "$pkgdir/usr/share/dbus-1/services/"
}
