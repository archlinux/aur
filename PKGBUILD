# Maintainer: Rowan Lewis <rl@nbsp.io>

pkgname=jack-sanity-git
pkgver=r92.6b92bd6
pkgrel=1
pkgdesc='A scriptable environment for controlling jackdbus clients'
url='http://nbsp.io/jack-sanity/'
arch=('i686' 'x86_64')
depends=('nodejs' 'python2' 'jack2-dbus')
makedepends=('git')
provides=('jack-sanity')
conflicts=('jack-sanity')
license=('MIT')
source=('git+https://github.com/psychoticmeow/jack-sanity.git#branch=unstable')
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${pkgname%-git}

	msg 'Fetching NPM dependencies...'
	npm install --python="`which python2`"
}

package() {
	cd ${pkgname%-git}

	mkdir -p "$pkgdir/usr/lib"
	install -dm 755 "$pkgdir/usr/lib/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/share/licenses"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	mkdir -p "$pkgdir/usr/share/doc"
	install -Dm 644 docs.md "$pkgdir/usr/share/doc/${pkgname%-git}/docs.md"
	install -Dm 644 readme.md "$pkgdir/usr/share/doc/${pkgname%-git}/readme.md"

	for _appdir in bin examples lib node_modules; do
		cp -dpr --no-preserve=ownership "$_appdir" "$pkgdir/usr/lib/${pkgname%-git}/$_appdir"
	done

	for _appfile in package.json; do
		cp -dpr --no-preserve=ownership "$_appfile" "$pkgdir/usr/lib/${pkgname%-git}/$_appfile"
	done

	mkdir -p "$pkgdir/usr/bin"
	chmod +x "$pkgdir/usr/lib/${pkgname%-git}/bin/jack-sanity"
	ln -s "/usr/lib/${pkgname%-git}/bin/jack-sanity" "$pkgdir/usr/bin/jack-sanity"
}

