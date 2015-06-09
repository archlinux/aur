# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=cura-engine-git
pkgver=3b8ad5e
pkgrel=1
pkgdesc="A C++ console application for 3D printing GCode generation. It's called by Repetier Host and/or other applications."
arch=(i686 x86_64 arm)
url="https://github.com/Ultimaker/CuraEngine.git"
license=(GPL)
depends=(protobuf3-git libarcus rapidjson polyclipping)
makedepends=(gcc cmake)
source=(
    #"${pkgname}-${pkgver}.tar.gz::https://github.com/Ultimaker/CuraEngine/archive/${pkgver}.tar.gz"
    "${pkgname}::git+https://github.com/Ultimaker/CuraEngine.git"
    "cura-git::git+https://github.com/Ultimaker/Cura.git"
    )
sha1sums=(
    'SKIP'
    'SKIP'
    )
conflicts=(curaengine curaengine-git cura-engine)

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_git
}

build4git() {
    cd "${srcdir}/${pkgname}"
    # add version
    sed -i -e "s|add_definitions[ \t]*([ \t]*-DVERSION=.*||" CMakeLists.txt
    echo "add_definitions( -DVERSION=\"git-$(pkgver)\" )" >> CMakeLists.txt
    # patch default folder
    sed -i -e "s|loadJSON[ \t]*([ \t]*\"fdmprinter.json|loadJSON(\"/usr/share/${pkgname}/fdmprinter.json|" src/main.cpp

    mkdir -p build
    cd build
    cmake ..
    make VERSION="\"git-$pkgver\""
}

build4release() {
    cd "${srcdir}/CuraEngine-${pkgver}"
    make VERSION="\"$pkgver\""
}

build () {
    build4git
}

package4git() {
    cd "${srcdir}/${pkgname}"
    mkdir -p ${pkgdir}/usr/bin/
    cp build/CuraEngine ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/${pkgname}/
    cp "${srcdir}/cura-git/resources/settings/fdmprinter.json" ${pkgdir}/usr/share/${pkgname}/
}

package4release() {
    cd "${srcdir}/CuraEngine-${pkgver}"
    mkdir -p ${pkgdir}/usr/bin/
    cp build/CuraEngine ${pkgdir}/usr/bin/
}

package() {
    package4git
}
