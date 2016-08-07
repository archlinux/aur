# Maintainer: mwberry <null [at] example [dot] com>
pkgname=pam-ssh-git
pkgver=2.1.r0.g7546abc
pkgrel=1
pkgdesc="A Pluggable Authentication Module (PAM) for use with SSH."
arch=('i686' 'x86_64')
url="http://pam-ssh.sourceforge.net/"
license=('BSD')
depends=('pam' 'openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('pam-ssh-git::git://git.code.sf.net/p/pam-ssh/git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname}"
        printf "%s" "$(git describe --long | sed 's/^PAM_SSH_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g')"
}

prepare() {
	cd "$srcdir/${pkgname}"
}

build() {
	cd "$srcdir/${pkgname}"
	./bootstrap.sh
	./configure --prefix=/usr --with-pam-dir=/usr/lib
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
