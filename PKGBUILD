# Maintainer: igo95862 at yandex dot ru
pkgname=bubblejail
pkgver=0.5.2
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3+')
depends=('python' 'python-xdg' 'bubblewrap' 'python-tomli' 'python-tomli-w' 'xdg-dbus-proxy' 'hicolor-icon-theme' 'python-pyqt5' 'desktop-file-utils')
conflicts=('bubblejail-git')
optdepends=(
	'bash-completion: completions for bash shell'
	'fish: completions for fish shell'
	)
makedepends=('meson' 'm4' 'python-sphinx')
source=(
	"$url/releases/download/$pkgver/bubblejail-$pkgver.tar.gz"
	"$url/releases/download/$pkgver/bubblejail-$pkgver.tar.gz.sig"
	)
# To get the valid GPG key
# gpg --keyserver https://keys.mailvelope.com/ --search-keys 5A3D06576A6A67443DFBE856F1A55E62951B2143
# Alternative if the above keyserver does not work
# curl -s 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x5a3d06576a6a67443dfbe856f1a55e62951b2143' | gpg --import
validpgpkeys=('5A3D06576A6A67443DFBE856F1A55E62951B2143')
sha512sums=('eaf7dffdb1d51ca5856dce8f054857b358b256dcf617dc9400f4c3725adb40973fc1c661ac20f96bcfdb13bab1333176c357d2621d46e5fb84815b551ad43ab9'
            'SKIP')

check () {
    	# Set runtime directory
    	mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
    	export XDG_RUNTIME_DIR
    	
	meson test -C build --print-errorlogs
}

build () {
	arch-meson "$srcdir" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
