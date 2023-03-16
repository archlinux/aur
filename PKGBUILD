# Maintainer: Yu-Hsuan Tu <dobe0331 at gmail dot com>
_pkgname=metashape
pkgname=agisoft-${_pkgname}
pkgver=2.0.1
pkgrel=2
pkgdesc="Photogrammetric processing of digital images and 3D spatial data generation software. Standard edition"
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
            'intel-compute-runtime: Intel Neo OpenCL runtime for GPU acceleration')
provides=('agisoft-metashape')
options=('!strip')
install=${pkgname}.install
source=("https://s3-eu-west-1.amazonaws.com/download.agisoft.com/${_pkgname}_${pkgver//./_}_amd64.tar.gz"
        "agisoft-metashape-icon-encoded.txt"
        "agisoft-psx-mime-icon-encoded.txt"
	"agisoft-psz-mime-icon-encoded.txt")
sha256sums=('037db9b3b85acc88cf533bd129a0a80dd1f228cc7d55b764dfdf4ffe75151b49'
            '959eb21ce482a5b1f84a0e04ec6f0d53aaf679c84bce9f813b350afe5dd201ba'
            '627df01b98f9f22b31d62ba039127b7809650990d1633e4190f1d9844830a0ff'
            'd44fb70962175505fd3bfc0e96670e5bf4092c80446e0142cc91a3e0033e1009')

build() {
    # Create desktop entries
    echo "[Desktop Entry]
Type=Application
Name=Agisoft MetaShape
Comment=Photogrammetric processing software
Exec=agisoft-metashape
MimeType=application/agisoft.psx;application/agisoft.psz
Icon=agisoft-metashape
Terminal=false
Categories=Science;ImageProcessing" > "$srcdir/agisoft-metashape.desktop"

    # Create MetaShape MIME type file
    echo '<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/agisoft.psx">
        <comment>MetaShape Project</comment>
        <icon name="application-agisoft-psx"/>
        <glob-deleteall/>
        <glob pattern="*.psx"/>
    </mime-type>
    <mime-type type="application/agisoft.psz">
        <comment>MetaShape Archive</comment>
        <icon name="application-agisoft-psz"/>
        <glob-deleteall/>
        <glob pattern="*.psz"/>
    </mime-type>
</mime-info>' > "$srcdir/${pkgname}-mime.xml"

    # Create 128x128 application icons
    base64 -d "$srcdir/agisoft-metashape-icon-encoded.txt" > "$srcdir/agisoft-metashape_128.png"
    
    # Create 128x128 mime icons
    base64 -d "$srcdir/agisoft-psx-mime-icon-encoded.txt" > "$srcdir/application-agisoft-psx_128.png"
    base64 -d "$srcdir/agisoft-psz-mime-icon-encoded.txt" > "$srcdir/application-agisoft-psz_128.png"
    
    # Create icons for other resolutions
    for _res in 16 32 48 64; do
        convert "$srcdir/agisoft-metashape_128.png" -resize ${_res}x${_res} "$srcdir/agisoft-metashape_${_res}.png"
        convert "$srcdir/application-agisoft-psx_128.png" -resize ${_res}x${_res} "$srcdir/application-agisoft-psx_${_res}.png"
        convert "$srcdir/application-agisoft-psz_128.png" -resize ${_res}x${_res} "$srcdir/application-agisoft-psz_${_res}.png"
    done
    
    # Create executables for /usr/bin
    echo "#!/bin/bash
/opt/agisoft/${_pkgname}/metashape.sh \$@" > "$srcdir/agisoft-metashape"
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
    mv "${srcdir}/agisoft-metashape.desktop" "${pkgdir}/usr/share/applications/"

    # Create MIME type
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    mv "${srcdir}/${pkgname}-mime.xml" "${pkgdir}/usr/share/mime/packages"

    # Move icons
    for _res in 16x16 32x32 48x48 64x64 128x128; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/"
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/"
        mv "$srcdir/agisoft-metashape_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/agisoft-metashape.png"
        mv "$srcdir/application-agisoft-psx_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/application-agisoft-psx.png"
        mv "$srcdir/application-agisoft-psz_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/application-agisoft-psz.png"
    done
    
    # Create executables in /usr/bin
    install -Dm755 "$srcdir/agisoft-metashape" "$pkgdir/usr/bin/agisoft-metashape"

    # Set the rehostable directory and environment variables in executables for activation
    mkdir -p "${pkgdir}/opt/agisoft/${_pkgname}/rehostable"
    sed -i '/export LD_LIBRARY_PATH/a\\nAGISOFT_REHOST_PATH=\$dirname/rehostable\nexport AGISOFT_REHOST_PATH' "${pkgdir}/opt/agisoft/${_pkgname}/metashape.sh"

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
