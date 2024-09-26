# Maintainer:
# Contributor: a821 at (nospam) mail de
# Contributor: Foppe HEMMINGA <foppe@foppe.org>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=dealer
pkgver=20211121
pkgrel=1
arch=(x86_64)
pkgdesc="bridge hand generator"
url="https://packages.debian.org/bookworm/dealer"
source=("http://deb.debian.org/debian/pool/main/d/dealer/dealer_${pkgver}+ds.orig.tar.xz"
        "http://deb.debian.org/debian/pool/main/d/dealer/dealer_${pkgver}+ds-1.debian.tar.xz"
        "fix-missing-declarations.patch")
license=('LicenseRef-public-domain')
depends=('perl')

sha256sums=('8fae9755a3f6fdc39578a1113a3a51f5aedf1f025e900b9380a37261219300b7'
            '883a4ae46af2fc7a83691907f5f808afbfb1e5e759c67ff6e4b8fec68df6ab7d'
            'a665f3c63180ab3d75f1e527f3bf545a5c6b817b3cd745949da6e2846860223b')

prepare() {
    cd dealer
    find -name ".cvsignore" -delete
    find -type f -exec chmod 644 {} +
    for patch in $(< ../debian/patches/series); do
        patch -p1 < ../debian/patches/${patch}
    done
    patch -p1 < ../fix-missing-declarations.patch
}

build() {
    make -C dealer
}

package() {
    cd dealer

    install -Dm755 dealer -t "$pkgdir/usr/bin"
    install -Dm755 Pre_Processors/dpp "$pkgdir/usr/bin/dealer.dpp"
    install -Dm644 Pre_Processors/Dist.pm -t "$pkgdir/usr/share/perl5/vendor_perl/Dealer"
    install -Dm644 dealer{,.dpp}.6 -t "$pkgdir/usr/share/man/man6"

    install -d "$pkgdir/usr/share/doc/$pkgname"
    cp -R README Pre_Processors/README.dpp Manual Examples Post_Processors \
        "$pkgdir/usr/share/doc/$pkgname"

    cd ../debian
    install -Dm644 copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
