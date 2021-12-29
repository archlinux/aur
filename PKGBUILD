# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Dmitriy Bogdanov <di72nn at gmail dot com>
# Contributor: Robin Hahling <robin.hahling@gw-computing.net>
# Contributor: Kevin Gillieron <kevin.gillieron@gw-computing.net>

pkgname="shaarli-git"
pkgver=r2229.aeda845b
pkgrel=1
_commit="aeda845b3cafc560b976fec7eeebd039a7b779a2"
pkgdesc="The personal, minimalist, super-fast, database free, bookmarking service - community repo"
url="https://shaarli.readthedocs.io/en/master/"
license=("ZLIB")
arch=("any")
provides=("shaarli")
conflicts=("shaarli")
depends=("php>=7.1")
makedepends=("composer" "yarn" "mkdocs")
source=("shaarli::git+https://github.com/shaarli/Shaarli.git")
sha256sums=('SKIP')
options=("!strip")

pkgver(){
 cd "shaarli"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
 cd "shaarli"
 # backend
 composer install --no-interaction --no-dev
 # frontend
 yarn install
 yarn run build
 # translations
 find "inc/languages/" -name "shaarli.po" -execdir msgfmt "shaarli.po" -o "shaarli.mo" \;
 # documentation
 mkdocs build --clean
 find "doc/html/" -type f -exec chmod a-x '{}' \;
}

package() {
 cd "shaarli"
 install -d "$pkgdir/usr/share/webapps/shaarli"
 install -d "$pkgdir/var/lib/shaarli"

 mv "cache" "data" "pagecache" "tmp" "$pkgdir/var/lib/shaarli"
 ln -s "/var/lib/shaarli/"{cache,data,pagecache,tmp} .
 install -D -m 644 "COPYING" "$pkgdir/usr/share/licenses/shaarli/COPYING"

 mv * "$pkgdir/usr/share/webapps/shaarli"

 chown -R root:http "$pkgdir/usr/share/webapps/shaarli"
 find "$pkgdir/usr/share/webapps/shaarli/plugins" -type d -exec chmod 775 {} \;
 chown -R http:http "$pkgdir/var/lib/shaarli"
 chmod 750 "$pkgdir/var/lib/shaarli"

}
