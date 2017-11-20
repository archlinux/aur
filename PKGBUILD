# Maintainer: vltr <rkuesters@gmail.com>
pkgname=citus-git
pkgver=6.1.0.rc2.r670.g785d94e8
pkgrel=1
pkgdesc="Scalable PostgreSQL for multi-tenant and real-time workloads"
url="https://github.com/citusdata/citus"
arch=('any')
license=('AGPL-3.0')
depends=('postgresql')
makedepends=('postgresql-libs' git)
install="${pkgname}.install"
source=(git+https://github.com/citusdata/citus)
sha1sums=('SKIP')

pkgver() {
	cd citus
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd citus
	./configure
	make
}

package() {
	cd citus
	make DESTDIR=${pkgdir} install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
