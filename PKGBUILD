# Maintainer: Ralph Torres <mail@ralphptorr.es>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: White-Oak <lpzhelud@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

_pkgname=servo
pkgname=$_pkgname-latest
pkgver=r20231113
pkgrel=1
pkgdesc='The embeddable, independent, memory-safe, modular, parallel web rendering engine'
arch=(x86_64)
url=https://servo.org
license=(MPL-2.0)

provides=(servo)
conflicts=(servo)
depends=(gst-plugins-bad libunwind)
source=(
    https://download.servo.org/nightly/linux/servo-latest.tar.gz
    https://download.servo.org/nightly/linux/servo-latest.tar.gz.sha256
    https://raw.githubusercontent.com/servo/servo/main/LICENSE
    Servo.desktop
)
sha256sums=(
)

pkgver(){
    time=$(curl -s -v -X HEAD
        https://download.servo.org/nightly/linux/servo-latest.tar.gz 2>&1 \
        | grep '^< Last-Modified:' \
        | sed -n -e 's/^< Last-Modified: //p')
    date --date="$time" +r%Y%m%d
}

package() {
    install -Dm755 "$srcdir"/Servo.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

    install -dm755 "$pkgdir"/usr/share/licenses/$pkgname/
    install -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/

    install -dm755 "$pkgdir"/usr/lib/servo
    chmod -R 755 "$srcdir"/servo
    cp -r "$srcdir"/servo "$pkgdir"/usr/lib/

    install -d "$pkgdir"/etc/profile.d
    echo 'export PATH=$PATH:/usr/lib/servo' > "$pkgdir"/etc/profile.d/$_pkgname.sh
    echo 'setenv PATH ${PATH}:/usr/lib/servo' > "$pkgdir"/etc/profile.d/$_pkgname.csh
    chmod 755 "$pkgdir"/etc/profile.d/$_pkgname.csh
    chmod 755 "$pkgdir"/etc/profile.d/$_pkgname.sh

    # install a wrapper to avoid confusion about binary path
    install -Dm755 /dev/stdin "$pkgdir"/usr/bin/servo <<END
        #!/bin/sh
        exec /usr/lib/servo/servo "\$@"
    END
}
