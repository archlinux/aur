# Maintainer: LoupZeur <loup@loupzeur.net>
pkgname=asus-touchpad-numpad
pkgver=1.0
pkgrel=0
pkgdesc="asus touchpad numpad toggler, require configuration, read the PKGBUILD and the github stuff"
arch=('any')
url="https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver"
license=('GPL')
groups=()
depends=('python>=3.8'
		'libevdev'
		'python-libevdev'
		'i2c-tools'
		'git')
makedepends=()
checkdepends=()
optdepends=()
provides=(asus-touchpad-numpad)
conflicts=(asus-touchpad-numpad-driver)
replaces=(asus-touchpad-numpad)
backup=()
options=()
install=
changelog=
source=("git+https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver.git")
noextract=($source)
md5sums=(SKIP)
validpgpkeys=()

prepare() {
	echo "[!]Prepare install you need to configure the layout of your keyboard and your touchpad"
	echo "Don't forget to enable and start the service asus_touchpad_numpad after installation"
	echo "to enable : sudo systemctl enable asus_touchpad_numpad"
	echo "to start : sudo systemctl start asus_touchpad_numpad"
}

package() {
	percentage_key=40 #for azerty keyboard or 5 on qwerty
	model=ux433fa # or m433ia or ux581l depends on your layout

	ls -alr
	#required 
	mkdir -p "${pkgdir}/usr/share/asus_touchpad_numpad-driver/numpad_layouts"
	mkdir -p "${pkgdir}/var/log/asus_touchpad_numpad-driver"
	mkdir -p "${pkgdir}/etc/systemd/system/"
	mkdir -p "${pkgdir}/etc/modules-load.d/"
	#loading module
	echo "i2c-dev" | tee "${pkgdir}/etc/modules-load.d/i2c-dev.conf" >/dev/null
	
	#installing scripts
	install ${srcdir}/${pkgname}/asus_touchpad.py "${pkgdir}/usr/share/asus_touchpad_numpad-driver/"
	install -t "${pkgdir}/usr/share/asus_touchpad_numpad-driver/numpad_layouts" ${srcdir}/${pkgname}/numpad_layouts/*.py
	cat ${srcdir}/${pkgname}/asus_touchpad.service | LAYOUT=$model PERCENTAGE_KEY=$percentage_key envsubst '$LAYOUT $PERCENTAGE_KEY' > ${pkgdir}/etc/systemd/system/asus_touchpad_numpad.service
}
