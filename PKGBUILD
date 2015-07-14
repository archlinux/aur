# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thorsten Lanfer <tlanfer@gmail.com>
pkgname=openhab-runtime
pkgver=1.7.0
pkgrel=1
pkgdesc="openHAB automation runtime"
arch=('any')
url="http://www.openhab.org/"
license=('EPL')
depends=('java-runtime>=7')
makedepends=('unzip')
optdepends=('openhab-addons: bindings and actions')
backup=('etc/openhab/openhab.cfg'
				'etc/conf.d/openhab')
source=("https://bintray.com/artifact/download/openhab/bin/distribution-$pkgver-runtime.zip"
				"openhab"
				"openhab.service"
				"openhab-startsh.patch")
noextract=("distribution-$pkgver-runtime.zip")
md5sums=('cecc93e8cf8abf96a956c1502229efaf'
         'e06c404f7174ac0b1d9c2e9e429c3b5f'
         '18299bfcb7865fec55d06890e25c8668'
         '481370e7c473aff7e9267e2e4f6fe68c')

prepare() {
	mkdir "$srcdir/openhab-runtime"
	cd "$srcdir/openhab-runtime"

	unzip "$srcdir/distribution-$pkgver-runtime.zip"

}

build() {
	patch -p1 < openhab-startsh.patch
}

package() {
	cd $pkgdir
	mkdir -p opt
	mkdir -p etc/openhab/addons-enabled
	mkdir -p etc/conf.d
	mkdir -p usr/lib/systemd/system
	cp $srcdir/openhab.service usr/lib/systemd/system
	cp -r $srcdir/openhab-runtime opt
	cp $srcdir/openhab etc/conf.d
	mv opt/openhab-runtime/configurations etc/openhab/configuration
	ln -s /etc/openhab/configurations opt/openhab-runtime/configurations
	ln -s /etc/openhab/addons-enabled opt/openhab-runtime/addons
}
