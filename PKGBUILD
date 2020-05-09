# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

pkgname=lxdui
pkgver=2.1.3
pkgrel=1
pkgdesc="Web UI for the native Linux container technology LXD/LXC"
arch=(x86_64)
url="https://github.com/AdaptiveScale/lxdui"
license=('AGPL3')
depends=(lxd
#	python-click
	python-flask
#	python-flask-login
#	python-flask-jwt
#	python-idna
#	python-jsonschema
	python-netaddr
#	python-pyopenssl
#	python-psutil
	python-pylxd
#	python-requests
	python-terminado
#	python-tornado
#	python-tornado-xstatic
#	python-urllib3
#	python-xstatic
#	python-xstatic-term.js
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
		0020-logs.patch
		9999-versions.patch
		)

sha256sums=('8293c4abf59e75c56941189f86fb406c5a93e62a0960d2ce7ece8da785426160'
            'e419e1ecb8bec84fd676e7a729d91b48065a3a7616956bc5356e64e6d8286eac'
            'b149cf164d32659b95802d0e4e455e98736de0d0ece519c48eae2eb846c35f3c'
            '4f96bb6af509e6dacf97e2298da9f2bf783f46279c6957ed288fed478206696d'
            '7487a9b77522a23b1be4c02961f46917d48b9c617d669843bbf26c4fd285d75d'
            '929c933ed0085d74972fd20c14f07b01ad4aaaff93c84897527868424447ef1f'
            '0bcbeb6691634026f5b0457119a18724df234189b99ca40f13f43460b61c1f40'
            '5fea7e09d4d21499e90f3012bddb947900b1555742b6feab93f2e858fa78532e')
options=(!emptydirs strip)

prepare()
{
	cd $srcdir/$pkgname-$pkgver

	for s in ${source[@]}; do
		case $s in
			*.patch)
				echo -n Applying patch $s...
				patch -s -p1 -i ${srcdir}/$s
				echo ' done'
			;;
		esac
	done

	sed -i "/^VERSION/ s:=.*:= '${pkgver}':" app/__metadata__.py
}

package()
{
	virtualenv --system-site-packages $pkgdir/usr/lib/$pkgname

	pushd $srcdir/$pkgname-$pkgver
	$pkgdir/usr/lib/$pkgname/bin/python setup.py install --optimize=1
	$pkgdir/usr/lib/$pkgname/bin/pip uninstall -y pip setuptools wheel
	popd

	find $pkgdir/usr/lib/$pkgname/lib -type d \( -name testsuite -o -name tests -o -name __pycache__ \) -exec rm -rf {} \; 2>/dev/null || true
	find $pkgdir/usr/lib/$pkgname/bin -type f -exec grep -q $pkgdir {} \; -exec sed -i "s:$pkgdir::g" {} \;

	install -dm755 $pkgdir/usr/bin
	ln -s ../lib/$pkgname/bin/lxdui $pkgdir/usr/bin/lxdui

	install -Dm644 $pkgname.conf $pkgdir/etc/$pkgname/$pkgname.conf
	install -Dm644 $pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
	install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -Dm644 $pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf

	PYVER=$($pkgdir/usr/lib/$pkgname/bin/python --version|cut -d\  -f2|cut -d. -f1,2)

#	mv $pkgdir/usr/lib/$pkgname/lib/python$PYVER/site-packages/conf/* $pkgdir/etc/$pkgname
	mv $pkgdir/usr/lib/$pkgname/lib/python$PYVER/site-packages/LXDUI-$pkgver-py$PYVER.egg/conf/* $pkgdir/etc/$pkgname
	chmod 600 $pkgdir/etc/$pkgname/auth.conf
}

