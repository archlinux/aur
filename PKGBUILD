pkgname='tappet-git'
pkgver=0
pkgrel=1
pkgdesc='Simple encrypted UDP tunnel using TweetNaCl'
license='MIT'
url='https://github.com/amenonsen/tappet'
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')
arch=('i686' 'x86_64' 'arm')
depends=('glibc' 'iproute2')
options=('strip')
provides=('tappet')
conflicts=('tappet')

pkgver () {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
	cd "${srcdir}/${pkgname}"
	eval "$(sed -e '/^CFLAGS=/p' -e d /etc/makepkg.conf)"
	make OPTIM="${CFLAGS}"
}

package () {
	cd "${srcdir}/${pkgname}"
	install -Dm644 README \
		"${pkgdir}/usr/share/doc/${pkgname}"
	for program in tappet tappet-keygen ; do
		install -Dm755 "${program}" \
			"${pkgdir}/usr/bin/${program}"
	done
}
