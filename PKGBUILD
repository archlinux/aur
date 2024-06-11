# Maintainer: Alex Szczuczko <alex@szc.ca>
# Contributor: Robert Gonciarz <gonciarz@gmail.com>

pkgbase=adobe-dng
pkgname=("adobe-dng-lcp" "adobe-dng-dcp")
pkgver=16.3
pkgrel=1
pkgdesc="Extracted profiles from Adobe DNG Converter"
arch=("any")
url="https://helpx.adobe.com/ca/photoshop/using/adobe-dng-converter.html"
license=("custom:commercial")
makedepends=("innoextract")
source=("http://download.adobe.com/pub/adobe/dng/win/AdobeDNGConverter_x64_${pkgver//./_}.exe")
sha256sums=("668d5cbe9023323e22bda0fd7dd409b18f8ff1646806076790a68f6d5190ad85")
noextract=("AdobeDNGConverter_x64_${pkgver//./_}.exe")
options=("!strip")

prepare() {
    cd "$srcdir/"
    innoextract -e "AdobeDNGConverter_x64_${pkgver//./_}.exe"
    mv 'commonappdata/Adobe/CameraRaw/' .
    rm -rf commonappdata
}

package_adobe-dng-lcp() {
    pkgdesc="Extracted Adobe LCPs (Lens Correction Profiles), for use in e.g. rawtherapee"

    cd "$srcdir/CameraRaw/LensProfiles/1.0/"

    install -dm755 "$pkgdir/usr/share/adobe-dng/$pkgname/"
    find . -maxdepth 1 -type d -print0 | xargs -0 cp -at "$pkgdir/usr/share/adobe-dng/$pkgname/"
    find "$pkgdir/usr/share/adobe-dng/$pkgname/" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/usr/share/adobe-dng/$pkgname/" -type f -print0 | xargs -0 chmod 644
}

package_adobe-dng-dcp() {
    pkgdesc="Extracted Adobe DCPs (DNG Camera Profiles)"

    cd "$srcdir/CameraRaw/CameraProfiles/"

    install -dm755 "$pkgdir/usr/share/adobe-dng/$pkgname/standard"
    cp -a "Adobe Standard/." "$pkgdir/usr/share/adobe-dng/$pkgname/standard/"

    install -dm755 "$pkgdir/usr/share/adobe-dng/$pkgname/camera"
    cp -a "Camera/." "$pkgdir/usr/share/adobe-dng/$pkgname/camera/"

    find "$pkgdir/usr/share/adobe-dng/$pkgname/" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/usr/share/adobe-dng/$pkgname/" -type f -print0 | xargs -0 chmod 644
}
