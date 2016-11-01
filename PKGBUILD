# Maintainer: Firegore <admin@firegore.com>
pkgname=bloonix-agent
#_pkgname=
provides=('bloonix-agent')
pkgver=0.77
pkgrel=1
pkgdesc='Bloonix Monitoring Agent'
arch=('i686' 'x86_64')
url='https://bloonix.org'
license=('GPLv3')
options=('!emptydirs')
install='bloonix-agent.install'
backup=('etc/bloonix/agent/main.conf')
depends=('perl-module-build' 'perl-io-socket-inet6' 'perl-params-validate'
'perl-term-readkey' 'perl-log-handler' 'perl-json' 'bloonix-core' 'facter')
source=(https://download.bloonix.de/sources/$pkgname-$pkgver.tar.gz)

build() {
    cd "$srcdir"/$pkgname-$pkgver
    #perl Configure.PL
    perl Configure.PL --prefix /usr --without-perl --ssl-ca-path /etc/ssl/certs --build-package
    make
    pod2man bin/bloonix-agent >bin/bloonix-agent.1
    cd perl && perl Build.PL installdirs=vendor && cd ..
    cd perl && perl Build
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
    install -d -m 0755 $pkgdir/etc/logrotate.d
    install -d -m 0755 $pkgdir/etc/bloonix
    install -d -m 0755 $pkgdir/etc/bloonix/agent/conf.d
    cp etc/logrotate.d/bloonix $pkgdir/etc/logrotate.d/bloonix

    cd perl && perl Build install destdir=$pkgdir create_packlist=0
    #cp $pkgdir/usr/lib/bloonix/etc $pkgdir/etc -r
    cp $pkgdir/usr/lib/bloonix/etc/systemd/ $pkgdir/etc/systemd -r
    chmod 750 $pkgdir/usr/lib/bloonix/etc/sudoers.d -R
    cp $pkgdir/usr/lib/bloonix/etc/sudoers.d/ $pkgdir/etc/sudoers.d -r
    cp $pkgdir/usr/lib/bloonix/etc/agent $pkgdir/etc/bloonix -r

}

# vim:set ts=2 sw=2 et:
md5sums=('183dbcc366bd71b1bd1069c9989048c7')
sha1sums=('0cac5933ffadd9a5cb72b4a5f9d27801b10851b9')
