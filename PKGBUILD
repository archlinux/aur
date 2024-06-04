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

_url=https://github.com/servo/servo-nightly-builds/releases/latest
provides=($_pkgname)
conflicts=($_pkgname)
depends=(gst-plugins-bad libunwind)
source=(
    $_pkgname-$pkgver.tar.gz::$_url/download/$pkgname.tar.gz
    $_pkgname-$pkgver.tar.gz.sha256::$_url/download/$pkgname.tar.gz.sha256
    https://raw.githubusercontent.com/servo/servo/main/LICENSE
    Servo.desktop
)
sha256sums=(
    SKIP
    SKIP
    1af2d2b02d9c86030d29ed77117ca7a1b0e4b6ff35bcf8eeb124867d0f5cb59e
    7a6cd816c35b9b42a27d83efbe72b3ac6bc79f2044153410fa434d7625f442ad
)

pkgver(){
    curl -sLI -o /dev/null -w %{url_effective} $_url | rev | cut -d/ -f1 | \
        rev | tr -d -
}

prepare() {
    sha256sum $_pkgname-$pkgver.tar.gz | sha256sum -c
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
