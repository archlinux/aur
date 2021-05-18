# Maintainer: CrunchySnake

_gitname=lua-pam
pkgname=lua-pam-git
pkgver=r12.4820711
pkgrel=2
pkgdesc="A module for lua to use PAM"
arch=(x86_64)
url="https://github.com/RMTT/${_gitname}"
license=('MIT')
depends=(pam lua53)
makedepends=(cmake)
provides=(lua-pam)
install=lua-pam-git.install
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_gitname}
    sed -i 's/target_link_libraries(lua_pam lua pam)/target_link_libraries(lua_pam lua5.3 pam)/' CMakeLists.txt
    sed -i 's/lua.hpp/lua5.3\/lua.hpp/' src/main.cpp
    cmake . -B build
    make -C build
}

package() {
    cd ${_gitname}
    install -Dm 755 build/liblua_pam.so -t "${pkgdir}/usr/lib/${_gitname}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
