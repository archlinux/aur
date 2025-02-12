# Maintainer: fardragon <michaldrozd@protonmail.ch>

pkgname=imgui-sfml
pkgver=3.0
pkgrel=1
pkgdesc="Library which allows you to use ImGui with SFML"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/eliasdaler/imgui-sfml/"
license=("MIT")
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/eliasdaler/${pkgname}/archive/v${pkgver}.tar.gz"
    "use_system_imgui.patch"
)
sha512sums=('be02207533b532f10038bb83eb49311e57774dbddd1bac2ebb1789cbdef2abbfa24cee59b8b5889302feba72af1e98a4a1c7ac063e7d815ce1f2ef9bd40cf552'
'b3d2eb8e309eb7c7460642f96f8b304259c2c64384c91f2c07d72b4ec2e5c943f076732d0cbebab1e8055c98481fd645ebad0466ae5b788299d89cee597511ac')

depends=(
    "sfml>=3.0.0"
    "imgui>=1.91.1"
)
makedepends=(
    "cmake"
    )

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit
    patch --strip=1 --binary --input="${srcdir}/use_system_imgui.patch"
}

build() {
    cd "${srcdir}"/${pkgname}-${pkgver} || exit
    cmake -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=." -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DBUILD_SHARED_LIBS=ON .
    cmake --build .
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver} || exit
    cmake --build . --target install
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}-LICENSE"
}
