pkgname='bubblewrap-git'
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
license=('LGPL')
pkgver=0.1.2.r1.g169db04
pkgrel=3
arch=('x86_64' 'i686')
makedepends=('autoconf' 'automake' 'libxslt')
conflicts=('bubblewrap')
provides=('bubblewrap')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')
install='bubblewrap.install'

_privmode='setuid'
_set_privmode () {
	if [[ -r /proc/config.gz ]] ; then
		eval "$(zgrep '^CONFIG_USER_NS=' /proc/config.gz)"
		if [[ -n ${CONFIG_USER_NS} && ${CONFIG_USER_NS} != n ]] ; then
			_privmode='caps'
		fi
	fi
}

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
	_set_privmode
	cd "${pkgname}"
	./configure --prefix=/usr --with-bash-completion-dir=/usr/share/bash-completion --with-priv-mode=${_privmode}
	make
}

package () {
	_set_privmode
	cd "${pkgname}"
	make install DESTDIR="${pkgdir}"
}
