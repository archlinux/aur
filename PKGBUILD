pkgname='bubblewrap-git'
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
license=('LGPL')
pkgver=v0.3.1.r6.g94147e2
pkgrel=1
arch=('x86_64' 'i686')
makedepends=('autoconf' 'automake' 'libxslt' 'docbook-xsl' 'git')
conflicts=('bubblewrap')
provides=('bubblewrap')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')
install='bubblewrap.install'

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	cd "${pkgname}"
	NOCONFIGURE=1 ./autogen.sh
}

build () {
	cd "${pkgname}"
	./configure --prefix=/usr --with-bash-completion-dir=/usr/share/bash-completion --with-priv-mode=setuid
	make
}

package () {
	cd "${pkgname}"
	make install DESTDIR="${pkgdir}"
}
