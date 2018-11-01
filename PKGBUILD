# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

pkgname=vpp
pkgver=18.10
pkgrel=1
pkgdesc="FD.io Vector Packet Processing"
arch=('x86_64')
url="https://fd.io/"
license=('Apache')
depends=('glibc' 'gcc-libs' 'openssl' 'mbedtls' 'numactl' 'python2' 'python2-ply')
makedepends=('ninja' 'patchelf')
provides=("${pkgname}" 'dpdk')
source=("git+https://gerrit.fd.io/r/vpp#tag=v${pkgver}"
	"nasmlib.patch"
        "vpp.sysusers")
sha256sums=('SKIP'
            '38f4daaaba5b2e9b3f624f08b963725e004d8d3b27385f596f45f135f88748e7'
            '5e8a0d05f715816689479c9050bf0505c7a64252d53d16c5d5df5f4787e4295b')

prepare() {

    # (1) Change Python Scripts to Use Python2
    find ${srcdir} -type f -iname \*.py -exec \
        sed -i 's|#!/usr/bin/env python$|#!/usr/bin/env python2|g' {} +

    # (2) Run Initial Build (which will fail)
    #         This forces DPDK to download dependencies
    #         A quick pass did not reveal a clean make target for this.
    cd ${srcdir}/${pkgname}
    make build-release || \
        echo "Failure Caught, Patching" && \
	patch -Np0 -i ${srcdir}/nasmlib.patch
    
}

build() {
    # (1) Build Release
    make build-release
}

package() {
    # (1) Find the Actual Install Root
    #        Currently DESTDIR installs the ABSOLUTE path.
    root=$(dirname $(dirname $(find ${srcdir}/vpp/build-root/install-vpp-native -iname vpp -type f -executable)))
    cd $root

    # (2) Install VPP
    #
    mkdir ${pkgdir}/usr
    cp -pr bin ${pkgdir}/usr/bin
    cp -pr include ${pkgdir}/usr/include
    cp -pr lib ${pkgdir}/usr/lib
    cp -pr share ${pkgdir}/usr/share

    # (3) Fix RPATH
    #
    cd ${pkgdir}/usr

    for file in $(find . -type f -executable); do
	if file $file | grep -qi elf; then
	    patchelf --shrink-rpath $file
        fi
    done

    # (4) Install Auxillary Files
    #
    mkdir -p ${pkgdir}/usr/lib/systemd/system
    cp -pr ${srcdir}/${pkgname}/build-root/deb/debian/vpp.service ${pkgdir}/usr/lib/systemd/system

    mkdir -p ${pkgdir}/etc/vpp
    cp -pr ${srcdir}/${pkgname}/src/vpp/conf/startup.conf ${pkgdir}/etc/vpp

    install -Dm644 "${srcdir}/${pkgname}.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}


