# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-deezer-git
pkgver=r10.18f0b89
pkgrel=2
pkgdesc='Deezer integration for Nuvola Player.'
arch=('any')
url='https://github.com/tiliado/nuvola-app-deezer'
license=('custom:BSD')
depends=('nuvolaplayer-git')
makedepends=('git' 'lasem')
source=("${pkgname}::git+https://github.com/tiliado/nuvola-app-deezer.git"
        '0001-fix-makefile.patch'
        '0002-fix-icons.patch')
sha256sums=('SKIP'
            '5f2112928b5ed9d58fc3e1353ef31b2403f0c20bf0b58e4a4f7dd24fbc66bef1'
            '4eba2a4c2d74dc8aa8b1395cb00ec947901a672129e7ccdcdfc55350dd19e650')

pkgver() {
	cd "${pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "${pkgname}"
	patch -p1 -i "${srcdir}/0001-fix-makefile.patch"
	patch -p1 -i "${srcdir}/0002-fix-icons.patch"
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps" SVG_CONVERT="lasem-render-0.4"
}
