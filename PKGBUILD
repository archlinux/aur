# Maintainer: Ralph Torres <mail@ralphptorr.es>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: White-Oak <lpzhelud@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

_pkgname=servo
pkgname=$_pkgname-latest
pkgver=20240604
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
    servo.desktop
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
    cd "$srcdir"
    install -Dm644 -t "$pkgdir"/usr/share/applications $_pkgname.desktop
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE

    cd $_pkgname
    install -Dm755 -t "$pkgdir"/usr/lib/$_pkgname $_pkgname
    install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
        #!/bin/sh
        exec /usr/lib/servo/servo "\$@"
END
    cp -r resources/ "$pkgdir"/usr/lib/$_pkgname
    chmod -R 644 "$pkgdir"/usr/lib/$_pkgname/resources
}
