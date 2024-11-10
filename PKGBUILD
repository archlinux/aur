# Maintainer: pappy <pa314159@users.noreply.github.com>

pkgname=gitbucket
pkgver=4.41.0
pkgrel=1
pkgdesc="A Git platform powered by Scala with easy installation, high extensibility & GitHub API compatibility"
arch=(any)
url=https://gitbucket.github.io
license=(AGPL3)
depends=('java-runtime-headless>=8')
install=gitbucket.install
backup=(etc/conf.d/gitbucket
		etc/gitbucket/database.conf
		etc/gitbucket/logback.xml
		)
source=(gitbucket-$pkgver.tar.gz::https://github.com/gitbucket/gitbucket/archive/$pkgver.tar.gz
		10-database.patch
		database.conf
		logback.xml
		gitbucket.conf
		gitbucket.sysusers
		gitbucket.tmpfiles
		gitbucket.service
		)
makedepends=(sbt 'java-environment-openjdk>=8')
sha256sums=('bb2b78935e8e9eb49c45aaddc3cb1aba351096e92f4c631af903598032c6f704'
            'adf29a3110aadb8268ed7113d7f712a9fb6ff51fa6d64d9e710775aa941fc457'
            '1ad37bef23b3992356c4140e3e96fc965275a0d7ced5e4a0e64ae37cfcac5fa5'
            'c6185de1f0d118310e6e91e865c842b96343e4ebdbe8c1d2a16e1d4c270765b1'
            '0e89640cc21ad01c7a4490fdb04c4ef111ff97343f7e8534863d7a6e080eabde'
            '7839b30fafa179d3712ec4246450fbf56a70130de198da2265d872b76ac0ee0e'
            '54266df0fcce78bf6e19f2f1364d0444a64fbc161d4c673d871fc7c5707e26ce'
            'ce6d4b6d24df71e63296cdb69c2cd0a439d860b4fc3633cb87b5c16fe9ec543b')

PKGEXT=.pkg.tar

prepare()
{
	cd $srcdir/gitbucket-$pkgver

	for s in ${source[@]}; do
		case $s in
			*.patch)
				echo -n Applying patch $s...
				patch -s -p1 -i ${srcdir}/$s
				echo ' done'
			;;
		esac
	done
}

build()
{
	cd $srcdir/gitbucket-$pkgver
	sbt --batch executable
}

package()
{
	install -Dm644 gitbucket-$pkgver/target/executable/gitbucket.war $pkgdir/usr/lib/gitbucket/gitbucket.war
	install -Dm644 database.conf $pkgdir/etc/gitbucket/database.conf
	install -Dm644 logback.xml $pkgdir/etc/gitbucket/logback.xml
	install -Dm644 gitbucket.conf $pkgdir/etc/conf.d/gitbucket
	install -Dm644 gitbucket.sysusers $pkgdir/usr/lib/sysusers.d/gitbucket.conf
	install -Dm644 gitbucket.service $pkgdir/usr/lib/systemd/system/gitbucket.service
	install -Dm644 gitbucket.tmpfiles $pkgdir/usr/lib/tmpfiles.d/gitbucket.conf
}

