# Maintainer: White-Oak <lpzhelud@gmail.com>
pkgname=servo-latest
pkgver=r20160711
pkgrel=2
pkgdesc="A modern, high-performance browser engine being developed for application and embedded use"
arch=('x86_64')
url="https://servo-builds.s3.amazonaws.com/index.html"
license=('custom:Mozilla Public License v2.0')
provides=('servo')
conflicts=('servo')
sha256sums=('SKIP'
            '7087917409c30bb5de3931dc35d18f60407837165d6f9dda941a27928e07512f'
            '3db78572e8657cca9e9446ce56a057b8a981eb41af318c49a5fe08e7a10fa52a')
source=(
	"https://servo-builds.s3.amazonaws.com/nightly/linux/servo-latest.tar.gz"
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
