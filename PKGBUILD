## Maintainer: peerchemist <peerchemist@protonmail.ch>

pkgname=('peercoind-git')
pkgbase=peercoind-git
_gitname=peercoin
pkgver=v0.6.2.rc1.r0.gd609c850
pkgrel=3
pkgdesc="Peercoin deamon - develop branch."
makedepends=('gcc' 'make' 'boost' 'miniupnpc' 'openssl')
depends=('boost-libs' 'openssl' 'miniupnpc')
replaces=("peercoind")
arch=('x86_64' 'i686')
url='peercoin.net'
license=('MIT')
source=(git+https://github.com/peercoin/${_gitname}.git#branch=master)
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/${_gitname}"
	./autogen.sh
}

build() {
	cd "$srcdir/${_gitname}"

	msg2 'Building...'
	./configure --with-incompatible-bdb --with-gui=no
  	make
}

check() {
  cd "$srcdir/${_gitname}"
  
  make check
}

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package_peercoind-git() {
	
	makedepends=('boost' 'gcc' 'make' 'openssl' 'miniupnpc')
	depends=('gcc' 'make' 'boost-libs' 'miniupnpc')
	optdepeneds=('systemd' 'tor')
	pkgdesc="Official implementation of Peercoin, the sustainable and secure cryptocurrency alternative to Bitcoin - daemon."
	install=peercoind-git.install

	cd "$srcdir/${_gitname}"
	install -Dm755 "src/peercoin-cli" "$pkgdir/usr/bin/peercoin-cli"
	install -Dm755 "src/peercoind" "$pkgdir/usr/bin/peercoind"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/peercoin/COPYING"
	install -Dm644 "contrib/systemd/${_gitname}d-tor@.service" "$pkgdir/usr/lib/systemd/system/${_gitname}d-tor@.service"
	install -Dm644 "contrib/systemd/${_gitname}d@.service" "$pkgdir/usr/lib/systemd/system/${_gitname}d@.service"
}
