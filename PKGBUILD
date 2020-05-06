# Maintainer: Ainola
# Contributor: Ethan Schoonover

pkgname=gam
pkgver=5.07
pkgrel=1
pkgdesc="Command-line tool for Google GSuite admins to manage settings quickly and easily"
arch=('any')
url="https://github.com/jay0lee/GAM"
license=('Apache')
depends=(
    'python-dateutil'
    'python-dnspython'
    'python-google-api-core'
    'python-google-api-python-client'
    'python-google-auth'
    'python-google-auth-httplib2'
    'python-google-auth-oauthlib'
    'python-httplib2'
    'python-passlib'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/jay0lee/GAM/archive/v${pkgver}.tar.gz"
    "xdg_config_dirs.patch"
    "gam.sh"
)

sha256sums=('7508661f12ea1c89b117afb38c956f5ec5cbb96dc51b5a82315ce56a5d89176e'
            '3e1dcfd32d3635143c220b07752c46af523b6a875b80f01108a43144669dec2a'
            'f8613546b8d4a51f05342d3680553c20a2e0995c3be90e469f1da3bb83ca172e')

prepare() {
    mv "GAM-$pkgver" "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    patch -p0 < ../xdg_config_dirs.patch
}

package() {
    # No setup-utils here yet. See https://github.com/jay0lee/GAM/issues/1140
    install -m755 -d "$pkgdir/etc/$pkgname/"
    touch "$pkgdir/etc/$pkgname/noupdatecheck.txt"
    touch "$pkgdir/etc/$pkgname/nobrowser.txt"

    mkdir -p "$pkgdir/usr/share/$pkgname"

    cp -r "$pkgname-$pkgver"/src/gam/ "$pkgdir/usr/share/$pkgname"

    # Upstream wants to insert themselves into every facet of where they should not be.
    touch "$pkgdir/usr/share/$pkgname/gam/noupdatecheck.txt"

    find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/$pkgname" -name '*_test.py' -exec rm {} +

    install -Dm755 "$pkgname-$pkgver/src/gam.py" -t "$pkgdir/usr/share/$pkgname/"
    install -Dm755 gam.sh "$pkgdir/usr/bin/gam"

}
