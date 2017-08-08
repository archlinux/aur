# Maintainer: Alexandr B <4le34n at gmail dot com>

pkgname=nfsen
pkgver=1.3.8
pkgrel=10
pkgdesc="Netflow visualisation and investigation tool"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/nfsen"
license=('BSD')
depends=('nfdump>=1.6.1'
         'perl>=5.10.1'
         'perl-mailtools'
         'perl-socket6'
         'php>4.1' 
         'rrdtool')
optdepends=('apache' 'nginx' 'php-apache' 'php-fpm')
backup=('etc/nfsen.conf' 'etc/nginx/sites-available/nfsen')
install='install'
source=("$url/files/stable/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        'nfsen.conf'
        'nginx'
        'profile.sh'
        'service'
        'tmpfiles')

prepare() {
	cd "$pkgname-$pkgver"
        # Fix error
        sed -i 's|$rrd_version < 1.6|$rrd_version < 1.7|' libexec/NfSenRRD.pm
}

package() {
	install -dm755 "$pkgdir/usr/share/webapps" 
        cp -a "$pkgname-$pkgver" "$pkgdir/usr/share/webapps/$pkgname"
	cd "$pkgname-$pkgver"
	install -Dm644 "$srcdir/service" "$pkgdir/usr/lib/systemd/system/nfsen.service" 
	install -Dm644 "$srcdir/tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/nfsen.conf" 
	install -Dm644 BSD-license.txt "$pkgdir/usr/share/license/$pkgname/BSD-license.txt" 
	install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$pkgname/ChangeLog" 
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README" 
	install -Dm644 README.plugins "$pkgdir/usr/share/doc/$pkgname/README.plugins" 
	install -Dm644 "$srcdir/nfsen.conf" "$pkgdir/etc/nfsen.conf"
	install -Dm644 "$srcdir/nginx" "$pkgdir/etc/nginx/sites-available/nfsen"
	install -Dm755 "$srcdir/profile.sh" "$pkgdir/etc/profile.d/nfsen.sh"
}
md5sums=('fc45b3f44a66c2ed65d1269e479c2414'
         'd3f9428f50d3c019dd6ec46e7ff49c80'
         'e8ffd8c767aca866050d679b609a0db9'
         'ad1b4a004dacd0508033fcfca763a2fe'
         '69898397995d35b1d53d6a61b16b24a8'
         'd60d7334fb00e85ea3230f059ae660aa')
