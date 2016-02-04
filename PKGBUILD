# Maintainer: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=atom-editor-beta
_pkgrel=beta3
_pkgver=1.5.0
pkgver="${_pkgver}.${_pkgrel}"
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
source=("https://github.com/atom/atom/archive/v${_pkgver}-${_pkgrel}.tar.gz"
        'atom-desktop.patch')
sha256sums=('327ee22f709de65bf7b666371569a2094d04faf6dc983e32555d0bde80273da4'
            'b144dd1578528ca7f3d8d100db873eb32fbc4d801e45b2161d281629a32695a1')

prepare() {
	cd "atom-${_pkgver}-${_pkgrel}"

	sed -i -e "/exception-reporting/d" \
		-e "/metrics/d" package.json

	sed -e "s/<%= description %>/$pkgdesc/" \
		-e "s|<%= appName %>|Atom|"\
		-e "s|<%= installDir %>/share/<%= appFileName %>|/usr/bin|"\
		-e "s|<%= iconPath %>|atom|"\
		resources/linux/atom.desktop.in > resources/linux/Atom.desktop
}

build() {
	cd "$srcdir/atom-${_pkgver}-${_pkgrel}"

	export PYTHON=python2
	script/build --build-dir "$srcdir/atom-build"
}

package() {
	cd "$srcdir/atom-${_pkgver}-${_pkgrel}"

	script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"
	patch resources/linux/Atom.desktop < "${srcdir}/atom-desktop.patch"
	install -Dm644 resources/linux/Atom.desktop "$pkgdir/usr/share/applications/atom.desktop"
	install -Dm644 resources/app-icons/stable/png/1024.png "$pkgdir/usr/share/pixmaps/atom.png"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
