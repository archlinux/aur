# Maintainer: Lordxan <52027483+Lordxan@users.noreply.github.com>
# Contributor: alecromski <alecromski@gmail.com>

pkgname=asus-touchpad-numpad-driver
pkgver=r167.a2bada6
pkgrel=1
pkgdesc="asus touchpad numpad driver"
arch=('any')
url="https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver"
license=('GPL')
depends=('python>=3.8' 'libevdev' 'python-libevdev' 'i2c-tools')
makedepends=('git' 'gum')
provides=(asus-touchpad-numpad-driver)
source=("git+https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"

	echo "Select models keypad layout:"
	model=$(gum choose gx701 m433ia ux433fa ux581l)
	
	echo "What is your keyboard layout?"
	layout=$(gum choose Qwerty Azerty)
	if [ $layout = "Qwerty" ]
	then
		percentage_key=6 # Number 5
	else
		percentage_key=40 # Apostrophe key
	fi

	cat asus_touchpad.service | LAYOUT=$model PERCENTAGE_KEY=$percentage_key envsubst '$LAYOUT $PERCENTAGE_KEY' > temp.service
	mkdir -p "$pkgdir/var/log/asus_touchpad_numpad-driver"
	mkdir -p "$pkgdir/etc/modules-load.d"
	install -Dm644 temp.service "$pkgdir/etc/systemd/system/asus_touchpad_numpad.service"
	install -Dm755 asus_touchpad.py "$pkgdir/usr/share/asus_touchpad_numpad-driver/asus_touchpad.py"
	install -Dm755 numpad_layouts/*.py -t "$pkgdir/usr/share/asus_touchpad_numpad-driver/numpad_layouts"
	echo "i2c-dev" | tee "$pkgdir/etc/modules-load.d/i2c-dev.conf" > /dev/null
}
