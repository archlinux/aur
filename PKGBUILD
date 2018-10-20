# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-media-stack-bin
pkgver=2018.3.0
_srcver="$(printf '%s' "$pkgver" | sed -E 's/(^[0-9]{2})([0-9]{2})/\2/')"
pkgrel=2
pkgdesc='Tools and libraries for developing media solutions on Intel products. Includes MediaSDK, Media Driver, libva and libva-utils.'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=('gcc-libs' 'libpciaccess' 'intel-gmmlib' 'libdrm' 'libgl' 'libx11'
         'libxext' 'libxfixes' 'ocl-icd' 'wayland')
makedepends=('lsb-release')
provides=('intel-media-sdk' 'libmfx' 'intel-media-driver' 'libva' 'libva-utils')
conflicts=('intel-media-sdk')
backup=('etc/profile.d/intel-mediasdk-devel.sh'
        'etc/profile.d/intel-mediasdk-devel.csh'
        'etc/profile.d/intel-mediasdk.sh'
        'etc/profile.d/intel-mediasdk.csh')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Intel-Media-SDK/MediaSDK/releases/download/intel-mediasdk-${_srcver}/MediaStack.tar.gz"
        'LICENSE'::"https://raw.githubusercontent.com/Intel-Media-SDK/MediaSDK/intel-mediasdk-${_srcver}/LICENSE")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('7ceaf70c1a91c29fa9aaaae16a5eca154e9763152a2c84e73d529c17184e122a'
            'dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    printf '%s\n' "  -> Extracting ${pkgname}-${pkgver}.tar.gz with bsdtar..."
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -s'|[^/]*/||'
    
    sed -i "s|/\\$|${pkgdir}/\\$|g" install_media.sh
    sed -i "s|/etc|${pkgdir}/etc|g" install_media.sh
    sed -i '/ldconfig/s/^/#/g'      install_media.sh
    
    sed -i 's/[[:space:]]Please[[:space:]]reboot[[:space:]]to[[:space:]]make[[:space:]]it[[:space:]]effective\.//' install_media.sh
    sed -i 's/[[:space:]]Please[[:space:]]Reboot\.//' install_media.sh
}

package() {
    cd "${pkgname}-${pkgver}"
    
    local _command
    local _file
    local _header
    
    mkdir -p "$pkgdir"/{etc/{ld.so.conf.d,profile.d},usr/lib}
    
    ./install_media.sh
    
    # headers (add 'mfx' folder for ffmpeg compatibility)
    mkdir -p "${pkgdir}/opt/intel/mediasdk/include/mfx"
    cd "${pkgdir}/opt/intel/mediasdk/include"
    for _header in *.h
    do
        cd mfx
        ln -sf ../"$_header" "$_header"
        cd ..
    done
    
    # add bin folder to PATH
    for _file in "${pkgdir}/etc/profile.d/"intel-mediasdk.{,c}sh
    do
        if printf '%s' "$_file" | grep -q '\.csh$'
        then
            _command='setenv'
        else
            _command='export'
        fi
        
        printf '\n' >> "$_file"
        printf '%s\n' '# add bin folder to PATH' >> "$_file"
        printf '%s\n' "${_command} PATH=\${PATH:+\${PATH}:}/opt/intel/mediasdk/bin" >> "$_file"
    done
    
    # move tools to bin folder
    mv "$pkgdir"/opt/intel/mediasdk/samples/_bin/x64/{asg-hevc,hevc_fei_extractor} "${pkgdir}/opt/intel/mediasdk/bin"
    
    # add symlink for libcttmetrics.so (required by 'metrics_monitor' sample)
    ln -s ../samples/_bin/x64/libcttmetrics.so "${pkgdir}/opt/intel/mediasdk/lib64/libcttmetrics.so"
    
    # remove broken binary sample (needs libgtest.so.0 - unavailable)
    rm "${pkgdir}/opt/intel/mediasdk/samples/_bin/x64/test_monitor"
    
    # fix broken symlink for plugins
    rm "${pkgdir}/opt/intel/mediasdk/lib64/mfx"
    ln -s ../plugins "${pkgdir}/opt/intel/mediasdk/lib64/mfx"
    
    # do not force the use of 'iHD' libva driver by default (let user choose)
    local _info='# uncomment the LIBVA lines bellow to use the Intel Media Driver (iHD) for VAAPI'
    sed -i "2i${_info}" "$pkgdir"/etc/profile.d/intel-mediasdk.{,c}sh
    sed -i '3,4s/^/#/'  "$pkgdir"/etc/profile.d/intel-mediasdk.{,c}sh
    
    # license
    cd "$srcdir"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
