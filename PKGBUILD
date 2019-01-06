# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

_pkgname=rbldnsd
pkgname=$_pkgname-git
pkgver=0
pkgrel=1
pkgdesc="Small Daemon for DNSBLs"
arch=(x86_64)
url=https://rbldnsd.io
license=(GPL)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname-git::git+https://github.com/spamhaus/$_pkgname.git
		$_pkgname.sh
		$_pkgname.sysusers
		$_pkgname.tmpfiles
		$_pkgname.service
		$_pkgname.opts
		$_pkgname.ip4set
		)
sha256sums=('SKIP'
            '312a7b6ad2f873b3ff4256810cd03288805236cde853316beff28e9883b766cd'
            '8e671965d7a80ffab0279f4b08a751d596ade0b02abdb8b860e39aabfb677734'
            '19a540e4619334fd8c6604adc3337f51c95089f87f64ebb5c2b0760dc571ea49'
            'f17616ba4220550f933578371b9a11018ec993879fb2813215a65de84c3dce1f'
            '40cac6754bd2e7e40a60a824bfe0501ebbb52f8e81a185199b94773a186506fe'
            '80e32fa4746acf8f3d00f735eef4c1584979ac59e899bee22f6e07a9b2ba9b06')

pkgver() {
	cd $srcdir/$_pkgname-git
	latest=$(git describe --tags $(git rev-list --tags --max-count=1))
	echo -n $latest.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare()
{
	cd $srcdir/$_pkgname-git
	./configure
}

build()
{
	cd $srcdir/$_pkgname-git
	make
}

package()
{
	backup=(etc/conf.d/$_pkgname)
	install=$_pkgname.install

	pushd $srcdir/$_pkgname-git
	install -Dm755 $_pkgname $pkgdir/usr/lib/$_pkgname/$_pkgname
	install -Dm644 $_pkgname.8 $pkgdir/usr/share/man/man8/$_pkgname.8
	popd

	install -Dm755 $_pkgname.sh $pkgdir/usr/bin/$_pkgname
	install -Dm644 $_pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$_pkgname.conf
	install -Dm644 $_pkgname.service $pkgdir/usr/lib/systemd/system/$_pkgname.service
	install -Dm644 $_pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf
	install -Dm644 $_pkgname.opts $pkgdir/etc/conf.d/$_pkgname

	install -Dm644 $_pkgname.ip4set $pkgdir/usr/lib/$_pkgname/local.txt.ip4set

	gzip -9 $pkgdir/usr/share/man/man8/$_pkgname.8
}

