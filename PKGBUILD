# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>
pkgname=tee-supplicant
pkgver=3.19.0
pkgrel=3
pkgdesc='Normal world client side of the TEE'
arch=('x86_64' 'aarch64')
url='https://github.com/OP-TEE/optee_client'
license=('BSD')
depends=('glibc' 'util-linux-libs')
makedepends=('cmake' 'ninja')
source=("git+https://github.com/OP-TEE/optee_client.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cmake -B build -S optee_client -G Ninja \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCFG_TEE_CLIENT_LOG_FILE='/var/log/tee/teec.log' \
        -DBUILD_SHARED_LIBS=ON
    cmake --build build
}

package() {
    DESTDIR=${pkgdir} cmake --install build

    # mv tee-supplicant into /usr/bin
    install -dm755 ${pkgdir}/usr/bin
    mv ${pkgdir}/usr/sbin/tee-supplicant ${pkgdir}/usr/bin
    rm -rf ${pkgdir}/usr/sbin

    # install license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 optee_client/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
