# Maintainer: Ascend Liu<ascendliu@qq.com>

pkgname=libft4222
pkgver=1.4.4.221
pkgrel=2
pkgdesc="Library for FT4222HQ – USB 2.0 to Quad SPI / I2C Bridge IC"
arch=('x86_64')
url="https://ftdichip.com/products/ft4222h/"
license=('custom')
source=("https://ftdichip.com/wp-content/uploads/2025/02/libft4222-linux-1.4.4.221.zip"
    "ft4222-config.cmake.in"
    "ft4222.rules")
sha256sums=('SKIP'
    'SKIP'
    'SKIP')
options=(staticlibs)
makedepends=('unzip' 'tar')

prepare() {
    unzip "${pkgname}-linux-${pkgver}.zip"

    mkdir "${pkgname}-linux-${pkgver}"

    tar -xzf "${pkgname}-linux-${pkgver}.tgz" -C "${pkgname}-linux-${pkgver}"

    sed -e "s|@PROJECT_VERSION@|${pkgver}|g" \
        -e "s|@PACKAGE_LIBRARY_FILE@|/usr/lib/libft4222.so|g" \
        -e "s|@PACKAGE_LIBRARY_STATIC_FILE@|/usr/lib/libft4222.a|g" \
        -e "s|@PACKAGE_INCLUDE_DIR@|/usr/include|g" \
        ft4222-config.cmake.in > ft4222-config.cmake
}

package() {

    mkdir -p ${pkgdir}/usr/{lib,include,lib/cmake/ft4222}

    # install shared library
    install -Dm755 ${srcdir}/${pkgname}-linux-${pkgver}/build-x86_64/${pkgname}.so.${pkgver} ${pkgdir}/usr/lib/${pkgname}.so.${pkgver}
    install -Dm644 ${srcdir}/${pkgname}-linux-${pkgver}/build-x86_64/${pkgname}.a ${pkgdir}/usr/lib/${pkgname}.a


    ln -sf "/usr/lib/${pkgname}.so.${pkgver}" "${pkgdir}/usr/lib/${pkgname}.so"

    # install headers
    install -Dm644 ${srcdir}/${pkgname}-linux-${pkgver}/libft4222.h "${pkgdir}/usr/include/libft4222.h"

    #文件如果已存在则跳过
    # install -CDm644 ftd2xx.h "${pkgdir}/usr/local/include/ftd2xx.h"
    # install -CDm644 WinTypes.h "${pkgdir}/usr/local/include/WinTypes.h"

    # Install udev rules
    install -D -m644 "${srcdir}"/ft4222.rules "${pkgdir}"/etc/udev/rules.d/ft4222.rules

    # 安装CMake配置文件
    install -Dm644 "${srcdir}"/ft4222-config.cmake "${pkgdir}/usr/lib/cmake/ft4222/ft4222-config.cmake"

}
