# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname="pdfjumbler"
pkgname="${_pkgname}-git"
pkgver=r60.57c1b5a
pkgrel=1
pkgdesc="A simple tool to rearrange/merge/delete/rotate pages from PDF files."
arch=('any')
url="https://github.com/mgropp/pdfjumbler"
license=('GPL3')
_javaver=11
depends=("java-runtime>=${_javaver}")
makedepends=("git" "java-environment>=${_javaver}" 'gradle')
provides=("pdfjumbler")
conflicts=("pdfjumbler")
source=("git+${url}.git"
        "https://raw.githubusercontent.com/mgropp/pdfjumbler/master/LICENSE"
        "build-gradle.patch"
        "${_pkgname}.sh")
sha256sums=('SKIP'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '0b226633864b590285ab10420cf883c704c0803f86113f1e76e233e6f16bbb63'
            'fc703e692a41163f92247a45564519e1b27685ff7928bbdd9ebd4264f2698615')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 < "${srcdir}/build-gradle.patch"
}

build() {
    cd "${srcdir}/${_pkgname}"
    gradle -Dorg.gradle.daemon=false build
}

package() {
    cd "${srcdir}/${_pkgname}"

	install -Dm755 "build/libs/${_pkgname}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}"
}
