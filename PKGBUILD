# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-beta
_pkgname=maptool
_PkgName=MapTool
pkgver=1.6.0
_pkgver=${pkgver}-beta-2
pkgrel=2
pkgdesc="An open source virtual tabletop program, 1.6 beta release"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
makedepends=('git' 'dpkg' 'jdk10')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=(
    "git+https://github.com/RPTools/maptool.git#tag=${_pkgver}"
    "MapTool.desktop"
)
sha256sums=(
    'SKIP'
    '40750180a13b2da257d9a1344879d96ab0b7e0f366a20669597ef917bf76220e'
)

prepare() {
    sed -i 's/commandLine "javapackager"/commandLine "\/usr\/lib\/jvm\/default-runtime\/bin\/javapackager"/' "${_pkgname}/build.gradle"
    sed -i 's/"-native", "installer"/"-native", "image"/' "${_pkgname}/build.gradle"
}

build() {
    ORIG_JAVA="$(archlinux-java get)"
    sudo archlinux-java set java-10-jdk

    cd "${_pkgname}"
    ./gradlew deploy

    if [ -n "$ORIG_JAVA" ]; then
        sudo archlinux-java set $ORIG_JAVA
    else
        sudo archlinux-java unset
    fi
}

package() {
    cd "${srcdir}/${_pkgname}/releases/release-${_pkgver}"
    mkdir "${pkgdir}/opt"
    cp -rp "${_PkgName}" -t "${pkgdir}/opt/" 
    install -Dm644 "${_PkgName}/app/COPYING.AFFERO" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${_PkgName}/app/COPYING.LESSER" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${srcdir}/${_pkgname}/package/linux/MapTool.png" -t "${pkgdir}/opt/MapTool"
    install -Dm644 "${srcdir}/${_PkgName}.desktop" -t "${pkgdir}/usr/share/applications/"
}
