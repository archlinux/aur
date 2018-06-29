# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

pkgname=lxdui
pkgver=2.1.1
pkgrel=1
pkgdesc="Web UI for the native Linux container technology LXD/LXC"
arch=(x86_64)
url="https://github.com/AdaptiveScale/lxdui"
license=('AGPL3')
depends=(lxd
	python-click
	python-flask-jwt
	python-flask-login
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

sha256sums=('d537f589d8433931f251071dff0cd15cb24cf3b6a6ce6932430991043bf4e8e4'
            'e419e1ecb8bec84fd676e7a729d91b48065a3a7616956bc5356e64e6d8286eac'
            'b149cf164d32659b95802d0e4e455e98736de0d0ece519c48eae2eb846c35f3c'
            'ba3e1a27e38e63e283ea595480be375a70d5f24879ba4c2c4f3fe4dc28fbdee4'
            '7487a9b77522a23b1be4c02961f46917d48b9c617d669843bbf26c4fd285d75d'
            'bf8ecd2b10b70d90b8b7b9dd2d5b35a69cb2ed6fa6d7a7c310cc0648fa19e723')

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

	install -Dm644 $pkgname.conf $pkgdir/etc/$pkgname/$pkgname.conf
	install -Dm644 $pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
	install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -Dm644 $pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf

	mv $pkgdir/usr/lib/$pkgname/lib/python3.6/site-packages/LXDUI-$pkgver-py3.6.egg/conf/* $pkgdir/etc/$pkgname
}

