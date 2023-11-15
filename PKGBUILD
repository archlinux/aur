# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Ainola
# Contributor: Ethan Schoonover

pkgname=gam
pkgver=6.58
pkgrel=2
pkgdesc="command line management for Google Workspace"
arch=('any')
url="https://github.com/GAM-team/GAM/wiki"
license=('Apache-2.0')
depends=(
    'python-dateutil'
    'python-distro'
    'python-dnspython'
    'python-filelock'
    'python-google-api-core'
    'python-google-api-python-client'
    'python-google-auth'
    'python-google-auth-httplib2'
    'python-google-auth-oauthlib'
    'python-httplib2'
    'python-pathvalidate'
    'python-passlib'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/jay0lee/GAM/archive/v${pkgver}.tar.gz"
    "xdg_config_dirs.patch"
    "disable_update_checks.patch"
    "gam.sh"
)

sha256sums=('755f6974ed92c475949cb92dd7655a52567ec582ab132d8f5a0f754585af2085'
            '69875ddfe63523579a6be45fdcac4211503b4149765f3ee66514a40503a5e374'
            '1be3b23bc2ee2fb5a43c6a999919243c93877fc9ea13c5e301097d1b5cd53baa'
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
    install -Dm755 "$pkgname-$pkgver/src/GamCommands.txt" -t "$pkgdir/usr/share/$pkgname/"
    install -Dm755 "$pkgname-$pkgver/src/roots.pem" -t "$pkgdir/usr/share/$pkgname/"
    install -Dm755 gam.sh "$pkgdir/usr/bin/gam"

}
