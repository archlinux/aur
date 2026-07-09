# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=KILLinefficiency
_gitname=Kal
_appname=${_gitname,,}
pkgname=${_appname}-lang
pkgdesc="Kal is an interpreted programming language."

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")

makedepends=('gcc')
depends=('glibc' 'libgcc' 'libstdc++')

options=('!strip' '!staticlibs')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('650a4037a98baafbe8553a208aace16a6ece62b174e5ed12346da37d2a38f0ca')


prepare() {
	cd "${_gitname}-${pkgver}/" || exit

	sed -e "s#/usr/local/#${pkgdir}/usr/#g" -i ./build.sh

	sed -e '/^\([[:space:]]*\)embed$/ { s/^\([[:space:]]*\)embed$/\1# embed/; :a; n; ba; }' -i ./build.sh
	sed -e '/^\([[:space:]]*\)compile$/ { s/^\([[:space:]]*\)compile$/\1# compile/; :a; n; ba; }' -i ./build.sh
}

build() {
	cd "${_gitname}-${pkgver}/" || exit

	./build.sh compile
	./build.sh embed
}

# check() {
# 	cd "${_gitname}-${pkgver}/" || exit
#
# 	./build.sh test
# }

package() {
	cd "${_gitname}-${pkgver}/" || exit

	BIN_FILE="bin/${_appname}-$(echo $(uname) | tr A-Z a-z)-$(uname -m)"
	O_FILE="bin/lib${_appname}.o"
	AR_FILE="bin/lib${_appname}.a"
	SO_FILE="bin/lib${_appname}.so"
	HEADER_FILE="bin/${_appname}.hpp"

	install -Dm755 "${BIN_FILE}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm755 "${SO_FILE}" -t "${pkgdir}/usr/lib/"
	install -Dm644 "${AR_FILE}" -t "${pkgdir}/usr/lib/"
	install -Dm644 "${O_FILE}" -t "${pkgdir}/usr/lib/"

	for version in /usr/include/c++/*; do
		if [ -d ${version} ]; then
			install -Dm644 "${HEADER_FILE}" -t "${pkgdir}/${version}/${_appname}/"
		fi
	done

	install -Dm755 "examples/"*kal -t "${pkgdir}/usr/share/${pkgname}/examples/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
