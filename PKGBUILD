# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=linux-arctis-manager-legacy
_pkgname=Linux-Arctis-Manager-Legacy
pkgver=1.6.3
pkgrel=2
pkgdesc="A replacement for SteelSeries GG software, to manage your Arctis device on Linux! (Legacy) "
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager-Legacy/"
license=('GPL-3.0-only')
depends=(python-dbus-next python-pyusb python-pyqt6 python-installer)
makedepends=(python-pipenv)
checkdepends=()
source=("https://github.com/elegos/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6bb09e43b5c8f58c9553469e6691ca703b0b3d6a4a82f5a3f8bc1a68a46ca8fb')

prepare(){
	cd "$_pkgname-$pkgver"
	sed -i -e "s/lib64/lib/" arctis-manager.spec
	sed -i -e "/Version=/ s/=.*/=$pkgver/" ArctisManager.desktop
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
	install -D -t "$pkgdir"/usr/bin/ dist/arctis-manager 
	install -D -t "$pkgdir"/usr/bin/ dist/arctis-manager-launcher


	# Desktop
	install -D -t "$pkgdir"/usr/share/applications/ ArctisManager.desktop

	# Icons
	install -D -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps/ arctis_manager/images/steelseries_logo.svg

	# Udev
	install -D -t "$pkgdir"/usr/lib/udev/rules.d/ udev/91-steelseries-arctis.rules

	# Systemd
	install -D -t "$pkgdir"/usr/lib/systemd/user/ systemd/arctis-manager.service
}

