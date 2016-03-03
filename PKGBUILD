# Maintainer: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=atom-editor-beta
_pkgbeta=7
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
source=("https://github.com/atom/atom/archive/v${_pkgver}-beta${_pkgbeta}.tar.gz"
        'atom-desktop.patch')
sha256sums=('66fa84ab4e84ed0e4ea52ff4cfe8b7cc873252f8ee6048f3ceb51464bf8d5962'
            'b144dd1578528ca7f3d8d100db873eb32fbc4d801e45b2161d281629a32695a1')

prepare() {
	cd "atom-${_pkgver}-beta${_pkgbeta}"

	sed -i -e "/exception-reporting/d" \
		-e "/metrics/d" package.json

	sed -e "s/<%= description %>/$pkgdesc/" \
		-e "s|<%= appName %>|Atom|"\
		-e "s|<%= installDir %>/share/<%= appFileName %>|/usr/bin|"\
		-e "s|<%= iconPath %>|atom|"\
		resources/linux/atom.desktop.in > resources/linux/Atom.desktop
}

build() {
	cd "$srcdir/atom-${_pkgver}-beta${_pkgbeta}"

	export PYTHON=python2
	script/build --build-dir "$srcdir/atom-build"
}

package() {
	cd "$srcdir/atom-${_pkgver}-beta${_pkgbeta}"

	script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"
	patch resources/linux/Atom.desktop < "${srcdir}/atom-desktop.patch"
	install -Dm644 resources/linux/Atom.desktop "$pkgdir/usr/share/applications/atom.desktop"
	install -Dm644 resources/app-icons/stable/png/1024.png "$pkgdir/usr/share/pixmaps/atom.png"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
