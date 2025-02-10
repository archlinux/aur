# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=socialsharing
pkgbase=nextcloud-app-socialsharing
pkgname=(
         'nextcloud-app-socialsharing-bluesky'
         'nextcloud-app-socialsharing-diaspora'
         'nextcloud-app-socialsharing-email'
         'nextcloud-app-socialsharing-facebook'
         'nextcloud-app-socialsharing-telegram'
         'nextcloud-app-socialsharing-twitter'
         'nextcloud-app-socialsharing-whatsapp'
)
pkgver=3.3.0
pkgrel=1
arch=("any")
url="https://github.com/nextcloud/socialsharing"
license=('AGPL-3.0-or-later')
makedepends=("npm" "composer" "yq")
groups=('nextcloud-apps')
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgbase.patch")
sha512sums=('2d7579bd8f3f553677d33dca4ee2404f9ae32def225a2356ce830a72629ff20eca0530df4f3aef02eadedae5fa88bed290d84ee63cfe181f6a4a5d114d3470b4'
            'b9065297bc55390cb83ac5a9c07aa80321399a25fb6bd801a9e53b7e1395091f1eb35f1b493577e1d6b91d6977231ba15f3067117ce46ffa80fd41850124c85b')

prepare() {
	cd "$_appname-$pkgver"
	for i in $(ls -d socialsharing_*); do
		cd "$srcdir/$_appname-$pkgver/$i"
		patch -p1 -i "$srcdir/$pkgbase.patch" Makefile
	done
}

_get_nextcloud_versions() {
	_app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "appinfo/info.xml"| sed 's/"//g')"
	_app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "appinfo/info.xml"| sed 's/"//g')"
	_app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

package_app() {
	cd "$_appname-$pkgver/${_appname}_$1"
	local _app_min_major_version
	local _app_max_major_version
	_get_nextcloud_versions
	depends=("nextcloud>=$_app_min_major_version" "nextcloud<$_app_max_major_version")
	make appstore
	mkdir -p "$pkgdir/usr/share/webapps/nextcloud/apps"
	local _appdir="$pkgdir/usr/share/webapps/nextcloud/apps/${_appname}_$1"
	cp -a "build/artifacts/sign/${_appname}_$1" "$_appdir"
}

package_nextcloud-app-socialsharing-bluesky() {
	pkgdesc='Enable direct sharing of files via Bluesky, using shared links.'
	package_app bluesky
}

package_nextcloud-app-socialsharing-diaspora() {
	pkgdesc='Enable direct sharing of files via Diaspora, using shared links.'
	package_app diaspora
}

package_nextcloud-app-socialsharing-email() {
	pkgdesc='Enable direct sharing of files via email, using shared links.'
	package_app email
}

package_nextcloud-app-socialsharing-facebook() {
	pkgdesc='Enable direct sharing of files via Facebook, using shared links.'
	package_app facebook
}

package_nextcloud-app-socialsharing-telegram() {
	pkgdesc='Enable direct sharing of files via Telegram, using shared links.'
	package_app telegram
}

package_nextcloud-app-socialsharing-twitter() {
	pkgdesc='Enable direct sharing of files via Twitter, using shared links.'
	package_app twitter
}

package_nextcloud-app-socialsharing-whatsapp() {
	pkgdesc='Enable direct sharing of files via WhatsApp, using shared links.'
	package_app whatsapp
}
