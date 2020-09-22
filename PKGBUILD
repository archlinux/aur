# Maintainer: PAPPY <pappy _AT_ a s c e l i o n _DOT_ com>

_version=2.14.18
_patch=01

pkgname=nexus
pkgver=$_version.$_patch
pkgrel=2
pkgdesc="Nexus 2 Repository Manager (OSS)"
url="http://nexus.sonatype.org"
arch=('any')
license=('GPL3')
depends=('java-environment=8')
install=nexus.install
backup=(usr/lib/nexus/conf/nexus.properties)
conflicts=(nexus2 nexus3 nexus-oss)
provides=(nexus2 nexus)
options=(!strip !docs)

source=("https://www.sonatype.org/downloads/nexus-$_version-$_patch-bundle.tar.gz"
	nexus.sysusers
	nexus.tmpfiles
	nexus.service
	01-paths.patch
	)	

sha256sums=('350af8b270bec7fda5861a15b8a5b7870fd8903d0b9a210754113d5a966ce6a6'
            '9a5908103137af8176664ddb17d166183aa19cd455746d08f0f58a1a3d9f4eb2'
            'e4110396c5c2c617f6bc37bbd3cf4c6fa9da72df7df6d035117dea39f3e24ac9'
            'a62d439d727c1eced9341ad5fedbc1a5a42494925b01c559e6426c46bbf55c25'
            '9136aee79732184e1da6cfeca0a77708d0595a35b2e38b16cf28a1b41ae7429d')

prepare()
{
	cd $srcdir/nexus-$_version-$_patch

	for s in ${source[@]}; do
		case $s in
			*.patch)
				echo -n Applying patch $s...
				patch -s -p1 -i $srcdir/$s
				echo ' done'
				;;
		esac
	done
}

package()
{
	cd $srcdir/nexus-$_version-$_patch

	install -dm755 $pkgdir/usr/lib
	install -dm755 $pkgdir/usr/share/doc/nexus
	cp -r . $pkgdir/usr/lib/nexus

	rm -rf $pkgdir/usr/lib/nexus/{tmp,logs,bin/nexus.bat}

	# move documentation to the right location
	mv $pkgdir/usr/lib/nexus/*.txt $pkgdir/usr/share/doc/nexus

	install -Dm644 $srcdir/nexus.service $pkgdir/usr/lib/systemd/system/nexus.service
	install -Dm644 $srcdir/nexus.sysusers $pkgdir/usr/lib/sysusers.d/nexus.conf
	install -Dm644 $srcdir/nexus.tmpfiles $pkgdir/usr/lib/tmpfiles.d/nexus.conf
}

