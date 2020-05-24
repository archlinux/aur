_pkgname="raylib-cpp"
pkgname=${_pkgname}-git
pkgver=r93.699b1fc
pkgrel=1
pkgdesc="raylib-cpp is a C++ wrapper library for raylib, a simple and easy-to-use library to enjoy videogames programming"
arch=('x86_64')
url="https://github.com/RobLoach/raylib-cpp"
license=('MIT')
makedepends=('rsync')
depends=('raylib')
provides=("${_pkgname}")
conflicts=()
epoch=1
source=("${_pkgname}::git+https://github.com/RobLoach/raylib-cpp.git"
	"raylib-cpp.pc")

sha256sums=('SKIP'
	'e2c56b686069bc0303e950818dfb7a09ca9c829d28a695ce4e80bb44cb67d508')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	tagVer="$(git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"

	if [ tagVer="" ]; then
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	else
		printf "%s\n" "${tagVer}"
	fi
}

prepare() {
	cd "${srcdir}/${_pkgname}"
}

build() {
	cd "${srcdir}"
	sed -ie "s/\${version}/$(pkgver)/g" raylib-cpp.pc
}

check() {
	cd "${srcdir}/${_pkgname}"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m755 -d "${pkgdir}/usr/include/raylib"
	rsync -rK --chmod 644 "${srcdir}/${_pkgname}/include/" "${pkgdir}/usr/include/"
	install -m644 -D "${srcdir}/raylib-cpp.pc" "${pkgdir}/usr/lib/pkgconfig/raylib-cpp.pc"
	install -m644 -D "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
