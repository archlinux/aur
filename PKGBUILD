# Maintainer: tristero <crf8472@mailbox.org>

pkgname=libarcstk-git
pkgver=0.2.0alpha1+1.77a4d0a
pkgrel=1
pkgdesc='Toolkit to calculate and verify AccurateRip checksums and ids'
arch=('x86_64')
url="https://codeberg.org/tristero/${pkgname%-git}"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('gcc-libs')
makedepends=('git' 'cmake')
optdepends=('doxygen>=1.8.14: build documentation'
            'python-virtualenv: build HTML documentation with m.css')
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
    printf "CMake Configure\n"

	cmake -DCMAKE_BUILD_TYPE=Release    \
		  -DCMAKE_INSTALL_PREFIX="/usr" \
		  "${srcdir}/${pkgname%-git}/"

    printf "CMake Build\n"

    cmake --build .
}


## No check() function


package()
{
	printf "Install library and files\n"

    make DESTDIR="${pkgdir}/" install

	printf "Install license\n"

	install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

