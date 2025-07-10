# Maintainer: Lauri Niskanen <ape@ape3000.com>
# Contributor: George Gibbs <vash63 at gmail dot com>

pkgname=ds4drv
pkgver=0.5.1
pkgrel=6
pkgdesc="Sony DualShock 4 Userspace Driver"
arch=('any')
url="https://github.com/chrippa/ds4drv"
license=('MIT')
depends=(
    python-setuptools
    bluez-utils
    bluez-deprecated-tools
    python-evdev
    python-pyudev
)
makedepends=('git')
conflicts=('ds4drv-git')
install=ds4drv.install
source=(
	https://github.com/chrippa/ds4drv/archive/v$pkgver.tar.gz
	ds4drv.conf
)
sha256sums=(
	'da6841c17af0fc019abfe9e65d3f2a6fab3ced40294dc7391dc3e954e04479f8'
	'd1b5537b7d76e029eac019f8b4c2b215dae08227fa65fa5da4fa58ffc23924a6'
)

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -pm755 $pkgdir/etc/udev/rules.d
        cp udev/50-ds4drv.rules $pkgdir/etc/udev/rules.d/50-ds4drv.rules
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -pm755 $pkgdir/etc/systemd/system
	cp systemd/ds4drv.service $pkgdir/etc/systemd/system/ds4drv.service
	cp $srcdir/ds4drv.conf $pkgdir/etc/ds4drv.conf
	python_version_major=$(python -c "import sys; print(sys.version_info.major)")
	python_version_minor=$(python -c "import sys; print(sys.version_info.minor)")
	python_version="$python_version_major.$python_version_minor"
	if awk 'BEGIN{exit ARGV[1]<3.12}' "$python_version"; then
		sed -i "s/SafeConfigParser/ConfigParser/g" $pkgdir/usr/lib/python$python_version/site-packages/ds4drv/config.py
	fi
	if awk 'BEGIN{exit ARGV[1]<3.13}' "$python_version"; then
		sed -i "s/joystick.device.device.fn/joystick.device.device.path/g" $pkgdir/usr/lib/python$python_version/site-packages/ds4drv/actions/input.py
	fi
}
