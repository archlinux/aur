# $Id: PKGBUILD 231762 2017-06-01 08:41:26Z felixonmars $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Stefan Bergstrom <stefan.bergstrom@gmail.com>

pkgname=gnump3d
pkgver=3.0
pkgrel=9
url="http://www.gnu.org/software/gnump3d/"
arch=(any)
pkgdesc="A streaming server for MP3s, OGG vorbis files, movies and other media formats."
license=("GPL")
depends=('sh' 'perl')
backup=('etc/gnump3d/gnump3d.conf')
install=gnump3d.install
validpgpkeys=('DB1FF3FB1D08FC01ED222243C0CFC6B3CD4C0D9D')
source=("https://savannah.gnu.org/download/$pkgname/$pkgname-$pkgver.tar.bz2"{,.sig}
	'gnump3d.service'
	'gnump3d-proxy.patch')
sha256sums=('1ac5bd0e850b0e18ccd9d19219f5108fa84b50d8ae3825a361e8b907eab7f19c'
            'SKIP'
            'a8fb63b0bb49e7fb4149a7f8c15e1a337bfa4787f630fa9fcd696a6bdf6418e8'
            '1a1829bf55f46fbfa249053732033b59f7ab1dc27a2f3c4e7ed71f03ac10a1ae')

package() {
    cd "$srcdir"/$pkgname-$pkgver

    patch -p1 <"$srcdir"/gnump3d-proxy.patch

    install -d "$pkgdir"/var/log/gnump3d
    install -d "$pkgdir"/var/cache/gnump3d/serving

    install -d "$pkgdir"/usr/share/perl5/vendor_perl/gnump3d/plugins
    install -d "$pkgdir"/usr/share/perl5/vendor_perl/gnump3d/lang
    install -m 644 lib/gnump3d/*.pm         "$pkgdir"/usr/share/perl5/vendor_perl/gnump3d
    install -m 644 lib/gnump3d/plugins/*.pm "$pkgdir"/usr/share/perl5/vendor_perl/gnump3d/plugins
    install -m 644 lib/gnump3d/lang/*.pm    "$pkgdir"/usr/share/perl5/vendor_perl/gnump3d/lang

    install -d "$pkgdir"/usr/bin
    install -m 755 bin/gnump3d2 "$pkgdir"/usr/bin/gnump3d
    install -m 755 bin/gnump3d-top bin/gnump3d-index "$pkgdir"/usr/bin

    install -d "$pkgdir"/usr/share/man/man1
    install -m 644 man/gnump3d-top.1 man/gnump3d-index.1 man/gnump3d.1 man/gnump3d.conf.1 "$pkgdir"/usr/share/man/man1

    install -d "$pkgdir"/usr/share/gnump3d
    cp -R templates/* "$pkgdir"/usr/share/gnump3d
    chmod -R a+r "$pkgdir"/usr/share/gnump3d
    chmod +rx "$pkgdir"/usr/share/gnump3d/*/

    sed -i "s|PLUGINDIR|/usr/share/perl5/vendor_perl|g" etc/gnump3d.conf
    install -d "$pkgdir"/etc/gnump3d
    install -m 644 etc/gnump3d.conf etc/mime.types "$pkgdir"/etc/gnump3d
    install -m 644 etc/gnump3d.conf etc/file.types "$pkgdir"/etc/gnump3d

    mkdir -p "$pkgdir"/srv/mp3
    sed -i "s|/home/mp3|/srv/mp3|" "$pkgdir"/etc/gnump3d/gnump3d.conf

    install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}
