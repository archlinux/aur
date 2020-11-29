# Maintainer: Saleem Rashid <dev@saleemrashid.com>
_pkgname=jd-gui
pkgname="${_pkgname}-git"
gitname="${_pkgname}"
pkgrel=1
pkgver=1.6.6.r0.gb3c1ced
pkgdesc='A standalone Java Decompiler GUI'
arch=('i686' 'x86_64')
url='https://github.com/java-decompiler/jd-gui'
license=('LGPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'gradle')
depends=('java-runtime')
source=(
    "git+https://github.com/java-decompiler/${gitname}.git"
    "${_pkgname}.patch"
    "${_pkgname}.sh"
)
sha256sums=(
    'SKIP'
    '7c437ec34546d4a62c77da5587718f681d5998f6d03f44d547148e1715a0f154'
    '1f37782756847ed41044a6503799bd52fd9b325e1c52906dec99f13499976adf'
)

prepare() {
    cd "${srcdir}/${gitname}"
    git apply "${srcdir}/${_pkgname}.patch"
}

pkgver() {
    cd "${srcdir}/${gitname}"
    git describe --tags --long | sed \
        -e 's/^v//' \
        -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${gitname}"
    gradle jar
}

package() {
    cd "${srcdir}/${gitname}"

    install -Dm0644 NOTICE  "${pkgdir}/usr/share/licenses/${_pkgname}/NOTICE"
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    install -Dm0644 "build/libs/jd-gui-$(git describe --tags --abbrev=0 | sed 's/^v//').jar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.jar"

    install -Dm0644 src/linux/resources/jd-gui.desktop  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm0644 src/linux/resources/jd_icon_128.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    install -Dm0755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
