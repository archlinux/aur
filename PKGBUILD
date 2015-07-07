# Maintainer: Foppe HEMMINGA <foppe@foppe.org>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=dealer
pkgver=20040530
pkgrel=4
arch=(i686 x86_64)
pkgdesc="generate bridge cards game hands for partnerships bidding training or for generating statistics that can be used to design conventions, or win postmortems"
url="http://www.xs4all.nl/~henku/html/dealer/dealer.html"
source=(http://ftp.de.debian.org/debian/pool/main/d/dealer/dealer_0.${pkgver}.orig.tar.gz
	http://ftp.de.debian.org/debian/pool/main/d/dealer/dealer_0.${pkgver}-${pkgrel}.debian.tar.gz
    dealer-4.diff
    dealer-4.install
)
install=${pkgname}-${pkgrel}.install
license=('GPL')
depends=('perl')

md5sums=('991c9b73b7ebc1fb87b5e876a7d72797'
         '1dad73622956ee5856634b4e038d6b83'
         '0eedec9b386a60264522f43b94fc069a'
         'd6b4b7044e8d483c209ccb48fe67fad8')

build() {
    cd $srcdir/dealer	|| return 1
    for patch in `cat ../debian/patches/series`
    do
        patch -p1 < ../debian/patches/${patch}
    done
    patch -p1 < ../../dealer-${pkgrel}.diff
    make	|| return 1
    local destdir=$pkgdir/usr/bin
    install -D -m755 dealer $destdir/dealer	|| return 1
    install -D -m755 Post_Processors/pbn_to_ascii.pl $destdir/dealer.pbn_to_ascii.pl	|| return 1
    install -D -m755 Pre_Processors/dpp $destdir/dealer.dpp				|| return 1
    install -D -m644 Pre_Processors/Dist.pm $pkgdir/usr/lib/perl5/current/Dist.pm	|| return 1
    install -d $pkgdir/usr/share/doc/dealer	|| return 1
    install -d $pkgdir/usr/share/man/man6 || return 1
    cp -R ./Manual $pkgdir/usr/share/doc/dealer/	|| return 1
    cp -R ./Examples $pkgdir/usr/share/doc/dealer || return 1
    cp *.6 $pkgdir/usr/share/man/man6 || return 1
}