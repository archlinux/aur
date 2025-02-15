# Maintainer: Andreas Hemmerle <andreas dot hemmerle at gmail dot com>
# Contributor: Daniel Pielmeier <billie at gentoo dot org>
pkgname=vdr-channeleditor
pkgver=1.9.2.1
pkgrel=2
pkgdesc='Editor for VDR channels.conf (written in Java)'
_workdir="${pkgname#*-}"
arch=('any')
license=('GPL2')
url='https://sites.google.com/site/reniershomepage/channeleditor'
depends=('java-runtime')
makedepends=('ant' 'dos2unix' 'gendesk')
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/channeleditor/files/channeleditor/1.9.2/channeleditor_"$pkgver"_src.tar.gz/download"
        "build.xml"
        "messages.properties.patch"
        "messages_en.properties.patch"
        "icon.svg"
        "start.sh")
sha256sums=('590ef8daa83244833136f317fc5599c7d998a186ee4f76c9953e4546605435d8'
            '78e628bff081096eed6220366352c0ac02603d674a20fb9333ad9e191b312976'
            '3759fc5a5f8784593015fcc47ab6466fbb40d7110d3dc9e3eeca32b3186a6d42'
            '60543cc1571a4194fa662ad1a62c88529c977f0c50a0f1d114730d063cd48fef'
            '9b4dd712c93fab7ed923116eca9e9dfbfc5330ab1c148ad3c4f31f82d0e40cd3'
            'ce7ae60d875e8da74227996c29d6a837e0537f5a104f875f4a703388dae4b795')


prepare() {
  cd "$srcdir" || exit 1

  # desktop icon and start script
  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Channeleditor for VDR" --icon "$pkgname" --categories "AudioVideo;Utility" --custom "Name[de]=Kanaleditor für VDR"
  sed -i '/StartupNotify/d' "$pkgname.desktop"
  echo -e "#!/bin/sh\njava -jar /usr/share/java/$pkgname/$pkgname.jar" > "$pkgname.sh"

  cd "$_workdir" || exit 1

  #localisation changes
  patch "src/java/de/renier/vdr/channel/editor/messages.properties" --input="../messages.properties.patch"
  patch "src/java/de/renier/vdr/channel/editor/messages_en.properties" --input="../messages_en.properties.patch"

  # move files out of build and remove stuff not needed in the package
  mv -f build/* ./
  rm -f src/java/org/javalobby/icons/{README,COPYRIGHT}

  # convert CRLF to LF
  dos2unix MANIFEST.MF

  # add ant 'build.xml'
  ln -fs ../build.xml build.xml
}


build() {
  cd "$srcdir/$_workdir" || exit 1
  ant build -Dmanifest.mainclass="$(sed -n "s/^Main-Class: \([^ ]\+\).*/\1/p" "MANIFEST.MF")"
}


package () {
  install -Dm644 "$srcdir/$_workdir/dist/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "start.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
