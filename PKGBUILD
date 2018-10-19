# Maintainer: lf <packages at lfcode dot ca>
pkgname=klipper-git
pkgver=r1489.29e0996
pkgrel=1
pkgdesc="3D printer firmware with motion planning on the host"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/KevinOConnor/klipper"
license=('GPLv3')
groups=()
depends=(
	python2-cffi
	python2-pyserial
	python2-greenlet
	ncurses
	libusb
	avrdude
	avr-gcc
	avr-binutils
	avr-libc
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/KevinOConnor/klipper#branch=master' 'klipper.service' 'sysusers.conf' 'tmpfiles.conf')
noextract=()
md5sums=('SKIP'
         '5ea11719eef9fa6c740d19e1c2fa3932'
         '80229d1797c904ef046acfcc3b26e593'
         '18f0e2664394a5042ff21737e1796db7')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	make clean
	git clean -fx
}

build() {
	cd "$srcdir/${pkgname%-git}"
	echo 'Building C module...'
	python2 klippy/chelper/__init__.py
	echo 'Done'
	python2 -m compileall klippy
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 "$srcdir/klipper.service" "$pkgdir/usr/lib/systemd/system/klipper.service"
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/klipper.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/klipper.conf"
	install -dm755 "$pkgdir/opt/klipper"
	GLOBIGNORE=.git cp -r * "$pkgdir/opt/klipper"
}
