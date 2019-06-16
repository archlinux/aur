# Contributor: tristero

pkgname=arcs-tools-git
pkgver=r2.cb1f8b4
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
source=("${pkgname%-git}::git+ssh://git@codeberg.org/tristero/${pkgname%-git}.git#branch=master")
md5sums=('SKIP')


pkgver()
{
	cd "${srcdir}/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


## No prepare() function


build()
{
    msg "Configure"

	cmake -DCMAKE_BUILD_TYPE=Release    \
		  -DWITH_TESTS=ON               \
		  -DCMAKE_INSTALL_PREFIX="/usr" \
		  "${srcdir}/${pkgname%-git}/"

    msg "Build"

    cmake --build .
}


check()
{
    msg "Perform tests"

	ctest
}


package()
{
	msg "Install library and files"

    make DESTDIR="${pkgdir}/" install


	msg "Install license"

	install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

