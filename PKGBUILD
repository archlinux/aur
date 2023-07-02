# Maintainer: igo95862 at yandex dot ru
pkgname=bubblejail
pkgver=0.8.0
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3')
depends=(
	'python'
	'python-pyxdg'
	'bubblewrap'
	'python-tomli'
	'python-tomli-w'
	'xdg-dbus-proxy'
	'hicolor-icon-theme'
	'python-pyqt6'
	'desktop-file-utils'
	'libnotify'
)
conflicts=('bubblejail-git')
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
sha512sums=('98961352907eb6d3dc4dea52cf1649c8309e225c1e8e05a20055a3ac867665b9493d2f43c47335e4049a3fdbc6aec460fa58905d0e6e239db9261837e07f5716'
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
