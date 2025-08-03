# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=linux-arctis-manager
_pkgname=Linux-Arctis-Manager
pkgver=1.6.3
pkgrel=1
pkgdesc="A replacement for SteelSeries GG software, to manage your Arctis device on Linux! "
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager/"
license=('GPL-3.0-only')
# depends=(python-dbus-next python-pyusb python-pyqt6)
makedepends=(python-pipenv)
checkdepends=()
source=("https://github.com/elegos/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('581d370106b458fe3d4952df202864714b53d463e795525d04fec186782fd266')

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

