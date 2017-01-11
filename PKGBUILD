# Maintainer: zoe <chp321 at gmail dot com>
pkgname=filecast
pkgver=1.0
pkgrel=1
arch=('any')
pkgdesc="Zero setup, cross platform desktop to mobile file transfer tool with GUI"
url="http://www.onyxbits.de/filecast"
license=('Apache')
depends=('java-environment')
source=('filecast.desktop'
        "https://github.com/onyxbits/FileCast/raw/master/src/main/resources/appicon-64.png"
        "http://www.onyxbits.de/sites/default/files/download/339/${pkgname}-${pkgver}.jar")
noextract=("${pkgname}-${pkgver}.jar")
md5sums=('b728f63da5204098d15b9b189d15082a'  #filecast.desktop
         '415293972a77a101ddf2392618d85b74'  #appicon-64.png
         'ae0bb15e5669d16b551c49474dcc2d36') #${pkgname}-${pkgver}.jar

package() {
  # install files to java shared dir
  mkdir -p "$pkgdir/usr/share/java/$pkgname"
  install -Dm644 ${pkgname}-${pkgver}.jar "$pkgdir/usr/share/java/$pkgname"

  # install icon and desktop database entry
  install -Dm644 appicon-64.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop  "$pkgdir/usr/share/applications/${pkgname}.desktop"

  # starter
  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/filecast" << \here
#!/bin/sh
exec java -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dfilecast.home="$HOME/.Filecast" -jar /usr/share/java/filecast/filecast-pkgver.jar "$@"
exit $?
here
    sed -i "s/pkgver/${pkgver}/" "$pkgdir/usr/bin/${pkgname}"
    chmod a+x "${pkgdir}/usr/bin/${pkgname}"
}

