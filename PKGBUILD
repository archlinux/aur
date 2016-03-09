# Maintainer: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=atom-editor-beta
_pkgbeta=8
_pkgver=1.6.0
pkgver="${_pkgver}.beta${_pkgbeta}"
pkgrel=1
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
sha256sums=('7e4949e9b07826158db1ee17450fd9abb5ab24391e83439ccc5ab5c9beab21fe')

prepare() {
	cd "atom-${_pkgver}-beta${_pkgbeta}"

	sed -i -e "/exception-reporting/d" \
		-e "/metrics/d" package.json
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
