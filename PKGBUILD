# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-stack-bin
pkgver=2021.2.3
pkgrel=1
pkgdesc='Tools and libraries for developing media solutions on Intel products (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=('gcc-libs' 'libpciaccess' 'libgl' 'libdrm' 'libx11' 'libxext'
         'libxfixes' 'wayland')
optdepends=('ocl-icd: for rotate_opencl plugin'
            'intel-compute-runtime: for rotate_opencl plugin')
makedepends=('chrpath' 'lsb-release' 'ocl-icd')
provides=('intel-media-sdk' 'libmfx' 'intel-gmmlib' 'intel-media-driver'
          'libva' 'libva-utils')
options=('!strip' '!emptydirs')
install=intel-media-stack-bin.install
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Intel-Media-SDK/MediaSDK/releases/download/intel-mediasdk-${pkgver:2}/MediaStack.tar.gz"
        '010-intel-media-stack-bin-fix-install.patch')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('230ce1418677c4bf9162d98c434aca3cf802d2ad4eb6a2a549488b3353d99a0d'
            '500c2236c71812ca816dbc0752fa5038b41fc73a71c8d1d6684ea770f8918f74')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}.tar.gz" -C "${pkgname}-${pkgver}" -s '|[^/]*/||'
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-intel-media-stack-bin-fix-install.patch"
    sed -i "/^pkgdir=/s|$|${pkgdir}|" "${pkgname}-${pkgver}/install_media.sh"
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
        printf '%s\n' "${_cmd} PATH=\"\${PATH:+\"\${PATH}\":}/opt/intel/mediasdk/bin\"" >> "$_file"
    done < <(find "${pkgdir}/etc/profile.d" -maxdepth 1 -mindepth 1 -type f -name 'intel-mediasdk.*sh' -print0)
    
    # add symlink for libcttmetrics.so (required by 'metrics_monitor' sample)
    ln -s ../share/mfx/samples/_bin/libcttmetrics.so "${pkgdir}/opt/intel/mediasdk/lib64/libcttmetrics.so"
    
    # fix broken symlinks for plugins
    rm "${pkgdir}/opt/intel/mediasdk"/{lib64/mfx/plugins.cfg,plugins}
    ln -s lib64/mfx "${pkgdir}/opt/intel/mediasdk/plugins"
    ln -s ../../share/mfx/plugins.cfg "${pkgdir}/opt/intel/mediasdk/lib64/mfx/plugins.cfg"
    
    # remove insecure and unneeded '/docker/...' rpath
    chrpath -d "${pkgdir}/opt/intel/mediasdk/lib64/iHD_drv_video.so"
    
    # do not force the use of 'iHD' libva driver by default (let user choose)
    local _info='# uncomment the LIBVA lines bellow to use the Intel Media Driver (iHD) for VAAPI'
    sed -i "2i${_info}" "$pkgdir/etc/profile.d"/intel-mediasdk.{,c}sh
    sed -i '3,4s/^/#/'  "$pkgdir/etc/profile.d"/intel-mediasdk.{,c}sh
}
