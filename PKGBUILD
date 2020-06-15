# Maintainer: Yu-Hsuan Tu <dobe0331 at gmail dot com>
_pkgname=metashape
pkgname=agisoft-${_pkgname}
pkgver=1.6.3
pkgrel=1
pkgdesc="Phtogrammetric processing of digital images and 3D spatial data generation software. Standard edition"
arch=('x86_64')
url="https://www.agisoft.com/"
license=('custom:Agisoft EULA' 'custom')
makedepends=('imagemagick')
provides=('agisoft-metashape')
options=('!strip')
install=${pkgname}.install
source=("http://download.agisoft.com/${_pkgname}_${pkgver//./_}_amd64.tar.gz"
        "agisoft-metashape-icon-encoded.txt"
        "agisoft-psx-mime-icon-encoded.txt"
	"agisoft-psz-mime-icon-encoded.txt")
sha256sums=('1e14a3f92e92af56d8236b711eb8b8370c0c2d1842b1f4065341f642c54d2734'
            'SKIP'
            'SKIP'
            'SKIP')

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
}
