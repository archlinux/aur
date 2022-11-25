# Maintainer: éclairevoyant

_electron=electron17
_pkgname=midori
pkgname="$_pkgname-git"
pkgver=10.0.2.r99.ea22c22
pkgrel=1
pkgdesc='Lightweight Electron- and React-based web browser'
arch=('any')
url='https://astian.org/en/midori-browser-desktop'
license=('LGPL3')
depends=("$_electron" 'hicolor-icon-theme')
makedepends=('git' 'jq' 'libxcrypt-compat' 'npm' 'yarn')
_gitname='midori-desktop'
source=("git+https://gitlab.com/midori-web/$_gitname.git"
        $pkgname.sh
        $pkgname.desktop)
b2sums=('SKIP'
        'ed8e942ad985f6f8b501c3b7a7cc38e715481f9c9c8eeab429f960a1fad308194a09b2649d4274bdb42956804424000d2ea25585d2f0e40e5e8f87f910683294'
        'ba608913f8e279fafbfc7503ebf5bd41cb40455357caad15d6bb9bd70c9fdfaa8513d1efdc400adba6c00584c6508bdb0aa6f88e5f63d16e9d6f1835d9606262')

pkgver() {
	cd $_gitname
	printf "%s.r%s.%s" "$(jq '.version' <package.json | tr -d '"')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i "s/@ELECTRON@/$_electron/g" $pkgname.sh

	cd $_gitname
	yarn install --no-fund
}

build() {
	cd $_gitname
	yarn run build
	npx --no-install electron-builder --linux --publish never
}

package() {
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"

	cd $_gitname
	install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$pkgname/"
	install -Dm644 static/icons/icon.png "$pkgdir/usr/share/icons/hicolor/$pkgname.png"
}
