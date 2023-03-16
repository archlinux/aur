# Maintainer: Yu-Hsuan Tu <dobe0331 at gmail dot com>
_pkgname=viewer
pkgname=agisoft-${_pkgname}
pkgver=2.0.1
pkgrel=2
pkgdesc="A free stand-alone software to visualize 3D data"
arch=('x86_64')
url="https://www.agisoft.com/"
license=('custom:Agisoft EULA' 'custom')
makedepends=('imagemagick')
provides=('agisoft-viewer')
conflicts=('agisoft-metashape-pro')
options=('!strip')
install=${pkgname}.install
source=("https://s3-eu-west-1.amazonaws.com/download.agisoft.com/${_pkgname}_${pkgver//./_}_amd64.tar.gz"
        "agisoft-viewer-icon-encoded.txt"
        "agisoft-3dv-mime-icon-encoded.txt")
sha256sums=('4968aab96a559da9c35b8ac95c60185d733978d2e246e2033ab50045477e6ae1'
            'a5e29a00393d55a9b589e1fb30acb57a96ef26756507d2793e7f3494d5778ae3'
            '047225857a8b30362bab61f916ab1ddb19c0906959bf57c4ab5e499b8a9c4fc8')

build() {
    # Create desktop entries
    echo "[Desktop Entry]
Type=Application
Name=Agisoft Viewer
Comment=Visualise the MetaShape output 3D data
Exec=agisoft-viewer
MimeType=application/agisoft.3dv;application/agisoft.vpz
Icon=agisoft-viewer
Terminal=false
Categories=Science;ImageProcessing" > "$srcdir/agisoft-viewer.desktop"

    # Create Viewer MIME type file
    echo '<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
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
    base64 -d "$srcdir/agisoft-viewer-icon-encoded.txt" > "$srcdir/agisoft-viewer_128.png"
    
    # Create 128x128 mime icons
    base64 -d "$srcdir/agisoft-3dv-mime-icon-encoded.txt" > "$srcdir/application-agisoft-3dv_128.png"
    
    # Create icons for other resolutions
    for _res in 16 32 48 64; do
        convert "$srcdir/agisoft-viewer_128.png" -resize ${_res}x${_res} "$srcdir/agisoft-viewer_${_res}.png"
        convert "$srcdir/application-agisoft-3dv_128.png" -resize ${_res}x${_res} "$srcdir/application-agisoft-3dv_${_res}.png"
    done
    
    # Create executables for /usr/bin
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
    mv "${srcdir}/agisoft-viewer.desktop" "${pkgdir}/usr/share/applications/"

    # Create MIME type
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    mv "${srcdir}/${pkgname}-mime.xml" "${pkgdir}/usr/share/mime/packages"

    # Move icons
    for _res in 16x16 32x32 48x48 64x64 128x128; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/"
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/"
        cp "$srcdir/agisoft-viewer_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/application-agisoft-viewer-vpz.png"
        mv "$srcdir/agisoft-viewer_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/agisoft-viewer.png"
        mv "$srcdir/application-agisoft-3dv_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/application-agisoft-viewer-3dv.png"
    done
    
    # Create executables in /usr/bin
    install -Dm755 "$srcdir/agisoft-viewer" "$pkgdir/usr/bin/agisoft-viewer"

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

