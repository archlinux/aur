# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgbase=adobe-dng
pkgname=("adobe-dng-lcp" "adobe-dng-dcp")
pkgver=12.2.1
pkgrel=1
pkgdesc="Extracted profiles from Adobe DNG Converter"
arch=("any")
url="https://helpx.adobe.com/ca/photoshop/using/adobe-dng-converter.html"
license=("custom:commercial")
makedepends=("p7zip")
source=("http://download.adobe.com/pub/adobe/dng/win/DNGConverter_${pkgver//./_}.exe")
sha256sums=("78d97cca5e075af5dae18da63613577b35bbf24d7d2145af058a3c34cb0de200")
noextract=("DNGConverter_${pkgver//./_}.exe")
options=("!strip")

prepare() {
    cd "$srcdir/"
    7z x -y "DNGConverter_${pkgver//./_}.exe" '$APPDATA'
    mv '$APPDATA/Adobe/CameraRaw/' ./
    rmdir -p '$APPDATA/Adobe/'
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
