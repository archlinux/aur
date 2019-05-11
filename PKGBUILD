# Maintainer: Henrik Asp <solenskiner@gmail.com>

_realname=nymea-networkmanager
pkgname=$_realname-git
pkgver=r51.03bff81
pkgrel=1
pkgdesc="This daemon allows to set up the wireless network using a Bluetooth LE connection. "
arch=('arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/guh/nymea-networkmanager"
license=('GPL')
groups=()
depends=('qt5-base' 'glibc' 'gcc-libs' 'qt5-connectivity' 'gnupg' 'bluez' 'networkmanager' 'pi-bluetooth')
makedepends=('git' 'qt5-base' 'qt5-connectivity') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=('etc/nymea/nymea-networkmanager.conf')
options=()
install=nymea-networkmanager.install
source=('git+https://github.com/guh/nymea-networkmanager.git')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$_realname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
	touch "$pkgname"
	cd "$srcdir/${_realname}"
	mkdir -p build
	cd build
	qmake ..
	make
}

package() {
	cd "$srcdir/${_realname}/build"
	make INSTALL_ROOT="$pkgdir/" install
	install -Dm 644 ../nymea-networkmanager.service "$pkgdir/usr/lib/systemd/system/nymea-networkmanager.service"
	install -Dm 600 ../nymea-networkmanager.conf "$pkgdir/etc/nymea/nymea-networkmanager.conf"
}
