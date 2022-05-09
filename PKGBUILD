# Maintainer: vltr <rkuesters@gmail.com>
pkgname=citus-git
pkgver=11.1.devel.5786.ra2158794b
pkgrel=1
pkgdesc="Scalable PostgreSQL for multi-tenant and real-time workloads"
url="https://github.com/citusdata/citus"
arch=('any')
license=('AGPL-3.0')
depends=('postgresql')
makedepends=('postgresql-libs' git llvm make automake clang)
provides=(citus)
conflits=(citus)
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/citusdata/citus")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo "$(cat configure.in | grep AC_INIT | cut -d'[' -f3 | sed 's/\(])\)//g' | sed 's/devel/\.devel/g').$(git shortlog | grep -E '^[ ]+\w+' | wc -l).r$(git log --pretty=format:'%h' -n 1)"
}

build() {
	cd "$pkgname"
	./configure
	make
}

package() {
	cd "$pkgname"
	make DESTDIR=${pkgdir} install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
