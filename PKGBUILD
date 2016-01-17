# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=oclhashcat-git
_VER=
#pkgname=oclhashcat
#_VER=-2.01
pkgver=r271.45431d9
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
    "oclhashcat-error-message.patch"
    "oclhashcat-session.patch"
    )
md5sums=(
    'SKIP'
    '067f04860d4523402955f86adfb2cce6' # oclhashcat-error-message.patch
    '3756762afe8c1e2da0ee41eee47af3ff' # oclhashcat-session.patch
    )

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

    cd "${srcdir}/${pkgname}${_VER}"
    patch -Np1 -i "${srcdir}/oclhashcat-error-message.patch"
    patch -Np1 -i "${srcdir}/oclhashcat-session.patch"
    #patch -Np1 -i "${srcdir}/oclhashcat-all.patch"

    #sed -e 's|^typedef int bool;|//typedef int bool;|' -i ${srcdir}/${pkgname}${_VER}/include/shared.h
    sed -e 's|session_dir = arg_session_dir;|session_dir = arg_session_dir;shared_dir="/usr/share/oclHashcat/";|' -i ${srcdir}/${pkgname}${_VER}/src/oclHashcat.c
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
    install -d "${pkgdir}/usr/share/oclHashcat/"

    cp -ar charsets OpenCL include masks rules hashcat.hcstat docs extra \
        "${pkgdir}/usr/share/oclHashcat/"
    if [[ "$CARCH" = "x86_64" ]]; then
        install -Dm755 oclHashcat64.bin "${pkgdir}/usr/bin/oclhashcat"
    else
        install -Dm755 oclHashcat32.bin "${pkgdir}/usr/bin/oclhashcat"
    fi
}
