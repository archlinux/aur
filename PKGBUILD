# Maintainer: igo95862 at yandex dot ru
pkgname=bubblejail
pkgver=0.8.2
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3')
depends=(
	'python'
	'python-pyxdg'
	'bubblewrap'
	'python-tomli-w'
	'xdg-dbus-proxy'
	'hicolor-icon-theme'
	'python-pyqt6'
	'desktop-file-utils'
	'libnotify'
)
optdepends=(
	'bash-completion: completions for bash shell'
	'fish: completions for fish shell'
	'slirp4netns: Namespaced networking stack'
	)
makedepends=('meson' 'python-jinja' 'scdoc')
source=(
	"$url/releases/download/$pkgver/bubblejail-$pkgver.tar.gz"
	"$url/releases/download/$pkgver/bubblejail-$pkgver.tar.gz.sig"
	)
# To get the valid GPG key
# gpg --keyserver https://keys.mailvelope.com/ --search-keys 5A3D06576A6A67443DFBE856F1A55E62951B2143
# Alternative if the above keyserver does not work
# curl -s 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x5a3d06576a6a67443dfbe856f1a55e62951b2143' | gpg --import
validpgpkeys=('5A3D06576A6A67443DFBE856F1A55E62951B2143')
sha512sums=('c8a2731748c2f5737520c43b69f5a5dce28706801f50c87abfca7bfce9b0432102867e361b86866c7df88bcdff4d0db89c4b4abc5ad1c6fe601f44d49142a79d'
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
