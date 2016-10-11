# Maintainer: Artem Grunichev <gluk@umbrosia.ru>

pkgname=cura-engine-noarcus-git
pkgver=3b8ad5e
pkgrel=5
pkgdesc="A C++ console application for 3D printing GCode generation. No libArcus or Protobuf needed for that version, and it could be only used as command-line tool."
arch=(i686 x86_64 arm)
url="https://github.com/Ultimaker/CuraEngine.git"
license=(GPL)
depends=(rapidjson-git polyclipping)
makedepends=(gcc cmake)
source=(
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
    # add version // doesn't work with actual version
    #sed -i -e "s|add_definitions[ \t]*([ \t]*-DVERSION=.*||" CMakeLists.txt
    #echo "add_definitions( -DVERSION=\"git-$(pkgver)\" )" >> CMakeLists.txt
    # patch default folder // cancelled, doesn't work with actual version
    #sed -i -e "s|loadJSON[ \t]*([ \t]*\"fdmprinter.json|loadJSON(\"/usr/share/${pkgname}/fdmprinter.json|" src/main.cpp

    mkdir -p build
    cd build
    cmake -DENABLE_ARCUS=FALSE -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_TESTS=FALSE ..
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
    mkdir -p "${pkgdir}"/usr/bin/
    cp build/CuraEngine "${pkgdir}"/usr/bin/
    mkdir -p ${pkgdir}/usr/share/${pkgname}/
    cp -r resources "${pkgdir}"/usr/share/"${pkgname}"/
    cp -r "${srcdir}"/cura-git/resources/* "${pkgdir}"/usr/share/${pkgname}/resources
}

package4release() {
    cd "${srcdir}/CuraEngine-${pkgver}"
    mkdir -p ${pkgdir}/usr/bin/
    cp build/CuraEngine ${pkgdir}/usr/bin/
}

package() {
    package4git
}
