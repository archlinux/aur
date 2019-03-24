# Maintainer: mwberry <null [at] example [dot] com>
pkgname=pam-ssh-git
pkgver=2.3.r0.g6b4848e
pkgrel=1
pkgdesc="A Pluggable Authentication Module (PAM) for use with SSH."
arch=('x86_64')
url="http://pam-ssh.sourceforge.net/"
license=('BSD')
depends=('pam' 'openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('pam-ssh-git::git://git.code.sf.net/p/pam-ssh/git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
        printf "%s" "$(git describe --long --tags | sed 's/^PAM_SSH_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g')"
}

prepare() {
	cd "$srcdir/${pkgname}"
}

build() {
	cd "$srcdir/${pkgname}"
	./bootstrap.sh
	./configure --prefix=/usr --with-pam-dir=/usr/lib/security
	make
}

check() {
	cd "$srcdir/${pkgname}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install

	_licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${_licensedir}"
	install "$srcdir/${pkgname}/COPYING" "${_licensedir}/COPYING"
}
