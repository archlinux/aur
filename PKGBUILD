# Maintainer: Ainola
# Contributor: Ethan Schoonover

pkgname=gam
pkgver=4.99
pkgrel=1
pkgdesc="Command-line tool for Google GSuite admins to manage settings quickly and easily"
arch=('any')
url="https://github.com/jay0lee/GAM"
license=('Apache')
depends=(
    'python-dateutil'
    'python-dnspython'
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

sha256sums=('83b0877a6b9f54bed1483e03207e0af4f4b1b90533a7efd3d1a8201fc2bf2f81'
            '202e3566d837c37526174fb6311232c06d90e3786578668aa58ef3eb0648054a'
            'd93809852ef9eefeb99f3fc1b955305264f93f2552db14b4d9d6fe7c2b08345b')

prepare() {
    mv "GAM-$pkgver" "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    patch -p0 < ../xdg_config_dirs.patch
}

package() {
    install -m755 -d "$pkgdir/etc/$pkgname/"
    touch "$pkgdir/etc/$pkgname/noupdatecheck.txt"
    touch "$pkgdir/etc/$pkgname/nobrowser.txt"

    install -Dm755 "$pkgname-$pkgver/src/gam.py" -t "$pkgdir/usr/share/$pkgname/"

    for file in controlflow display fileutils transport utils var; do
        install -Dm644 "$pkgname-$pkgver/src/$file.py" \
            -t "$pkgdir/usr/share/$pkgname/"
    done

    install -Dm644 "$pkgname-$pkgver"/src/gapi/{__init__,errors}.py \
        -t "$pkgdir/usr/share/$pkgname/gapi"

    install -Dm755 gam.sh "$pkgdir/usr/bin/gam"
}
