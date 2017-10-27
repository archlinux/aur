# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

pkgname=php-ui
pkgver=2.0.0
pkgrel=1
pkgdesc='Cross platform UI development in PHP (contains example app).'
arch=('i686' 'x86_64')
url='https://github.com/krakjoe/ui'
license=('PHP')
depends=('php' 'libui-git')
source=("https://github.com/krakjoe/ui/archive/v$pkgver.tar.gz")
sha256sums=('ef41f5791956efdea2d507792798aa7aaff41b0d12ae7c05c038401286cb2d55')

prepare() {
	cd "$srcdir/ui-$pkgver"
	phpize
}

build() {
	cd "$srcdir/ui-$pkgver"
	./configure
	make
}

package() {
	php_config_dir="$pkgdir/etc/php/conf.d/"
	php_extensions_dir="$pkgdir/usr/lib/php/modules/"
	binaries_dir="$pkgdir/usr/bin/"
	mkdir -p "$php_extensions_dir" "$php_config_dir" "$binaries_dir"

	cp "$srcdir/ui-$pkgver/modules/ui.so" "$php_extensions_dir"

	echo "[PHP]" > "$php_config_dir/ui.ini"
	echo "extension=ui.so" >> "$php_config_dir/ui.ini"

	echo "#!/bin/php" > "$binaries_dir/php-ui-example"
	cat "$srcdir/ui-$pkgver/examples/gallery.php" >> "$binaries_dir/php-ui-example"
	chmod +x "$binaries_dir/php-ui-example"
}