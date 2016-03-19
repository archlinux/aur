# Maintainer: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=atom-editor-beta
_pkgbeta=0
_pkgver=1.7.0
pkgver="${_pkgver}.beta${_pkgbeta}"
pkgrel=4
pkgdesc='Chrome-based text editor from Github - Beta Channel'
arch=('x86_64' 'i686')
url='https://github.com/atom/atom'
license=('MIT')
depends=('alsa-lib' 'desktop-file-utils' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
conflicts=('atom-editor-bin' 'atom-editor-git' 'atom-editor-beta-bin' 'atom-editor')
install=atom.install
source=("https://github.com/atom/atom/archive/v${_pkgver}-beta${_pkgbeta}.tar.gz")
sha256sums=('ec8be58b9bd43e8b82f206ddf8745476d7e174d2ec560a7257cd76c5017197e1')

prepare() {
	cd "atom-${_pkgver}-beta${_pkgbeta}"

	sed -i -e "/exception-reporting/d" \
		-e "/metrics/d" package.json

	if pacman -Qi freetype2 | grep "2.6.3-1" &>/dev/null; then
		echo -e "\x1b[1;31mwarning: \x1b[0mAtom has issues with the latest version of Freetype2 [2.6.3-1]."
		echo "         Downgrade to 2.6.2-1 to ensure everything will run smoothly."
	fi
}

build() {
	cd "$srcdir/atom-${_pkgver}-beta${_pkgbeta}"

	export PYTHON=python2
	script/build --build-dir "$srcdir/atom-build"
}

package() {
	cd "$srcdir/atom-${_pkgver}-beta${_pkgbeta}"
	script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"
	sed -re "s/^(Exec=).*/\1atom-beta/g;s/^(Icon=).*/\1atom-beta/g;s|(text/plain;$)|\1\nStartupWMClass=Atom\n|g" \
	    "$pkgdir/usr/share/applications/atom-beta.desktop" \
	    | tee "$pkgdir/usr/share/applications/atom-beta.desktop" 1>/dev/null
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
