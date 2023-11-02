# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-stack-bin
pkgver=23.3.4
pkgrel=1
epoch=1
pkgdesc='Tools and libraries for developing media solutions on Intel products (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/oneapi-src/oneVPL-intel-gpu/'
license=('MIT')
depends=('gcc-libs' 'libgl' 'libx11' 'libxcb' 'libxext' 'libxfixes')
optdepends=('ocl-icd: for rotate_opencl plugin'
            'intel-compute-runtime: for rotate_opencl plugin')
makedepends=('chrpath' 'lsb-release')
provides=('intel-media-sdk' 'libmfx' 'intel-gmmlib' 'intel-media-driver'
          'libva' 'libva-utils' 'onevpl' 'onevpl-intel-gpu')
options=('!strip' '!emptydirs')
install=intel-media-stack-bin.install
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/oneapi-src/oneVPL-intel-gpu/releases/download/intel-onevpl-${pkgver}/MediaStack.tar.gz"
        '010-intel-media-stack-bin-fix-install.patch'
        '020-intel-media-stack-bin-fix-profile.patch')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('bceda8223e21d1d91927c784fa5d1f18c9e4ab508e610b03519f74c745de2642'
            '769757c058e750a7c4e00382719f34aa27d4d804423af0e55984b719c9332cb3'
            'b6c8e3d9db6195b3d0d2299774b1f57ef09c2f80eda8c7f1d0507d769dcfb62f')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}.tar.gz" -C "${pkgname}-${pkgver}" -s '|[^/]*/||'
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-intel-media-stack-bin-fix-install.patch"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/020-intel-media-stack-bin-fix-profile.patch"
    sed -i "/^pkgdir=/s|$|'${pkgdir}'|" "${pkgname}-${pkgver}/install_media.sh"
    chmod a+x "${pkgname}-${pkgver}/install_media.sh"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d -m755 "$pkgdir"/{etc/{ld.so.conf.d,profile.d},usr/lib}
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ./install_media.sh
    
    # add bin folder to PATH
    local _cmd
    local _file
    while read -r -d '' _file
    do
        if grep -q '\.csh$' <<< "$_file"
        then
            _cmd='setenv'
        else
            _cmd='export'
        fi
        
        printf '\n%s\n' '# add bin folder to PATH' >> "$_file"
        printf '%s\n' "${_cmd} PATH=\"\${PATH:+\"\${PATH}\":}/opt/intel/media/bin\"" >> "$_file"
    done < <(find "${pkgdir}/etc/profile.d" -maxdepth 1 -mindepth 1 -type f -name 'intel-media.*sh' -print0)
    
    # add symlink for libcttmetrics.so (required by 'metrics_monitor' sample)
    ln -s ../share/mfx/samples/_bin/libcttmetrics.so "${pkgdir}/opt/intel/media/lib64/libcttmetrics.so"
    
    # remove insecure rpath
    chrpath -d "${pkgdir}/opt/intel/media/lib64/iHD_drv_video.so"
    
    # do not force the use of 'iHD' libva driver by default (let user choose)
    local _info='# uncomment the LIBVA lines bellow to use the Intel Media Driver (iHD) for VAAPI'
    sed -i "2i${_info}" "${pkgdir}/etc/profile.d"/intel-media.{,c}sh
    sed -i '3,4s/^/#/'  "${pkgdir}/etc/profile.d"/intel-media.{,c}sh
}
