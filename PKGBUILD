# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron
_repo=https://github.com/ajbura/cinny
pkgname=(cinny-web)
pkgbase=cinny
pkgver=3.1.0
_commit=3cef074c9ef6744278e84b97580049a427d81121 # tag/v3.1.0
pkgrel=1
pkgdesc='Yet another matrix client — '
arch=(any)
url=https://cinny.in
license=(MIT)
depends=()
makedepends=(npm git)
source=("$pkgbase-web::git+$_repo.git#commit=$_commit")
sha512sums=('SKIP')

build() {
	cd "$pkgbase-web"
	export NODE_OPTIONS="--max_old_space_size=4096"
	npm install --legacy-peer-deps
	npm run build
}

package_cinny-web() {
	pkgdesc+='web version'
	backup=('etc/webapps/cinny/config.json')

	cd "$pkgbase-web"
	install -d "$pkgdir/usr/share/webapps/$pkgbase"
	cp -r dist/* "$pkgdir/usr/share/webapps/$pkgbase"
	install -d "$pkgdir/etc/webapps/$pkgbase"
	ln -s "$(realpath -m --relative-to="/etc/webapps/$pkgbase" "/usr/share/webapps/$pkgbase/config.json")" \
		"$pkgdir/etc/webapps/$pkgbase/config.json"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
