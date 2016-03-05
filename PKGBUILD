pkgname=readeef-client-git
pkgver=b2f70a2
pkgrel=1
pkgdesc='An electron client for the readeef feed aggregator'
arch=('i686' 'x86_64')
url='https://neovim.io'
license=('LGPL3')
depends=('electron')
makedepends=('git npm findutils')
conflicts=('readeef-client')
source=(
	"${pkgname}::git+https://github.com/urandom/readeef-electron.git"
	"remove-electron-prebuilt.patch"
	"readeef-client"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)
provides=("readeef-client=${pkgver}")

pkgver() {
  cd "${pkgname}"
  git rev-parse --short HEAD
}

prepare() {
	cd "${pkgname}"

	patch -p0 -i "${srcdir}/remove-electron-prebuilt.patch"
}

package() {
	install -Dm0755 "readeef-client" "${pkgdir}/usr/bin/readeef-client"

	cd "${pkgname}"
	npm install .

	install -Dm0644 "extra/readeef-client.desktop" "${pkgdir}/usr/share/applications/readeef-client.desktop"
	install -Dm0644 "images/readeef-256.png" "${pkgdir}/usr/share/icons/readeef-client.png"
	find . -type f -not \( -path './.git/*' -prune \) -not -name .gitignore -exec install -Dm0644 '{}' "${pkgdir}/usr/lib/readeef-client/{}" \;
}
