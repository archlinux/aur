# Maintainer: yifwon <wyf9661 at gmail dot com>
pkgbase=sylixos-cross-compiler-toolchain
pkgname=('sylixos-cross-compiler-toolchain' 'sylixos-cross-compiler-lcsproxy' 'sylixos-cross-compiler-senseshield')
pkgver=0.5.0
_lcsproxy_ver=1.0.7
_senseshield_ver=2.7.0.66418
pkgrel=2
pkgdesc="cross compile toolchain to build objects running on sylixos"
arch=('x86_64')
url="http://10.7.0.200:9000/RealEvo-IDE"
license=('custom')
depends=('systemd')
options=(!strip)
source=("realevo-linux-tools.tar.gz"::$url/realevo-linux-tools-v$pkgver.tar.gz
        "sw_64-sylixos-toolchain_pub.tar.gz"::$url/sw_64-sylixos-toolchain_pub.tar.gz)
sha1sums=('0dc556d03d113488971fdbc7582935564ba7d36c'
          '97a196963f010f2a9da361426ad89172a03a784f')

package_sylixos-cross-compiler-toolchain() {
    _install_dir="opt/sylixos"
    #extracting
    install -dm755 "${pkgdir}/${_install_dir}"
    tar --no-same-owner --no-same-permissions -xaf ${srcdir}/realevo-linux-tools/compiler_pub.tar.gz -C "${pkgdir}/${_install_dir}"
    
    tar --no-same-owner --no-same-permissions -xaf ${srcdir}/sw_64-sylixos-toolchain_pub.tar.gz -C "${pkgdir}/${_install_dir}/compiler"

    #add readable attributes
    chmod -R a+r "${pkgdir}/${_install_dir}"

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
    ar x ${srcdir}/realevo-linux-tools/lcsproxy-${_lcsproxy_ver}-linux-amd64.deb
    tar --no-same-owner --no-same-permissions -xavf data.tar.gz -C ${pkgdir}
    mv ${pkgdir}/bin ${pkgdir}/usr
}

package_sylixos-cross-compiler-senseshield() {
    ar x ${srcdir}/realevo-linux-tools/senseshield-lcc-${_senseshield_ver}-amd64.deb
    tar --no-same-owner --no-same-permissions -xavf data.tar.xz -C ${pkgdir}
}
