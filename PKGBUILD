# Maintainer: White-Oak <lpzhelud@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=servo-latest
_pkgname=servo
pkgver=r20221218
pkgrel=1
pkgdesc="A modern, high-performance browser engine being developed for application and embedded use"
arch=('x86_64')
url="https://download.servo.org/"
license=('custom:Mozilla Public License v2.0')
provides=('servo')
conflicts=('servo')
depends=('gst-plugins-bad' 'libunwind')
sha256sums=('5de29a420047dcfbc1054fd2b2961b9289f30236f31682409a9c9fedc96390da'
            '5dcb8790a243b850995fd1e9ebd3a8b47a9266a96e266891571934a3fcf9a578'
            '3db78572e8657cca9e9446ce56a057b8a981eb41af318c49a5fe08e7a10fa52a')
source=(
	"https://download.servo.org/nightly/linux/servo-latest.tar.gz"
	"Servo.desktop"
	"LICENSE"
)

pkgver(){
	time=$(curl -s -v -X HEAD "https://download.servo.org/nightly/linux/servo-latest.tar.gz" 2>&1\
	 | grep '^< Last-Modified:'\
	 | sed -n -e 's/^< Last-Modified: //p')
	date --date="$time" +r%Y%m%d
}

package() {
	install -Dm755 "$srcdir/Servo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

	install -dm755 "$pkgdir/usr/lib/servo"
	chmod -R 755 "$srcdir/servo"
	cp -r "$srcdir/servo" "$pkgdir/usr/lib/"

    install -d "$pkgdir/etc/profile.d"
    echo 'export PATH=$PATH:/usr/lib/servo' > "$pkgdir/etc/profile.d/${_pkgname}.sh"
    echo 'setenv PATH ${PATH}:/usr/lib/servo' > "$pkgdir/etc/profile.d/${_pkgname}.csh"
    chmod 755 "$pkgdir/etc/profile.d/${_pkgname}".{csh,sh}

    # Install a wrapper to avoid confusion about binary path
       install -Dm755 /dev/stdin "$pkgdir/usr/bin/servo" <<END
       #!/bin/sh
       exec /usr/lib/servo/servo "\$@"
END
}
