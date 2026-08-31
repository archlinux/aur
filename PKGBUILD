# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: djsigmann <aur+djsigmann@protonmail.com>
pkgname=casual-pre-loader
pkgver=2.3.0
pkgrel=1
pkgdesc="TF2 particle modifications via some wizardry."
arch=('x86_64')
url="https://cueki.github.io/casual-pre-loader/"
license=('GPL-3.0-or-later' 'CC-BY-NC-ND-4.0')
groups=()
depends=('python-pyqt6' 'python-more-itertools' 'python-packaging' 'python-platformdirs'
	 'python-rich' 'python-valve-parsers' 'python-pillow' 'python'
	 'python-pygithub' 'hicolor-icon-theme' 'python-urllib3'
	 'python-cappa'
)
makedepends=('gendesk' 'git')
optdepends=('wine: running studiomdl')
source=("git+https://github.com/cueki/${pkgname}.git#tag=v${pkgver}"
	"git+https://github.com/cueki/studiomdl.git")
sha256sums=('4406d14ca2fc3ad1d7fe6f650bebaea7e71f1950c0a1ef85d65a85d4966f6e9b'
            'SKIP')

prepare() {
	gendesk -n \
	-f \
	--pkgname="${pkgname}" \
	--pkgdesc="${pkgdesc}" \
	--name="Casual Pre-Loader" \
	--exec="${pkgname}" \
	--icon="${pkgname}" \
	--terminal=false

	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.studiomdl.url "$srcdir/studiomdl"
	git -c protocol.file.allow=always submodule update
}

package() {
	cd "$srcdir/$pkgname"
	install -dm755 "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	cp -a main.py backup/ core/ data/ gui/ "${pkgdir}/usr/lib/${pkgname}"
	ln -s "/usr/lib/${pkgname}/main.py" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/usr/lib/${pkgname}/gui/icons/cueki_icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	touch "${pkgdir}/usr/lib/${pkgname}/.noportable"
}
