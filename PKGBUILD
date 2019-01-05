# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

pkgbase=rbldnsd
pkgname=($pkgbase $pkgbase-sync)
pkgver=0.998b
pkgrel=2
pkgdesc="Small Daemon for DNSBLs"
arch=(x86_64)
url=https://rbldnsd.io
license=(GPL)
source=($pkgbase-$pkgver.tar.gz::https://github.com/spamhaus/rbldnsd/archive/0.998b.tar.gz
		$pkgbase.sh
		$pkgbase.sysusers
		$pkgbase.tmpfiles
		$pkgbase.service
		$pkgbase.opts
		$pkgbase.ip4set
		$pkgbase-sync.service
		$pkgbase-sync.timer
		$pkgbase-sync.sh
		)
sha256sums=('7f6abacb561bad4ec6014e75d44c4cce48d67ed13b7a5cd61bcc6566b3c0b8c7'
            '1bffcd37cf6cd62813a9ace362b77be204e76fc368387c723ec795b13c779d59'
            '8e671965d7a80ffab0279f4b08a751d596ade0b02abdb8b860e39aabfb677734'
            '19a540e4619334fd8c6604adc3337f51c95089f87f64ebb5c2b0760dc571ea49'
            '8602e14db8a008f42541d4d66614909ab2b4d85e279a4d07b81fcb2d0556b8fe'
            '8e9cb2c4c6334dee5db9068d72917f106dc90acf6e233b90c18a5e9cc5d2aa58'
            '80e32fa4746acf8f3d00f735eef4c1584979ac59e899bee22f6e07a9b2ba9b06'
            '9fd85509bb69f393b4520b20d6f645140c1650dd8c47b789597639b872d8b72f'
            '69d23c6043d96b40f539b178d452f2753d602a68f3d5381b2c54cc142f70aad2'
            '9d7b337d21d9801c253955fe790c9228b5455969a5167577c515d31b30740f34')

prepare()
{
	cd $srcdir/$pkgbase-$pkgver
	./configure
}

build()
{
	cd $srcdir/$pkgbase-$pkgver
	make
}

package_rbldnsd()
{
	backup=(etc/conf.d/$pkgbase)
	install=$pkgbase.install

	pushd $srcdir/$pkgbase-$pkgver
	install -Dm755 $pkgbase $pkgdir/usr/lib/$pkgbase/$pkgbase
	install -Dm644 $pkgbase.8 $pkgdir/usr/share/man/man8/$pkgbase.8
	popd

	install -Dm755 $pkgbase.sh $pkgdir/usr/bin/$pkgbase
	install -Dm644 $pkgbase.sysusers $pkgdir/usr/lib/sysusers.d/$pkgbase.conf
	install -Dm644 $pkgbase.service $pkgdir/usr/lib/systemd/system/$pkgbase.service
	install -Dm644 $pkgbase.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgbase.conf
	install -Dm644 $pkgbase.opts $pkgdir/etc/conf.d/$pkgbase

	install -Dm644 $pkgbase.ip4set $pkgdir/usr/lib/$pkgbase/local.txt.ip4set

	gzip -9 $pkgdir/usr/share/man/man8/$pkgbase.8
}

package_rbldnsd-sync()
{
	depends=($pkgbase rsync)
	install=$pkgbase-sync.install
	pkgdesc="Syncrhonization for RBLDNSD"

	install -Dm755 $pkgbase-sync.sh $pkgdir/usr/lib/$pkgbase/$pkgbase-sync.sh
	install -Dm644 $pkgbase-sync.service $pkgdir/usr/lib/systemd/system/$pkgbase-sync.service
	install -Dm644 $pkgbase-sync.timer $pkgdir/usr/lib/systemd/system/$pkgbase-sync.timer
}

