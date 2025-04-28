# Maintainer:
# Contributor: mrxx <mrxx at cyberhome dot at>

pkgname=securefs
pkgver=1.1.0
pkgrel=1
pkgdesc="A filesystem in userspace (FUSE) with transparent encryption and decryption"
arch=('x86_64')
url='https://github.com/netheril96/securefs'
license=('MIT')
depends=('abseil-cpp'
         'argon2'
         'crypto++'
         'fuse2'
         'gcc-libs'
         'glibc'
         'google-fruit'
         'protobuf'
         'sqlite'
         'uni-algo')
makedepends=('cmake' 'git' 'tclap')
source=("git+${url}.git?signed#tag=v${pkgver}")
sha256sums=('05f0bd851077b6736fd39584485761605c5170b54134b65bbc2d07fd2b734dd2')
validpgpkeys=('7640E42D45792AEA634188EAB10AE9952D2E33D9') # Siyuan Ren <netheril96@gmail.com>

build() {
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSECUREFS_ENABLE_INTEGRATION_TEST=OFF \
        -DSECUREFS_ENABLE_UNIT_TEST=OFF \
        -DSECUREFS_USE_VCPKG=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    cd "${pkgname}"
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
