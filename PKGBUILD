# Maintainer: igo95862 at yandex dot ru
pkgname=bubblejail
pkgver=0.6.2
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3+')
depends=(
	'python' 'python-xdg' 'bubblewrap'
	'python-tomli' 'python-tomli-w' 'xdg-dbus-proxy'
	'hicolor-icon-theme' 'python-pyqt5' 'desktop-file-utils'
	'libnotify')
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
sha512sums=('7632732c04ff9ddc1bb9196d0862c4445e4b2cbd23afbd0f4df27cc4bb5bf9ec791a5eed8eedab232bdef7d487b516143dd0c35bac2223a70ab6c22178b8373a'
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
