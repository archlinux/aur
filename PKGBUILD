# Maintainer: Ainola
# Contributor: Ethan Schoonover

pkgname=gam
pkgver=5.09
pkgrel=2
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
    "disable_update_checks.patch"
    "gam.sh"
)

sha256sums=('29bb6afebd4c5355d17ae2498f961d9729d84757cb07af6b9d03bf87841d0f91'
            '31d97ff8515d6b5e214b18affb1cb7be88fc8cddb0022f46d6d7ccf848819bf9'
            '20ce5f7630feb47b1838ad998aa98bfafbc18f494f0697fbcfab484a572ae6d5'
            'f8613546b8d4a51f05342d3680553c20a2e0995c3be90e469f1da3bb83ca172e')

prepare() {
    mv "GAM-$pkgver" "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    patch -p0 < ../xdg_config_dirs.patch
    patch -p0 < ../disable_update_checks.patch
}

package() {
    # No setup-utils here yet. See https://github.com/jay0lee/GAM/issues/1140
    install -m755 -d "$pkgdir/etc/$pkgname/"
    touch "$pkgdir/etc/$pkgname/noupdatecheck.txt"
    touch "$pkgdir/etc/$pkgname/nobrowser.txt"

    mkdir -p "$pkgdir/usr/share/$pkgname"

    cp -r "$pkgname-$pkgver"/src/gam/ "$pkgdir/usr/share/$pkgname"

    find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/$pkgname" -name '*_test.py' -exec rm {} +

    install -Dm755 "$pkgname-$pkgver/src/gam.py" -t "$pkgdir/usr/share/$pkgname/"
    install -Dm755 gam.sh "$pkgdir/usr/bin/gam"

}
