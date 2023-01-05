# Contributor: tristero

pkgname=arcs-tools-git
pkgver=0.1.0alpha2+12.4572a9f
pkgrel=1
pkgdesc='Example Toolkit for AccurateRip checksums and ids'
arch=('x86_64')
url="https://codeberg.org/tristero/${pkgname%-git}"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('gcc-libs' 'libarcstk' 'libarcsdec')
makedepends=('git>=2.0' 'cmake>=3.9.6')
optdepends=('doxygen>=1.8.14: build documentation' )
source=("${pkgname%-git}::git+https://codeberg.org/tristero/${pkgname%-git}.git#branch=main")
md5sums=('SKIP')


pkgver()
{
	cd "${srcdir}/${pkgname%-git}"
	git describe --long HEAD | \
		sed 's/-\(alpha\|beta\|rc\)\.\([0-9]\+\)-/\1\2+/' | \
		sed 's/g\([a-z0-9]\+\)$/\1/' | \
		sed 's/-/./g'
}


## No prepare() function


build()
{
    msg "Configure"

	cmake -DCMAKE_BUILD_TYPE=Release    \
		  -DCMAKE_INSTALL_PREFIX="/usr" \
		  "${srcdir}/${pkgname%-git}/"

    msg "Build"

    cmake --build .
}


## No check() function


package()
{
	msg "Install library and files"

    make DESTDIR="${pkgdir}/" install


	msg "Install license"

	install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

