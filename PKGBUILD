# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: djsigmann <aur+djsigmann@protonmail.com>
pkgname=casual-pre-loader
pkgver=2.3.1
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
sha256sums=('69746ecccd9570dfb73171c17030d275b16fbf4a12ccb312af56611457bf4d03'
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
	rm "${pkgdir}/usr/lib/${pkgname}/core/quickprecache/studio/.git"
	touch "${pkgdir}/usr/lib/${pkgname}/.noportable"
}
