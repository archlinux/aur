pkgname=readeef-client-git
pkgver=5e31fc5
pkgrel=1
pkgdesc='An electron client for the readeef feed aggregator'
arch=('i686' 'x86_64')
url='https://sugr.org/en/products/readeef'
license=('LGPL3')
depends=('electron')
makedepends=('git npm findutils')
conflicts=('readeef-client')
source=(
	"${pkgname}::git+https://github.com/urandom/readeef-electron.git"
)
sha256sums=(
	'SKIP'
)
provides=("readeef-client=${pkgver}")

pkgver() {
  cd "${pkgname}"
  git rev-parse --short HEAD
}

package() {
	echo '#!/bin/sh

exec electron /usr/lib/readeef-client/ "$@"' > readeef-client
	install -Dm0755 "readeef-client" "${pkgdir}/usr/bin/readeef-client"

	cd "${pkgname}"
	npm install --production .

	install -Dm0644 "extra/readeef-client.desktop" "${pkgdir}/usr/share/applications/readeef-client.desktop"
	install -Dm0644 "images/readeef-256.png" "${pkgdir}/usr/share/icons/readeef-client.png"
	find . -type f -not \( -path './.git/*' -prune \) -not -name .gitignore -exec install -Dm0644 '{}' "${pkgdir}/usr/lib/readeef-client/{}" \;
}
