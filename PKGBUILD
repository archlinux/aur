# Maintainer: Urs Wolfer <uwolfer @ fwo.ch>

pkgname=intellij-idea-ultimate-edition
pkgver=14.1.4
_buildver=141.1532.4
pkgrel=1
pkgdesc="An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity."
arch=('any')
url="http://www.jetbrains.com/idea/"
backup=("usr/share/${pkgname}/bin/idea.vmoptions" "usr/share/${pkgname}/bin/idea64.vmoptions")
license=('Commercial')
depends=('java-environment' 'giflib' 'libxtst')
options=(!strip)
source=(https://download.jetbrains.com/idea/ideaIU-$pkgver.tar.gz \
        intellijidea.sh \
        jetbrains-idea.desktop
)
sha256sums=('5c6dfb5ba9f2c3294ee125e96e96e50287a460784287181a8e83e4326005bac3'
            '69f9e675d2fc5fe1c02e281367a38789a5005afc3d6a3e0cd08d099f10057b62'
            '83af2ba8f9f14275a6684e79d6d4bd9b48cd852c047dacfc81324588fa2ff92b'
)
package() {
  cd "$srcdir"

  install -d -m755 $pkgdir/usr/{bin,share}
  cp -a "idea-IU-$_buildver" "$pkgdir/usr/share/$pkgname"
  chown -R root:root $pkgdir/usr/share

  find $pkgdir/usr/share/$pkgname -type d -exec chmod 0755 {} ';'
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 0644 {} ';'

  chmod +x $pkgdir/usr/share/$pkgname/bin/idea.sh
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier64

  install -D -m755 $srcdir/intellijidea.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $srcdir/jetbrains-idea.desktop $pkgdir/usr/share/applications/jetbrains-idea.desktop
  install -D -m644 $srcdir/idea-IU-$_buildver/bin/idea.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -D -m644 $srcdir/idea-IU-$_buildver/license/IDEA_license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt

  # workaround FS#40934
  sed -i 's|lcd|on|'  "$pkgdir"/usr/share/$pkgname/bin/*.vmoptions
}

# vim:set ts=2 sw=2 et:
