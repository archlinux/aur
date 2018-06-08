# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=intel-media-stack-bin
pkgver=2018.Q2.1
pkgrel=1
pkgdesc='Tools and libraries for developing media solutions on Intel products. Includes MediaSDK, Media Driver, libva and libdrm.'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
provides=('intel-media-sdk' 'libmfx' 'intel-media-driver')
conflicts=('intel-media-sdk' 'intel-media-sdk-git' 'intel-media-server-studio')
backup=('etc/profile.d/intel-mediasdk-devel.sh'
        'etc/profile.d/intel-mediasdk-devel.csh'
        'etc/profile.d/intel-mediasdk.sh'
        'etc/profile.d/intel-mediasdk.csh')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Intel-Media-SDK/MediaSDK/releases/download/MediaSDK-${pkgver/.Q/-Q}/MediaStack.tar.gz"
        'LICENSE'::"https://raw.githubusercontent.com/Intel-Media-SDK/MediaSDK/MediaSDK-${pkgver/.Q/-Q}/LICENSE")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('c3b277656b4ccdb16705431f75af671bd6c757e958498080c5c282cf4fa163f0'
            'dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    msg2 "Extracting ${pkgname}-${pkgver}.tar.gz with bsdtar..."
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -s'|[^/]*/||'
    
    sed -i "s|/\\$|${pkgdir}/\\$|g" install_media.sh
    sed -i "s|/etc|${pkgdir}/etc|g" install_media.sh
    sed -i '/ldconfig/s/^/#/g'      install_media.sh
    
    sed -i 's/[[:space:]]Please[[:space:]]reboot[[:space:]]to[[:space:]]make[[:space:]]it[[:space:]]effective\.//' install_media.sh
    sed -i 's/[[:space:]]Please[[:space:]]Reboot\.//' install_media.sh
}

package() {
    cd "${pkgname}-${pkgver}"
    
    mkdir -p "$pkgdir"/etc/{ld.so.conf.d,profile.d}
    
    ./install_media.sh
    
    # do not force the use of 'iHD' libva driver by default (let user choose)
    local _info='# uncomment the LIBVA_DRIVER_NAME line to use the Intel Media Driver (iHD) for VAAPI'
    sed -i "2i${_info}" "$pkgdir"/etc/profile.d/intel-mediasdk.*sh
    sed -i '/^export[[:space:]]LIBVA_DRIVER_NAME/s/^/#/' "${pkgdir}/etc/profile.d/intel-mediasdk.sh"
    sed -i '/^setenv[[:space:]]LIBVA_DRIVER_NAME/s/^/#/' "${pkgdir}/etc/profile.d/intel-mediasdk.csh"
    
    # license
    cd "${srcdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
