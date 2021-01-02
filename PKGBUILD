# Maintainer: nomisge <nomisge @ live . de>
pkgname=carddav2fb-git
pkgver=2.0.r42.g733285e
pkgrel=1
pkgdesc="Download CardDAV VCards and upload as phonebook to AVM FRITZ!Box"
arch=('any')
url="https://github.com/andig/carddav2fb"
license=('AGPL' 'MIT')
depends=('php')
makedepends=('git' 'unzip' 'composer')
provides=("${pkgname%-git}")
backup=('etc/carddav2fb/config.php')
install=
source=("${pkgname%-git}::git+https://github.com/andig/carddav2fb.git"
	'carddav2fb.sh'
	'carddav2fb.service'
	'carddav2fb.timer'
	'carddav2fb-php.ini')
sha256sums=('SKIP'
            '7f3b937e6ef2d6a172b2175fd68989e60c3066d96b71d71013387a2bd1ec7184'
            'f50dcafe9c0bde004f6fa46b2e0b67159fb4ab1f295f973d7510f886c44f2b2c'
            '07afba52ebf80aad53639d55bd39a6c083987b1750b3370dea4bd9b140c57be3'
	    'ee218c032953a381c2cf24c90f11e519b9ae47fdc5d16afaae9df655dcf66b3e')
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	#cd "${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	#cd "${pkgname%-git}"
	composer install --no-dev
}

package() {
	cd "$srcdir/${pkgname%-git}"
	#cd "${pkgname%-git}"

	# copy everything to /opt
	install -d "$pkgdir/opt/${pkgname%-git}"
	cp -ar ./ "$pkgdir/opt/${pkgname%-git}/"

	# clean up
	rm "$pkgdir/opt/${pkgname%-git}/Dockerfile"
	rm -R "$pkgdir/opt/${pkgname%-git}/.git"
	rm "$pkgdir/opt/${pkgname%-git}/.gitignore"
	rm "$pkgdir/opt/${pkgname%-git}/docker-entrypoint"


	# wrapper in /usr/bin
	install -d "$pkgdir/usr/bin"
	install -Dm 755 "$srcdir/carddav2fb.sh" "$pkgdir/usr/bin/carddav2fb"
	# configurations in /etc -> symlink  
	install -d "$pkgdir/etc/${pkgname%-git}"
	install -Dm 644 "$pkgdir/opt/${pkgname%-git}/config.example.php" "$pkgdir/etc/${pkgname%-git}/config.php"
	#install -Dm 644 "$pkgdir/opt/${pkgname%-git}/config.example.cron" "$pkgdir/etc/${pkgname%-git}/config.example.cron"
	ln -s "/etc/${pkgname%-git}/config.php" "$pkgdir/opt/${pkgname%-git}/config.php"

	# php configuration
	install -d "$pkgdir/etc/php/conf.d"
	install -Dm 644 "$srcdir/carddav2fb-php.ini" "$pkgdir/etc/php/conf.d/carddav2fb-php.ini"

	# Install systemd service & timer
	install -d "$pkgdir/usr/lib/systemd/system"
	install -Dm 644 "$srcdir/carddav2fb.service" "$pkgdir/usr/lib/systemd/system/carddav2fb.service"
	install -Dm 644 "$srcdir/carddav2fb.timer" "$pkgdir/usr/lib/systemd/system/carddav2fb.timer"
}
