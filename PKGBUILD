# Maintainer: yifwon <wyf9661 at gmail dot com>
pkgbase=sylixos-cross-compiler-toolchain
pkgname=('sylixos-cross-compiler-toolchain' 'sylixos-cross-compiler-lcsproxy' 'sylixos-cross-compiler-senseshield' 'sylixos-cmake-plugins')
pkgver=0.7.0
_lcsproxy_ver=1.0.8
_senseshield_ver=2.7.0.66418
pkgrel=1
pkgdesc="cross compile toolchain to build objects running on sylixos"
arch=('x86_64')
url="http://10.7.0.200:9000/RealEvo-IDE"
license=('custom')
depends=('systemd')
options=(!strip)
source=("realevo-linux-tools.tar.gz"::$url/realevo-linux-tools-v$pkgver.tar.gz
        "sw_64-sylixos-toolchain_pub.tar.gz"::$url/sw_64-sylixos-toolchain_pub.tar.gz)
sha1sums=('3ab237d6b34f98d0c92af05e9616f0f615caa33f'
          'e96a0056d869cec7e6094563158bec2635f47ad8')

package_sylixos-cross-compiler-toolchain() {
    _install_dir="opt/sylixos"

    install -dm755 "${pkgdir}/${_install_dir}"
    cp -r "${srcdir}/realevo-linux-tools/compiler" "${pkgdir}/${_install_dir}"
    cp -r "${srcdir}/sw_64-sylixos-toolchain" "${pkgdir}/${_install_dir}/compiler"

    #symlinking
    install -dm755 "${pkgdir}/usr/bin"
    for platform in ${pkgdir}/${_install_dir}/compiler/*-toolchain; do
        for component in $platform/bin/*; do
            ln -sf ${component##$pkgdir} ${pkgdir}/usr/bin/
        done
    done
}

package_sylixos-cross-compiler-lcsproxy() {
    backup=("etc/lcsproxy/lcsproxy.conf")

    ar x ${srcdir}/realevo-linux-tools/pkg/lcsproxy-${_lcsproxy_ver}-linux-amd64.deb
    tar --no-same-owner --no-same-permissions -xavf data.tar.gz -C ${pkgdir}
    mv ${pkgdir}/bin ${pkgdir}/usr
}

package_sylixos-cross-compiler-senseshield() {
    ar x ${srcdir}/realevo-linux-tools/pkg/senseshield-lcc-${_senseshield_ver}-amd64.deb
    tar --no-same-owner --no-same-permissions -xavf data.tar.xz -C ${pkgdir}
}

package_sylixos-cmake-plugins() {
    replace=("cmake-sylixos-plugins")
    conflicts=("cmake-sylixos-plugins")
    provides=("cmake-sylixos-plugins")

    for plugin in SylixOS.cmake SylixOS-GNU.cmake SylixOS-GNU-C.cmake SylixOS-GNU-CXX.cmake SylixOS-GNU-Fortran.cmake;do
        install -Dm644 "${srcdir}/realevo-linux-tools/config/cmake-sylixos/${plugin}" "${pkgdir}/usr/share/cmake/Modules/Platform/${plugin}"
    done
}
