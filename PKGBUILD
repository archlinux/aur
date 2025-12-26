# Maintainer: Aninnia <bonfire-gory-glue at duck dot com>
# Contributor: Lauri Niskanen <ape at ape3000 dot com>
# Contributor: George Gibbs <vash63 at gmail dot com>

_pkgname=ds4drv
pkgname=ds4drv-git
pkgver=0.5.1.r26.gbe7327f
pkgrel=1
pkgdesc="Sony DualShock 4 Userspace Driver - git version (Bluetooth LED patch included)"
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
optdepends=(
	"hid-sony-panic-fix-dkms: Fixes issues with 3rd-party knock-off controllers"
)
makedepends=('git')
conflicts=('ds4drv')
install=ds4drv.install
source=(
	"$_pkgname::git+$url.git"
	ds4drv.conf
	13ae136098c1ed8bc8c72b16a4d73ab97049f6ae.patch
)
sha256sums=('SKIP'
            'd1b5537b7d76e029eac019f8b4c2b215dae08227fa65fa5da4fa58ffc23924a6'
            'da7b1041889ab85b7e3afeb8a9f509d23f969ec43ca053d72a89a27bdb03555f')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe | sed 's/^v//' | sed -E 's/-([0-9]+)-/.r\1./'
}

package() {
	local b="\e[1m" # bold
	local y="\e[33m" # yellow
	local c="\e[0m" # clear
	cd "$srcdir/$_pkgname"
	git apply "${srcdir}/13ae136098c1ed8bc8c72b16a4d73ab97049f6ae.patch" || printf "${b}${y}NOTICE: Bluetooth LED patch did not apply, ignoring...${c}\n"
	mkdir -pm755 "$pkgdir/etc/udev/rules.d"
	cp udev/50-ds4drv.rules "$pkgdir/etc/udev/rules.d/50-ds4drv.rules"
	mkdir -pm755 "$pkgdir/usr/share/licenses/$_pkgname"
	cp LICENSE "$pkgdir/usr/share/licenses/$_pkgname/"
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -pm755 "$pkgdir/etc/systemd/system"
	cp systemd/ds4drv.service "$pkgdir/etc/systemd/system/ds4drv.service"
	cp "$srcdir/ds4drv.conf" "$pkgdir/etc/ds4drv.conf"
	python_version_major=$(python -c "import sys; print(sys.version_info.major)")
	python_version_minor=$(python -c "import sys; print(sys.version_info.minor)")
	python_version="$python_version_major.$python_version_minor"
	if awk 'BEGIN{exit ARGV[1]<3.12}' "$python_version"; then
		sed -i "s/SafeConfigParser/ConfigParser/g" "$pkgdir/usr/lib/python$python_version/site-packages/ds4drv/config.py"
	fi
	if awk 'BEGIN{exit ARGV[1]<3.13}' "$python_version"; then
		sed -i "s/joystick.device.device.fn/joystick.device.device.path/g" "$pkgdir/usr/lib/python$python_version/site-packages/ds4drv/actions/input.py"
	fi
}
