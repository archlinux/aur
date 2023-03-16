# Maintainer: Yu-Hsuan Tu <dobe0331 at gmail dot com>
_pkgname=delighter
pkgname=agisoft-${_pkgname}
pkgver=2.0.1
pkgrel=2
pkgdesc="A free stand-alone tool designed to remove shadows from model textures"
arch=('x86_64')
url="https://www.agisoft.com/"
license=('custom:Agisoft EULA' 'custom')
makedepends=('imagemagick')
provides=('agisoft-delighter')
options=('!strip')
install=${pkgname}.install
source=("https://s3-eu-west-1.amazonaws.com/download.agisoft.com/${_pkgname}_${pkgver//./_}_amd64.tar.gz"
	"agisoft-delighter-icon-encoded.txt")
sha256sums=('d176f4ec794523a3e9d84773e55463ef848fef4747ae854836bda9ccab33b8d9'
            '6cc74a4ac8ec776ebea5eff2383ddaf2520bb0a47f7d2135a62277dbd9206921')

build() {
    # Create desktop entries
    echo "[Desktop Entry]
Type=Application
Name=Agisoft De-Lighter
Comment=Remove shadows from model textures
Exec=agisoft-delighter
MimeType=application/agisoft.dlz
Icon=agisoft-delighter
Terminal=false
Categories=Science;ImageProcessing" > "$srcdir/agisoft-delighter.desktop"

    # Create Delighter MIME type file
    echo '<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/agisoft.dlz">
        <comment>Delighter Projects</comment>
        <icon name="application-agisoft-dlz"/>
        <glob-deleteall/>
        <glob pattern="*.dlz"/>
    </mime-type>
</mime-info>' > "$srcdir/${pkgname}-mime.xml"

    # Create 128x128 application icons
    base64 -d "$srcdir/agisoft-delighter-icon-encoded.txt" > "$srcdir/agisoft-delighter_128.png"
    
    # Create 128x128 mime icons
    cp "$srcdir/agisoft-delighter_128.png" "$srcdir/application-agisoft-dlz_128.png"
    
    # Create icons for other resolutions
    for _res in 16 32 48 64; do
        convert "$srcdir/agisoft-delighter_128.png" -resize ${_res}x${_res} "$srcdir/agisoft-delighter_${_res}.png"
        convert "$srcdir/application-agisoft-dlz_128.png" -resize ${_res}x${_res} "$srcdir/application-agisoft-dlz_${_res}.png"
    done
    
    # Create executables for /usr/bin
    echo "#!/bin/bash
/opt/agisoft/${_pkgname}/delighter.sh \$@" > "$srcdir/agisoft-delighter"
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
    mv "${srcdir}/agisoft-delighter.desktop" "${pkgdir}/usr/share/applications/"

    # Create MIME type
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    mv "${srcdir}/${pkgname}-mime.xml" "${pkgdir}/usr/share/mime/packages"

    # Move icons
    for _res in 16x16 32x32 48x48 64x64 128x128; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/"
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/"
        mv "$srcdir/agisoft-delighter_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/agisoft-delighter.png"
        mv "$srcdir/application-agisoft-dlz_${_res/x*}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}/mimetypes/application-agisoft-dlz.png"
    done
    
    # Create executables in /usr/bin
    install -Dm755 "$srcdir/agisoft-delighter" "$pkgdir/usr/bin/agisoft-delighter"

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
