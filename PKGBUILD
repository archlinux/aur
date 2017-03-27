# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname='fakeuser-git'
_pkgname='fakeuser'
pkgver='8.2f456e0'
pkgrel=1
pkgdesc='LD_PRELOAD module to create fake users'
arch=('i686' 'x86_64')
url='https://github.com/progandy/fakeuser'
license=('GPL')
depends=('glibc')
provides=('fakeuser')
conflicts=('fakeuser')
source=('git://github.com/progandy/fakeuser.git')
md5sums=('SKIP')

pkgver() {

	cd "${srcdir}/${_pkgname}"
	echo "'$(git rev-list --count master).$(git rev-parse --short master)'"

}

build() {

	cd "${srcdir}/${_pkgname}"
	make

}

package() {

	cd "${srcdir}/${_pkgname}"
	install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/example-makepkg"
	install -dm755 "${pkgdir}/usr/bin"
	
	install -Dm755 'fakeadd' "${pkgdir}/usr/bin/fakeadd"
	install -Dm755 'fakeuser' "${pkgdir}/usr/bin/"
	install -Dm755 'libfakeuser.so' "${pkgdir}/usr/lib/fakeuser/libfakeuser.so"
	cp 'example-makepkg/'* "${pkgdir}/usr/share/doc/${_pkgname}/example-makepkg"
	install -Dm644 "${srcdir}/${_pkgname}/"{README.md,LICENSE} "${pkgdir}/usr/share/doc/${_pkgname}"
	
	cat <<EOF > "${pkgdir}/usr/bin/fakepkg"
BASEDIR=/usr/lib/${_pkgname}
PATH="\$PATH:\$BASEDIR/" LD_PRELOAD="\$BASEDIR/libfakeuser.so" exec makepkg "\$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/fakepkg"

}
