# Maintainer: Marcin Kornat <rarvolt+aur@gmail.com>

pkgname=esp-open-sdk
pkgver=1.4.0
pkgrel=2
pkgdesc="Free and open (as much as possible) integrated SDK for ESP8266 chips"
arch=('i686' 'x86_64')
url="https://github.com/pfalcon/esp-open-sdk"
license=('GPL')
groups=()
depends=('python' 'python2' 'python-pyserial' 'python2-pyserial')
makedepends=('git')
provides=('esp-open-sdk')
conflicts=('esp-open-sdk-git')
options=(!strip)

source_i686=("https://bintray.com/artifact/download/riban/generic/$pkgname-$pkgver-linux-x86.tar.gz")
source_x86_64=("https://bintray.com/artifact/download/kireevco/generic/$pkgname-$pkgver-linux-x86_64.tar.gz")

md5sums_i686=('a05857285a890b30f112ac571be86cc6')
md5sums_x86_64=('352a5f1b0c7069a8c9fe84e24acbd5ec')

noextract=("$pkgname-$pkgver-linux-x86.tar.gz"
	   "$pkgname-$pkgver-linux-x86_64.tar.gz")

prepare() {
	mkdir -p "$pkgname"
	case $CARCH in
	  'i686')
		tar zxf "$pkgname-$pkgver-linux-x86.tar.gz" -C "$pkgname" ;;
	  'x86_64')
		tar zxf "$pkgname-$pkgver-linux-x86_64.tar.gz" -C "$pkgname" ;;
	  *)
		echo "Error: Unknown arch [$CARCH]."
		return 1 ;;
	esac

	sed -i 's/python/python2/' "$pkgname/esptool/esptool.py"
}

package() {
	mkdir -p "$pkgdir/opt"
	cp -r "$srcdir/$pkgname" "$pkgdir/opt/$pkgname"
	
	mkdir -p "$pkgdir/etc/profile.d"
	echo "export ESP_HOME=\"/opt/esp-open-sdk\"" > "$pkgdir/etc/profile.d/esp-open-sdk.sh"
	chmod +x "$pkgdir/etc/profile.d/esp-open-sdk.sh"
}
