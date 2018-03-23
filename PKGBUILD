# Maintainer: grufo <madmurphy333 at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname='fakeuser-git'
_appname='fakeuser'
pkgver='r8.2f456e0'
pkgrel=1
pkgdesc='LD_PRELOAD module to create fake users'
arch=('i686' 'x86_64')
url='https://github.com/progandy/fakeuser'
license=('GPL')
depends=('bash')
provides=("${_appname}")
conflicts=("${_appname}")
source=("git+https://github.com/progandy/${_appname}.git"
        'fakeuser.patch')
md5sums=('SKIP'
         'f09d97532d85fe51b0108e2f0c32acfc')

pkgver() {

	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_appname}"
	patch -p0 < "${srcdir}/fakeuser.patch"

}

build() {

	cd "${srcdir}/${_appname}"
	make

}

package() {

	cd "${srcdir}/${_appname}"
	install -dm755 "${pkgdir}/usr/share/doc/${_appname}/example-makepkg"
	install -dm755 "${pkgdir}/usr/bin"
	
	install -Dm755 'fakeadd' "${pkgdir}/usr/bin/fakeadd"
	install -Dm755 'fakeuser' "${pkgdir}/usr/bin/fakeuser"
	install -Dm755 'libfakeuser.so' "${pkgdir}/usr/lib/${_appname}/libfakeuser.so"
	cp 'example-makepkg/'* "${pkgdir}/usr/share/doc/${_appname}/example-makepkg"
	install -Dm644 "${srcdir}/${_appname}/"{README.md,LICENSE} "${pkgdir}/usr/share/doc/${_appname}"
	
	cat <<EOF > "${pkgdir}/usr/bin/fakepkg"
BASEDIR=/usr/lib/${_appname}
PATH="\$PATH:\$BASEDIR/" LD_PRELOAD="\$BASEDIR/libfakeuser.so" exec makepkg "\$@"
EOF

	chmod 755 "${pkgdir}/usr/bin/fakepkg"

}
