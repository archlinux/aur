# Maintainer: Stephen Bell <theredbaron1834 {at} yahoo {dot} com>
pkgname=apk-thumbnailer
pkgver=1.0
pkgrel=1
pkgdesc="a simple thumbnailer for apk files"
arch=(i686 x86_64)
url="https://github.com/theredbaron1834/Scripts/blob/master/apk-thumbnailer"
license=('BSD 3 Clause')
depends=('java-runtime' 'android-sdk-build-tools' 'imagemagick' 'unzip')


prepare() {
  cd "$srcdir"

echo "[Thumbnailer Entry]
TryExec=/usr/bin/apk-thumbnailer
Exec=/usr/bin/apk-thumbnailer %u %o
MimeType=application/vnd.android.package-archive" > apk-thumbnailer.thumbnailer


echo "#!/bin/bash
file=\$(echo "\$1" | sed s'/file:\/\///g' | sed s'/%20/ /g' | sed s'/%5B/\[/g'| sed s'/%5D/\]/g') # Clean up thumbnailer for aapt
icon=\$(/opt/android-sdk/build-tools/*/aapt d --values badging "\$file" | grep application-icon- | sed s'/:/\n/g' | tail -n 1 | tr -d \') #Grab icon location
mkdir /tmp/apkthumbnailer/
cd /tmp/apkthumbnailer/
unzip -o "\$file" "\$icon" # Extract icon
convert -thumbnail 200 /tmp/apkthumbnailer/\$icon "\$2" # Make thumbnail" > apk-thumbnailer

}

package() {
  install -Dm 0755 "${srcdir}/apk-thumbnailer.thumbnailer" "${pkgdir}/usr/share/thumbnailers/apk-thumbnailer.thumbnailer"
  install -Dm 0755 "${srcdir}/apk-thumbnailer" "${pkgdir}/usr/bin/apk-thumbnailer"
}
