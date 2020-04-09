# Maintainer: Ainola
# Contributor: Ethan Schoonover

pkgname=gam
pkgver=5.04
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

sha256sums=('e8b528cb9e7c98e263cd7a8614d0b1a14b3db573ab3bca47f979e7e28d581c11'
            '202e3566d837c37526174fb6311232c06d90e3786578668aa58ef3eb0648054a'
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

    for file in controlflow display fileutils transport utils var; do
        install -Dm644 "$pkgname-$pkgver/src/$file.py" \
            -t "$pkgdir/usr/share/$pkgname/"
    done

    cp -r "$pkgname-$pkgver"/src/{auth,gapi} "$pkgdir/usr/share/$pkgname"
    find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/$pkgname" -name '*_test.py' -exec rm {} +

    install -Dm755 "$pkgname-$pkgver/src/gam.py" -t "$pkgdir/usr/share/$pkgname/"
    install -Dm755 gam.sh "$pkgdir/usr/bin/gam"
}
