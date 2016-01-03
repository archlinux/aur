# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=oclhashcat-git
_VER=
#pkgname=oclhashcat
#_VER=-2.01
pkgver=r148.5f7c47b
pkgrel=1
pkgdesc='GPGPU-based password recovery utility'
arch=( 'i686' 'x86_64' 'arm' )
url='https://hashcat.net'
license=('MIT')
depends=(
    'libcl'
    )
makedepends=(
    'opencl-headers'
    'amd-adl-sdk'
    'nvidia-cuda-gdk' # 'nvidia-gdk'
    )
optdepends=(
    'opencl-nvidia: OpenCL implemention for NVIDIA'
    'opencl-catalyst: AMD/ATI drivers. OpenCL implemention for AMD Catalyst'
    'opencl-mesa: OpenCL support for AMD/ATI Radeon mesa drivers'
    )
conflicts=('oclhashcat')
provides=('oclhashcat')

source=(
    "${pkgname}::git+https://github.com/hashcat/oclHashcat.git"
    #"${pkgname}${_VER}.tar.gz::https://github.com/hashcat/oclHashcat/archive/v${pkgver}.tar.gz"
    )
md5sums=('SKIP')
sha1sums=('SKIP')

pkgver_git() {
    cd "${srcdir}/${pkgname}${_VER}"
    #local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

pkgver() {
    pkgver_git
}

prepare() {
    #mv ${srcdir}/oclHashcat-* "${srcdir}/${pkgname}${_VER}"
    sed -e 's|^typedef int bool;|//typedef int bool;|' -i ${srcdir}/${pkgname}${_VER}/include/shared.h
}

build()
{
    cd "${srcdir}/${pkgname}${_VER}"
    if [[ "$CARCH" = "x86_64" ]]; then
        make CFLAGS="-I/usr/include/ADL -I/usr/include/nvidia/gdk/ -Iinclude" oclHashcat64.bin
    else
        make CFLAGS="-I/usr/include/ADL -I/usr/include/nvidia/gdk/ -Iinclude" oclHashcat32.bin
    fi
}

package()
{
    cd "${srcdir}/${pkgname}${_VER}"

    install -d "${pkgdir}/usr/share/oclHashcat/charsets"
    install -d "${pkgdir}/usr/share/oclHashcat/kernels"
    install -d "${pkgdir}/usr/share/oclHashcat/masks"
    install -d "${pkgdir}/usr/share/oclHashcat/rules"
    install -d "${pkgdir}/usr/share/doc/oclHashcat/extra"

    cp -ar charsets/* "${pkgdir}/usr/share/oclHashcat/charsets/"
    cp -ar kernels/* "${pkgdir}/usr/share/oclHashcat/kernels/"
    cp -ar masks/* "${pkgdir}/usr/share/oclHashcat/masks/"
    cp -ar rules/* "${pkgdir}/usr/share/oclHashcat/rules/"
    cp -a hashcat.hcstat "${pkgdir}/usr/share/oclHashcat/"
    cp -ar docs/* "${pkgdir}/usr/share/doc/oclHashcat/"
    cp -ar extra/* "${pkgdir}/usr/share/doc/oclHashcat/extra/"
    if [[ "$CARCH" = "x86_64" ]]; then
        install -Dm755 oclHashcat64.bin "${pkgdir}/usr/bin/oclhashcat"
    else
        install -Dm755 oclHashcat32.bin "${pkgdir}/usr/bin/oclhashcat"
    fi
}
