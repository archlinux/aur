# Maintainer: Yu-Hsuan Tu <dobe0331 at gmail dot com>
_pkgname=metashape-pro
pkgname=agisoft-${_pkgname}
pkgver=2.0.1
pkgrel=2
pkgdesc="Photogrammetric processing of digital images and 3D spatial data generation software. Professional edition"
arch=('x86_64')
url="https://www.agisoft.com/"
license=('custom:Agisoft EULA' 'custom')
depends=('gcc')
makedepends=('imagemagick')
optdepends=('glu: mesa OpenGL lib'
            'nvidia-utils: nvidia proprietary OpenGL lib'
            'opencl-mesa: mesa OpenCL runtime for GPU acceleration'
            'opencl-amd: AMDGPU PRO OpenCL runtime for GPU acceleration'
            'cuda: nvidia CUDA runtime for GPU acceleration'
            'intel-compute-runtime: Intel Neo OpenCL runtime for GPU acceleration'
            'libffi6: QT5 API support in console')
provides=('agisoft-metashape-pro' 'agisoft-network-monitor' 'agisoft-viewer')
options=('!strip')
install=${pkgname}.install
source=("https://s3-eu-west-1.amazonaws.com/download.agisoft.com/${_pkgname}_${pkgver//./_}_amd64.tar.gz"
        "agisoft-metashape-pro-icon-encoded.txt"
        "agisoft-network-monitor-icon-encoded.txt"
        "agisoft-viewer-icon-encoded.txt"
        "agisoft-psx-mime-icon-encoded.txt"
        "agisoft-psz-mime-icon-encoded.txt"
        "agisoft-3dv-mime-icon-encoded.txt")
sha256sums=('d10eb78a9a37ea9e3f941abee199ba4a13b221b99bc0ebae8d0caa00b11a2ba1'
            '959eb21ce482a5b1f84a0e04ec6f0d53aaf679c84bce9f813b350afe5dd201ba'
            'ef484e2a60966a722d7989abdbb85464054c47dd56b2ce182b2c0c5602476599'
            'a5e29a00393d55a9b589e1fb30acb57a96ef26756507d2793e7f3494d5778ae3'
            '627df01b98f9f22b31d62ba039127b7809650990d1633e4190f1d9844830a0ff'
            'd44fb70962175505fd3bfc0e96670e5bf4092c80446e0142cc91a3e0033e1009'
            '047225857a8b30362bab61f916ab1ddb19c0906959bf57c4ab5e499b8a9c4fc8')

build() {
    # Create desktop entries
    echo "[Desktop Entry]
Type=Application
Name=Agisoft MetaShape Pro
Comment=Photogrammetric processing software
Exec=agisoft-metashape-pro
MimeType=application/agisoft.psx;application/agisoft.psz
Icon=agisoft-metashape-pro
Terminal=false
Categories=Science;ImageProcessing" > "$srcdir/agisoft-metashape-pro.desktop"

    echo "[Desktop Entry]
Type=Application
Name=Agisoft Network Monitor
Comment=Monitor the network cluster of MetaShape
Exec=agisoft-network-monitor
Icon=agisoft-network-monitor
Terminal=false
Categories=Science;ImageProcessing" > "$srcdir/agisoft-network-monitor.desktop"

    echo "[Desktop Entry]
Type=Application
Name=Agisoft Viewer
Comment=Visualise the MetaShape output 3D data
Exec=agisoft-viewer
MimeType=application/agisoft.3dv;application/agisoft.vpz
Icon=agisoft-viewer
Terminal=false
Categories=Science;ImageProcessing" > "$srcdir/agisoft-viewer.desktop"

    # Create MetaShape MIME type file
    echo '<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/agisoft.psx">
        <comment>MetaShape Project</comment>
        <icon name="application-agisoft-pro-psx"/>
        <glob-deleteall/>
        <glob pattern="*.psx"/>
    </mime-type>
    <mime-type type="application/agisoft.psz">
        <comment>MetaShape Archive</comment>
        <icon name="application-agisoft-pro-psz"/>
        <glob-deleteall/>
        <glob pattern="*.psz"/>
    </mime-type>
    <mime-type type="application/agisoft.vpz">
        <comment>Viewer Project</comment>
        <icon name="application-agisoft-viewer-vpz"/>
        <glob-deleteall/>
        <glob pattern="*.vpz"/>
    </mime-type>
    <mime-type type="application/agisoft.3dv">
        <comment>Viewer 1.6 Project</comment>
        <icon name="application-agisoft-viewer-3dv"/>
        <glob-deleteall/>
        <glob pattern="*.3dv"/>
    </mime-type>
</mime-info>' > "$srcdir/${pkgname}-mime.xml"

    # Create 128x128 application icons
    base64 -d "$srcdir/agisoft-metashape-pro-icon-encoded.txt" > "$srcdir/agisoft-metashape-pro_128.png"
    base64 -d "$srcdir/agisoft-network-monitor-icon-encoded.txt" > "$srcdir/agisoft-network-monitor_128.png"
    base64 -d "$srcdir/agisoft-viewer-icon-encoded.txt" > "$srcdir/agisoft-viewer_128.png"
    
    # Create 128x128 mime icons
    base64 -d "$srcdir/agisoft-psx-mime-icon-encoded.txt" > "$srcdir/application-agisoft-psx_128.png"
    base64 -d "$srcdir/agisoft-psz-mime-icon-encoded.txt" > "$srcdir/application-agisoft-psz_128.png"
    base64 -d "$srcdir/agisoft-3dv-mime-icon-encoded.txt" > "$srcdir/application-agisoft-3dv_128.png"
    
    # Create icons for other resolutions
    for _res in 16 32 48 64; do
        convert "$srcdir/agisoft-metashape-pro_128.png" -resize ${_res}x${_res} "$srcdir/agisoft-metashape-pro_${_res}.png"
        convert "$srcdir/agisoft-network-monitor_128.png" -resize ${_res}x${_res} "$srcdir/agisoft-network-monitor_${_res}.png"
        convert "$srcdir/agisoft-viewer_128.png" -resize ${_res}x${_res} "$srcdir/agisoft-viewer_${_res}.png"
        convert "$srcdir/application-agisoft-psx_128.png" -resize ${_res}x${_res} "$srcdir/application-agisoft-psx_${_res}.png"
        convert "$srcdir/application-agisoft-psz_128.png" -resize ${_res}x${_res} "$srcdir/application-agisoft-psz_${_res}.png"
        convert "$srcdir/application-agisoft-3dv_128.png" -resize ${_res}x${_res} "$srcdir/application-agisoft-3dv_${_res}.png"
    done
    
    # Create executables for /usr/bin
    echo "#!/bin/bash
/opt/agisoft/${_pkgname}/metashape.sh \$@" > "$srcdir/agisoft-metashape-pro"
    echo "#!/bin/bash
/opt/agisoft/${_pkgname}/monitor.sh \$@" > "$srcdir/agisoft-network-monitor"
    echo "#!/bin/bash
/opt/agisoft/${_pkgname}/viewer.sh \$@" > "$srcdir/agisoft-viewer"
}

package() {
    # Move extracted folder to opt
    cd "$pkgdir"
    mkdir -p "opt/agisoft"
    mv "${srcdir}/${_pkgname}" "${pkgdir}/opt/agisoft/"

    # Install licenses
    cd opt/agisoft/${_pkgname}
    install -Dm644 eula.txt "$pkgdir/usr/share/licenses/$pkgname/eula.txt"
    mv licenses "$pkgdir/usr/share/licenses/$pkgname"
    rm eula.txt

    # Move desktop entries
    mkdir -p "${pkgdir}/usr/share/applications/"
    mv "${srcdir}/agisoft-metashape-pro.desktop" "${pkgdir}/usr/share/applications/"
    mv "${srcdir}/agisoft-network-monitor.desktop" "${pkgdir}/usr/share/applications/"
    mv "${srcdir}/agisoft-viewer.desktop" "${pkgdir}/usr/share/applications/"

    # Create MIME type
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    mv "${srcdir}/${pkgname}-mime.xml" "${pkgdir}/usr/share/mime/packages"

    # Move icons
    for _res in 16x16 32x32 48x48 64x64 128x128; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/"
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/"
        mv "$srcdir/agisoft-metashape-pro_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/agisoft-metashape-pro.png"
        mv "$srcdir/agisoft-network-monitor_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/agisoft-network-monitor.png"
        cp "$srcdir/agisoft-viewer_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/application-agisoft-viewer-vpz.png"
        mv "$srcdir/agisoft-viewer_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/agisoft-viewer.png"
        mv "$srcdir/application-agisoft-psx_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/application-agisoft-pro-psx.png"
        mv "$srcdir/application-agisoft-psz_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/application-agisoft-pro-psz.png"
        mv "$srcdir/application-agisoft-3dv_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/application-agisoft-viewer-3dv.png"
    done
    
    # Create executables in /usr/bin
    install -Dm755 "$srcdir/agisoft-metashape-pro" "$pkgdir/usr/bin/agisoft-metashape-pro"
    install -Dm755 "$srcdir/agisoft-network-monitor" "$pkgdir/usr/bin/agisoft-network-monitor"
    install -Dm755 "$srcdir/agisoft-viewer" "$pkgdir/usr/bin/agisoft-viewer"

    # Set the rehostable directory and environment variables in executables for activation
    mkdir -p "${pkgdir}/opt/agisoft/${_pkgname}/rehostable"
    sed -i '/export LD_LIBRARY_PATH/a\\nAGISOFT_REHOST_PATH=\$dirname/rehostable\nexport AGISOFT_REHOST_PATH' "${pkgdir}/opt/agisoft/${_pkgname}/metashape.sh"
    sed -i '/export LD_LIBRARY_PATH/a\\nAGISOFT_REHOST_PATH=\$dirname/rehostable\nexport AGISOFT_REHOST_PATH' "${pkgdir}/opt/agisoft/${_pkgname}/viewer.sh"
    sed -i '/export LD_LIBRARY_PATH/a\\nAGISOFT_REHOST_PATH=\$dirname/rehostable\nexport AGISOFT_REHOST_PATH' "${pkgdir}/opt/agisoft/${_pkgname}/monitor.sh"

    # Set correct permission
    chmod -R g=u "$pkgdir/opt/agisoft/${_pkgname}"
    chmod -R o=u "$pkgdir/opt/agisoft/${_pkgname}"
    chmod -R g-w "$pkgdir/opt/agisoft/${_pkgname}"
    chmod -R o-w "$pkgdir/opt/agisoft/${_pkgname}"
    chmod -R g=u "$pkgdir/usr/share/licenses/$pkgname/licenses"
    chmod -R o=u "$pkgdir/usr/share/licenses/$pkgname/licenses"
    chmod -R g-w "$pkgdir/usr/share/licenses/$pkgname/licenses"
    chmod -R o-w "$pkgdir/usr/share/licenses/$pkgname/licenses"
}

