# Contributor: Jonathan Ryan <jryan@curious-computing.com>
# Contributor: Kevin Thomas <hamgom95@gmail.com>
pkgname=htpdate-git
pkgver=0.r7.gb707e2f
pkgrel=1
pkgdesc="HTTP time protocol, time synchronisation client"
arch=('i686' 'x86_64')
url="http://www.vervest.org/htp/"
options=(!libtool)
license=(GPL2)
depends=('gcc-libs')
makedepends=('patch')
conflicts=('htpdate')
provides=('htpdate')
source=('git+http://www.github.com/iridium77/htpdate.git' 'htpdate.service')
pkgver() {
	cd htpdate/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[_-+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd htpdate/
	make
}

package() {
  install -D -m 644 htpdate.service ${pkgdir}/usr/lib/systemd/system/htpdate.service
	cd htpdate/
	install -D -m 755 htpdate ${pkgdir}/usr/bin/htpdate || return 1
	install -D -m 644 htpdate.8.gz ${pkgdir}/usr/share/man/man8/htpdate.8.gz || return 1
	install -D -m 755 ${srcdir}/htpdate/htpdate ${pkgdir}/etc/rc.d/htpdate || return 1
}

md5sums=('SKIP'
         'b419153625904d9a5544e585f69c66c5')
