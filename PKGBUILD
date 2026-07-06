# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: djsigmann <aur+djsigmann@protonmail.com>
pkgname=casual-pre-loader
pkgver=2.2.1
pkgrel=1
pkgdesc="TF2 particle modifications via some wizardry."
arch=('x86_64')
url="https://cueki.github.io/casual-pre-loader/"
license=('GPL-3.0-or-later' 'CC-BY-NC-ND-4.0')
groups=()
depends=('python-pyqt6' 'python-more-itertools' 'python-packaging' 'python-platformdirs'
	 'python-requests' 'python-rich' 'python-valve-parsers' 'python-pillow' 'python'
	 'python-pygithub' 'hicolor-icon-theme'
)
makedepends=('gendesk' 'git')
optdepends=('wine: running studiomdl')
source=("git+https://github.com/cueki/${pkgname}.git#tag=v${pkgver}"
	"git+https://github.com/cueki/studiomdl.git")
sha256sums=('ab4e2e93078542d9895afd68d0409a5ee7cc8ff978f35fbaa29b7f07c26c42f7'
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
	sed -i 's/True/False/g' core/are_we_portable.py
	install -dm755 "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	cp -a main.py backup/ core/ data/ gui/ "${pkgdir}/usr/lib/${pkgname}"
	ln -s "/usr/lib/${pkgname}/main.py" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/usr/lib/${pkgname}/gui/icons/cueki_icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
