# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=linux-arctis-manager
_pkgname=Linux-Arctis-Manager
pkgver=1.6.2
pkgrel=1
pkgdesc="A replacement for SteelSeries GG software, to manage your Arctis device on Linux! "
arch=('x86_64')
url="https://github.com/espressif/llvm-project"
license=('GPL-3.0-only')
# depends=(python-dbus-next python-pyusb python-pyqt6)
makedepends=(python-pipenv)
checkdepends=()
source=("https://github.com/elegos/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f6a6d8f625ad4b217f5fc882434b7c50b6768627ea52d0eec23610672bfa9b4b')

prepare(){
	cd "$_pkgname-$pkgver"
}

build() {
	cd "$_pkgname-$pkgver"
    python -m pipenv install -d
    python -m pipenv run pyinstaller arctis-manager.spec
    python -m pipenv run pyinstaller arctis-manager-launcher.spec
    python -m pipenv --rm
}

package() {
	cd "$_pkgname-$pkgver"

	# Binaries
	install -D -t $pkgdir/usr/bin/ dist/arctis-manager 
	install -D -t $pkgdir/usr/bin/ dist/arctis-manager-launcher


	# Desktop
	install -D -t $pkgdir/usr/share/applications/ ArctisManager.desktop

	# Icons
	install -D -t $pkgdir/usr/share/icons/hicolor/scalable/apps/ arctis_manager/images/steelseries_logo.svg

	# Udev
	install -D -t $pkgdir/usr/lib/udev/rules.d/ udev/91-steelseries-arctis.rules

	# Systemd
	install -D -t $pkgdir/usr/lib/systemd/user/ systemd/arctis-manager.service
}
