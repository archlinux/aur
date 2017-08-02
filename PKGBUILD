#!/usr/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('rdma-core-git')
_srcname='rdma-core'
pkgdesc='RDMA core userspace libraries and daemons'
pkgver='r3501'
pkgrel='1'
arch=('x86_64')
url="https://github.com/linux-rdma/${_srcname}"
license=('GPL2' 'custom:OpenIB.org BSD (MIT variant)')

depends=('libnl')
makedepends=('git' 'cmake' 'gcc' 'libnl' 'libsystemd' 'systemd' 'pkg-config' 'ninja' 'bash')
_provides=("${pkgname[0]%-git}" 'rdma' 'ibacm' 'iwpmd' 'libibcm' 'libibumad' 'libibverbs'
           'librdmacm' 'libcxgb3' 'libcxgb4' 'libmlx4' 'libmlx5' 'libmthca' 'libnes' 'libocrdma'
           'srptools')
provides=("${_provides[@]}")
conflicts=("${_provides[@]}")
replaces=("${_provides[@]:1}")

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

prepare() {
    cd "${srcdir}/${_srcname}"

    find redhat -type f -exec sed --in-place \
        --expression='s|/usr/libexec|/usr/lib/rdma|g' \
        --expression='s|/usr/sbin|/usr/bin|g' \
        --expression='s|/sbin|/usr/bin|g' \
        '{}' '+'
}

build() {
    cd "${srcdir}/${_srcname}"

    mkdir build
    cd build
    cmake \
        -GNinja \
        -DENABLE_VALGRIND=0 \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_SBINDIR:PATH='/usr/bin' \
        -DCMAKE_INSTALL_LIBDIR:PATH='/usr/lib' \
        -DCMAKE_INSTALL_LIBEXECDIR:PATH='/usr/lib/rdma' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        ..
    ninja
}

package() {
    cd "${srcdir}/${_srcname}/build"
    export DESTDIR="${pkgdir}"
    ninja install

    rm --recursive "${pkgdir}/etc/init.d"

    cd "${srcdir}/${_srcname}/redhat"
    install -D --mode=0644 rdma.conf "${pkgdir}/etc/rdma/rdma.conf"
    install -D --mode=0644 rdma.sriov-vfs "${pkgdir}/etc/rdma/sriov-vfs"
    install -D --mode=0644 rdma.mlx4.conf "${pkgdir}/etc/rdma/mlx4.conf"
    install -D --mode=0644 rdma.service "${pkgdir}/usr/lib/systemd/system/rdma.service"
    install -D --mode=0644 rdma.udev-ipoib-naming.rules "${pkgdir}/etc/udev/rules.d/70-persistent-ipoib.rules"
    install -D --mode=0755 rdma.modules-setup.sh "${pkgdir}/usr/lib/dracut/modules.d/05rdma/module-setup.sh"
    install -D --mode=0644 rdma.udev-rules "${pkgdir}/usr/lib/udev/rules.d/98-rdma.rules"
    install -D --mode=0644 rdma.mlx4.sys.modprobe "${pkgdir}/usr/lib/modprobe.d/libmlx4.conf"
    install -D --mode=0644 rdma.cxgb3.sys.modprobe "${pkgdir}/usr/lib/modprobe.d/cxgb3.conf"
    install -D --mode=0644 rdma.cxgb4.sys.modprobe "${pkgdir}/usr/lib/modprobe.d/cxgb4.conf"
    install -D --mode=0755 rdma.kernel-init "${pkgdir}/usr/lib/rdma/rdma-init-kernel"
    install -D --mode=0755 rdma.sriov-init "${pkgdir}/usr/lib/rdma/rdma-set-sriov-vf"
    install -D --mode=0644 rdma.fixup-mtrr.awk "${pkgdir}/usr/lib/rdma/rdma-fixup-mtrr.awk"
    install -D --mode=0755 rdma.mlx4-setup.sh "${pkgdir}/usr/lib/rdma/mlx4-setup.sh"

    cd "${srcdir}/${_srcname}"
    install -D --mode=0644 COPYING.BSD_MIT "${pkgdir}/usr/share/licenses/${pkgname[0]%-git}/COPYING.BSD_MIT"
}
