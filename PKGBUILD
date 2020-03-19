# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

pkgname=lxdui
pkgver=2.1.2
pkgrel=3
pkgdesc="Web UI for the native Linux container technology LXD/LXC"
arch=(x86_64)
url="https://github.com/AdaptiveScale/lxdui"
license=('AGPL3')
depends=(lxd
	python-click
	python-jsonschema
	python-netaddr
	python-psutil
	python-ptyprocess
	python-requests
	python-terminado
	python-tornado
	
)
makedepends=('python-virtualenv')
provides=(lxdui)
install=lxdui.install
backup=(etc/lxdui/lxdui.conf
		etc/lxdui/log.conf
		etc/lxdui/auth.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/AdaptiveScale/$pkgname/archive/v$pkgver.tar.gz

		$pkgname.conf
		$pkgname.sysusers
		$pkgname.tmpfiles
		$pkgname.service

		0010-paths.patch
		)

sha256sums=('a9354d2f2c9fa2c3dd9e9f69407d3cda435ab86572536c518272d25dcd599ebe'
            'e419e1ecb8bec84fd676e7a729d91b48065a3a7616956bc5356e64e6d8286eac'
            'b149cf164d32659b95802d0e4e455e98736de0d0ece519c48eae2eb846c35f3c'
            '4f96bb6af509e6dacf97e2298da9f2bf783f46279c6957ed288fed478206696d'
            '7487a9b77522a23b1be4c02961f46917d48b9c617d669843bbf26c4fd285d75d'
            '929c933ed0085d74972fd20c14f07b01ad4aaaff93c84897527868424447ef1f')

prepare()
{
	cd $pkgname-$pkgver
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

package() {
	virtualenv --system-site-packages $pkgdir/usr/lib/$pkgname

	pushd $pkgname-$pkgver
	$pkgdir/usr/lib/$pkgname/bin/python setup.py install --optimize=1
	$pkgdir/usr/lib/$pkgname/bin/pip uninstall -y pip setuptools wheel
	popd

	find $pkgdir/usr/lib/$pkgname/bin -type f -exec grep -q $pkgdir {} \; -exec sed -i "s:$pkgdir::g" {} \;
	find $pkgdir/usr/lib/$pkgname/lib -type d \( -name testsuite -o -name tests \) -exec rm -rf {} \; 2>/dev/null || true

	install -dm755 $pkgdir/usr/bin

	ln -s ../lib/$pkgname/bin/lxdui $pkgdir/usr/bin/lxdui

	install -Dm644 $pkgname.conf $pkgdir/etc/$pkgname/$pkgname.conf
	install -Dm644 $pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
	install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -Dm644 $pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf

	PYVER=$($pkgdir/usr/lib/$pkgname/bin/python --version|cut -d\  -f2|cut -d. -f1,2)

	mv $pkgdir/usr/lib/$pkgname/lib/python$PYVER/site-packages/LXDUI-$pkgver-py$PYVER.egg/conf/* $pkgdir/etc/$pkgname
	chmod 600 $pkgdir/etc/$pkgname/auth.conf
}

