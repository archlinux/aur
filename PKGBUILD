# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# This package provides only the SDK files for Intel Media Server Studio.
# The proper installation requires a specific (older) Linux kernel version,
# kernel patches and other system modifications. For the sake of the system,
# this package will not touch the kernel or system libraries. Only the SDK
# files will be provided.

_year=2018
_release=R2
_sdkver=16.9
_build=00183
_oclbuild=00158
_vcp=14959

pkgname=intel-media-server-studio
pkgver="${_year}.${_release}"
pkgrel=1
pkgdesc='Intel Media Server Studio (only SDK files, no kernel patches, no system modifications)'
arch=('x86_64')
url='https://software.intel.com/en-us/intel-media-server-studio/'
license=('custom')
depends=(
    # official repositories:
        'ocl-icd' 'linux-firmware' 'libxext' 'gcc-libs' 'zlib' 'libglvnd'
        'libdrm' 'libva' 'libpciaccess' 'libxfixes'
    # AUR:
        'ncurses5-compat-libs'
)
makedepends=('poppler')
provides=('intel-media-sdk' 'compute-runtime')
conflicts=('intel-media-sdk' 'compute-runtime' 'intel-graphics-compiler'
           'intel-opencl' 'intel-opencl-runtime')
options=('!strip')
_srcfile="MediaServerStudioEssentials${_year}_${_sdkver}_${_build}.tar.gz"
source=("http://registrationcenter-download.intel.com/akdlm/irc_nas/vcp/${_vcp}/${_srcfile}")
sha256sums=('9540918283798af47dce7a1300433c3c3850ab198a4a24789909fcacffe08a25')

_basedir="${_srcfile/%.tar.gz/}"
_sdkdir="${_basedir}/SDK${_year}Production${_sdkver}/generic"

prepare() {
    cd "$_basedir"
    bsdtar -xf "SDK${_year}Production${_sdkver}.tar.gz"
    
    cd "${srcdir}/${_sdkdir}"
    bsdtar -xf "intel-linux-media-generic-${_sdkver}-${_build}.tar.gz"
    bsdtar -xf "intel-opencl-$_sdkver-${_oclbuild}.tar.gz"
    
    # create a license file
    cd "${srcdir}/${_basedir}"
    pdftotext -layout 'Intel(R)_Media_Server_Studio_EULA.pdf'
}

package() {
    # directories creation
    mkdir -p "$pkgdir"/etc
    mkdir -p "$pkgdir"/opt/intel
    mkdir -p "$pkgdir"/usr/{include,lib}/"$pkgname"
    
    # media sdk
    cd "${_sdkdir}/intel-linux-media-generic-${_sdkver}-${_build}"
    cp -a opt/intel/common   "${pkgdir}/opt/intel"
    cp -a opt/intel/mediasdk "${pkgdir}/opt/intel"
    cp -a etc/ld.so.conf.d   "${pkgdir}/etc"
    cp -a usr/include/*      "${pkgdir}/usr/include/${pkgname}"
    cp -a usr/lib64/*        "${pkgdir}/usr/lib/${pkgname}"
    install -D -m644 etc/profile.d/*.sh -t "${pkgdir}/etc/profile.d"
    ln -s ../samples/_bin/x64/libcttmetrics.so "${pkgdir}/opt/intel/mediasdk/lib64/libcttmetrics.so"
    sed -i '2,3s/^/#/' "${pkgdir}/etc/profile.d/intel-mediasdk.sh"
    
    # opencl
    cd "${srcdir}/${_sdkdir}/intel-opencl-${_sdkver}-${_oclbuild}"
    cp -a usr/local/lib64/* "${pkgdir}/usr/lib"
    cp -a etc/ld.so.conf.d  "${pkgdir}/etc"
    cp -a etc/OpenCL        "${pkgdir}/etc"
    sed -i 's|local/||;s|64||' "${pkgdir}/etc/"{ld.so.conf.d/libintelopencl.conf,OpenCL/vendors/intel.icd}
    
    # add 'mfx' include folder for ffmpeg compatibility
    local _header
    mkdir -p "${pkgdir}/opt/intel/mediasdk/include/mfx"
    cd "${pkgdir}/opt/intel/mediasdk/include"
    for _header in *.h
    do
        cd mfx
        ln -s ../"$_header" "$_header"
        cd ..
    done
    
    # license
    cd "${srcdir}/${_basedir}"
    install -D -m644 'Intel(R)_Media_Server_Studio_EULA.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 'redist.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cd "${srcdir}/${_sdkdir}"
    install -D -m644 NOTICES.TXT "${pkgdir}/usr/share/licenses/${pkgname}/NOTICES"
    
    # create a pkg-config file for libmfx
    local _mfxver_major
    local _mfxver_minor
    local _mfxver
    _mfxver_major="$(grep '#define MFX_VERSION_MAJOR' "${pkgdir}/opt/intel/mediasdk/include/mfxdefs.h" | head -n1 | awk '{ print $3 }')"
    _mfxver_minor="$(grep '#define MFX_VERSION_MINOR' "${pkgdir}/opt/intel/mediasdk/include/mfxdefs.h" | head -n1 | awk '{ print $3 }')"
    _mfxver="${_mfxver_major}.${_mfxver_minor}"
    mkdir -p  "${pkgdir}/opt/intel/mediasdk/lib/pkgconfig"
    cat << __EOF__ >"${pkgdir}/opt/intel/mediasdk/lib/pkgconfig/libmfx.pc"
prefix=/opt/intel/mediasdk
exec_prefix=\${prefix}
libdir=\${prefix}/lib/lin_x64
includedir=\${prefix}/include

Name: libmfx
Description: Intel Media SDK dispatcher library
Version: ${_mfxver}
Libs: -L\${libdir} -lmfx -lva -lstdc++ -ldl -lva-drm -ldrm
Cflags: -I\${includedir} -I/usr/include/libdrm
__EOF__
    
    # fix pkg-config files for intel products
    local _file
    for _file in "${pkgdir}/usr/lib/intel-media-server-studio/pkgconfig/"{libva-drm,libva-glx,libva-x11,libva}.pc
    do
        sed -i "/libdir=/s|\(libdir=\).*|\1/usr/lib/${pkgname}|" "$_file"
        sed -i "/includedir=/s|\(includedir=\).*|\1\${prefix}/include/${pkgname}|" "$_file"
    done
    sed -i '/driverdir=/s/64//' "${pkgdir}/usr/lib/intel-media-server-studio/pkgconfig/libva.pc"
}
