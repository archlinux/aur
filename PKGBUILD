# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

_pkgname=wish
pkgname=wish-git
pkgver=1.3.r7905f84
pkgrel=1
pkgdesc='Japanese-to-English dictionary software, command-line and web interface'
arch=('any')
url='https://github.com/fmang/wish'
license=('PerlArtistic')

depends=('perl' 'perl-cgi-fast' 'perl-term-readline-gnu' 'perl-uri')
makedepends=('git' 'sassc')
optdepends=('spawn-fcgi')

provides=('wish')
conflicts=('wish')

source=('git+https://github.com/fmang/wish.git' 'wish-fcgi.service')
sha256sums=('SKIP' '1e973469bf9c5b37b9240a95364cec6128d325703f96a1db28b33406c3666aa7')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	_ver="$(sed -ne 's/AC_INIT(\[wish\], \[\([0-9.]*\)\].*$/\1/p' configure.ac)"
	_rev="$(git rev-parse --short HEAD)"
	_commits="$(git rev-list --count HEAD)"
	echo "$_ver.r$_commits.$_rev"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr --libexecdir=/usr/lib
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="$pkgdir" install
	cd "${srcdir}"
	install -Dm644 wish-fcgi.service "$pkgdir/usr/lib/systemd/system/wish-fcgi.service"
}
