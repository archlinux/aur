# Maintainer: pappy <pa314159@users.noreply.github.com>

_pkgname=lxdui
pkgname=$_pkgname-git
pkgver=2.2.0.839.48e1e06
pkgrel=1

srcver() {
	cd "${srcdir}/${pkgname}"
	eval $(cat app/__metadata__.py | grep -w VERSION | sed 's/ //g')
	echo -n $VERSION
}

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	echo -n $(srcver).0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

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
conflicts=(lxdui)
install=lxdui.install
backup=(etc/lxdui/lxdui.conf
		etc/lxdui/log.conf
		etc/lxdui/auth.conf)
source=("$pkgname::git+https://github.com/AdaptiveScale/$_pkgname#branch=develop"

		$_pkgname.conf
		$_pkgname.sysusers
		$_pkgname.tmpfiles
		$_pkgname.service

		0010-paths.patch
		)
sha256sums=('SKIP'
            'e419e1ecb8bec84fd676e7a729d91b48065a3a7616956bc5356e64e6d8286eac'
            'b149cf164d32659b95802d0e4e455e98736de0d0ece519c48eae2eb846c35f3c'
            '4f96bb6af509e6dacf97e2298da9f2bf783f46279c6957ed288fed478206696d'
            '7487a9b77522a23b1be4c02961f46917d48b9c617d669843bbf26c4fd285d75d'
            '832a8e044f4eaa0221a151f6cfc7a7f99c97bb5526944585d2fbf4d5162433f6')

prepare()
{
	cd $pkgname
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
	virtualenv --system-site-packages $pkgdir/usr/lib/$_pkgname

	pushd $pkgname
	$pkgdir/usr/lib/$_pkgname/bin/python setup.py install --optimize=1
	$pkgdir/usr/lib/$_pkgname/bin/pip uninstall -y pip setuptools wheel
	popd

	find $pkgdir/usr/lib/$_pkgname/bin -type f -exec grep -q $pkgdir {} \; -exec sed -i "s:$pkgdir::g" {} \;
	find $pkgdir/usr/lib/$_pkgname/lib -type d \( -name testsuite -o -name tests \) -exec rm -rf {} \; 2>/dev/null || true

	install -dm755 $pkgdir/usr/bin
	ln -s ../lib/$_pkgname/bin/lxdui $pkgdir/usr/bin/lxdui

	install -Dm644 $_pkgname.conf $pkgdir/etc/$_pkgname/$_pkgname.conf
	install -Dm644 $_pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$_pkgname.conf
	install -Dm644 $_pkgname.service $pkgdir/usr/lib/systemd/system/$_pkgname.service
	install -Dm644 $_pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf

	PYVER=$($pkgdir/usr/lib/$_pkgname/bin/python --version|cut -d\  -f2|cut -d. -f1,2)
	mv $pkgdir/usr/lib/$_pkgname/lib/python$PYVER/site-packages/conf/* $pkgdir/etc/$_pkgname
	chmod 600 $pkgdir/etc/$_pkgname/auth.conf
}

