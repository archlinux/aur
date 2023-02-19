# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=sassafras-git
_pkgname=sassafras
pkgver=r233.3aacfa2
pkgrel=1
epoch=
pkgdesc="Data analysis tool"
arch=('any')
url="https://github.com/georgeweigt/sassafras"
license=('BSD')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/georgeweigt/sassafras.git"
        "https://georgeweigt.github.io/sassafras/anova.pdf")
noextract=()
sha256sums=('SKIP'
            '5ce13f8454de66fd4e93cd58d2b9009870f89023922c35cd374beb03dba0dc59')
validpgpkeys=()

pkgver(){
        cd "${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${_pkgname}"
	make
}

check() {
        cd "${_pkgname}"
        pushd "src"
        make checkall
        make
        popd
	pushd "test"
	make
	./selftest
	popd
}

package() {
	pushd "${_pkgname}"
	install -Dm755 sassafras -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
	for f in doc/*;
	do
	    install -Dm644 "${f}" -t "${pkgdir}/usr/share/doc/${_pkgname}/"
	done
	popd
	install -Dm644 anova.pdf -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
