# Maintainer: White-Oak <lpzhelud@gmail.com>
pkgname=servo-latest
pkgver=r20160711
pkgrel=3
pkgdesc="A modern, high-performance browser engine being developed for application and embedded use"
arch=('x86_64')
url="https://servo-builds.s3.amazonaws.com/index.html"
license=('custom:Mozilla Public License v2.0')
provides=('servo')
conflicts=('servo')
sha256sums=('SKIP'
			'SKIP'
            '5dcb8790a243b850995fd1e9ebd3a8b47a9266a96e266891571934a3fcf9a578'
            '3db78572e8657cca9e9446ce56a057b8a981eb41af318c49a5fe08e7a10fa52a')
source=(
	"https://servo-builds.s3.amazonaws.com/nightly/linux/servo-latest.tar.gz",
	"https://servo-builds.s3.amazonaws.com/doge-tiny.png",
	"Servo.desktop"
	"LICENSE"
)

pkgver(){
	time=$(curl -s -v -X HEAD "https://servo-builds.s3.amazonaws.com/nightly/linux/servo-latest.tar.gz" 2>&1\
	 | grep '^< Last-Modified:'\
	 | sed -n -e 's/^< Last-Modified: //p')
	date --date="$time" +r%Y%m%d
}

package() {
	install -Dm755 "$srcdir/Servo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

	install -dm755 "$pkgdir/opt/servo"
	chmod -R 755 "$srcdir/servo"
	cp -r "$srcdir/servo" "$pkgdir/opt"

	sed -i -e 's/\.\//\/opt\/servo\//g' "$srcdir/servo/runservo.sh"

	install -Dm755 "$srcdir/servo/runservo.sh" "$pkgdir/usr/bin/$pkgname"
}
