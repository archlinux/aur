# Contributor: shyokou <shyokou at gmail dot com>
# Maintainer: N. Izumi aka izmntuk
pkgname=meek
pkgver=0.15
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A pluggable transport proxy written in Go'
provides=('meek-client' 'meek-server')
conflicts=('meek-client' 'meek-server')
optdepends=('tor')
url='https://trac.torproject.org/projects/tor/wiki/doc/meek'
license=('custom')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://git.torproject.org/pluggable-transports/meek.git#tag=${pkgver}")
sha1sums=('SKIP')

prepare() {
	cd "${srcdir}/meek"
	sed 's|./meek-client|/usr/bin/meek-client|g;
	     s|./meek-server|/usr/bin/meek-server|g;
	     s|\(meek-server\.log\)|/tmp/\1|;
	     s|\(meek-client\.log\)|/tmp/\1|' -i meek-{server,client}/torrc
}

build() {
	export GOPATH="${srcdir}"
	export GOBIN="."
	cd "${srcdir}/meek/meek-server"
	msg2 'Fetching necessary libraries...'
	go get
	msg2 'Building meek-server...'
	make all
	cd "${srcdir}/meek/meek-client"
	msg2 'Building meek-client...'
	make all
}

package() {
	install -d "${pkgdir}"/usr/{bin,share/{{doc,licenses}/"${pkgname}",man/man1}}
	cd "${srcdir}/meek/meek-server"
	install -m755 meek-server "${pkgdir}/usr/bin"
	install -Dm644 torrc "${pkgdir}/usr/share/doc/${pkgname}/torrc.meek-server"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README.meek-server"
	cd "${srcdir}/meek/meek-client"
	install -m755 meek-client "${pkgdir}/usr/bin"
	install -Dm644 torrc "${pkgdir}/usr/share/doc/${pkgname}/torrc.meek-client"
	install -m644 ../README "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 ../doc/meek-{server,client}.1 "${pkgdir}/usr/share/man/man1"
}
