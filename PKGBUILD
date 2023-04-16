# Maintainer: Viech <viech unvanquished net>

pkgname=unvtray
_gitname=unvanquished-tray-browser
pkgver=0.2.0
pkgrel=1
pkgdesc='A minimalistic Unvanquished server browser that runs in the system tray.'
arch=('any')
url="https://github.com/Unvanquished/${_gitname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'python-pillow' 'python-pystray')
optdepends=('unvanquished: launch and play the game')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
source=("https://github.com/Unvanquished/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('41de33a24ac1996f427c6f5c700bc88252fef563c3ebf5d5851590e16f9c8d38')

build() {
	cd "${srcdir}/${_gitname}-${pkgver}"
	SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_gitname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" \
		"dist/${pkgname}-${pkgver}-py3-none-any.whl"

	cd "package"
	install -dm 755 "${pkgdir}/usr/share/applications"
	install -m 644 "net.unvanquished.${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications"

	cd "icons"
	for resolution in $(ls -c1); do
		icondir="${pkgdir}/usr/share/icons/hicolor/${resolution}/apps"
		install -dm 755 "${icondir}"
		install -m 644 "${resolution}/${pkgname}.png" "${icondir}"
	done
}
