# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Cody Schafer <aur at codyps com>
# Contributor: Chris <alostengineer at narmos org>
# Contributor: Olivier EBLE <olivier.eble at gmail com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Justin Gottula <justin at jgottula com>
# Contributor: RJ <private>
# Contributor: AscendLiu <ascendliu@qq.com>
pkgname=libftd2xx
pkgver=1.4.33
pkgrel=2
pkgdesc="Library that allows a direct access to a USB FTDI2XX chip based device"
arch=('x86_64')
url="http://www.ftdichip.com/"
license=('Proprietary')
depends=('glibc')
options=(staticlibs)
source=(55-ft2232.rules
        ftd2xx-config.cmake.in)
sha256sums=('f48e0c36821bebfcf791da0831ce7e10965c5a537e222e54f92cb0b2d4497cda'
        'SKIP')
sha256sums_x86_64=('e260a4594a313583b87bf230c79cec9d46f11db6dcfd7c7d4f963279703214d3')
source_x86_64=("https://ftdichip.com/wp-content/uploads/2025/03/libftd2xx-linux-x86_64-1.4.33.tgz")

prepare() {
    # Generate the final CMake configuration file
    sed -e "s|@PROJECT_VERSION@|${pkgver}|g" \
        -e "s|@PACKAGE_LIBRARY_FILE@|/usr/lib/${pkgname}.so|g" \
        -e "s|@PACKAGE_LIBRARY_STATIC_FILE@|/usr/lib/${pkgname}.a|g" \
        -e "s|@PACKAGE_INCLUDE_DIR@|/usr/include|g" \
        ftd2xx-config.cmake.in > ftd2xx-config.cmake
}


package() {
        # Make required dirs
        mkdir -p ${pkgdir}/usr/{lib,include,lib/cmake/ftd2xx}

        # Install versioned so file as well as static library
        install -Dm755 ${srcdir}/linux-x86_64/${pkgname}.so ${pkgdir}/usr/lib/${pkgname}.so
        install -Dm644 ${srcdir}/linux-x86_64/${pkgname}-static.a ${pkgdir}/usr/lib/${pkgname}.a

        # Link versioned so file to generic
        ln -sf /usr/lib/${pkgname}.so "${pkgdir}"/usr/lib/${pkgname}.so.${pkgver}


        # Install Headers
        install -m644 "${srcdir}"/linux-x86_64/{ftd2xx,WinTypes}.h "${pkgdir}"/usr/include/

        # Install udev rules
        install -D -m644 "${srcdir}"/55-ft2232.rules "${pkgdir}"/etc/udev/rules.d/55-ft2232.rules

        # Install CMake config files
        install -Dm644 "${srcdir}"/ftd2xx-config.cmake "${pkgdir}"/usr/lib/cmake/ftd2xx/ftd2xx-config.cmake
}
