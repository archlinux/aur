# Maintainer: Urs Wolfer <uwolfer @ fwo.ch>

pkgname=intellij-idea-ultimate-edition
pkgver=2016.3
_buildver=163.7743.44
pkgrel=1
pkgdesc="An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity."
arch=('any')
url="https://www.jetbrains.com/idea/"
backup=("usr/share/${pkgname}/bin/idea.vmoptions" "usr/share/${pkgname}/bin/idea64.vmoptions" "usr/share/${pkgname}/bin/idea.properties")
license=('Commercial')
depends=('java-environment' 'giflib' 'libxtst')
options=(!strip)
source=(https://download.jetbrains.com/idea/ideaIU-$pkgver-no-jdk.tar.gz \
        intellijidea.sh \
        jetbrains-idea.desktop
)
sha256sums=('b4076afcea3aaf0a19b7a390cb12c008335938bcac1e0fa398668f2aa01ea2fe'
            'ed7883b33b6fa9f2e303e5549bd238ceb552ec11ca116730271a58aca685229a'
            '83af2ba8f9f14275a6684e79d6d4bd9b48cd852c047dacfc81324588fa2ff92b'
)
package() {
  cd "$srcdir"

  install -d -m755 "$pkgdir"/usr/{bin,share}
  cp -a "idea-IU-$_buildver" "$pkgdir"/usr/share/"$pkgname"

  # make sure that all files are owned by root
  chown -R root:root "$pkgdir"/usr/share

  find "$pkgdir"/usr/share/"$pkgname" -type d -exec chmod 0755 {} ';'
  find "$pkgdir"/usr/share/"$pkgname" -type f -exec chmod 0644 {} ';'

  chmod +x "$pkgdir"/usr/share/"$pkgname"/bin/idea.sh
  chmod +x "$pkgdir"/usr/share/"$pkgname"/bin/fsnotifier
  chmod +x "$pkgdir"/usr/share/"$pkgname"/bin/fsnotifier64

  install -D -m755 "$srcdir"/intellijidea.sh "$pkgdir"/usr/bin/"$pkgname"
  install -D -m644 "$srcdir"/jetbrains-idea.desktop "$pkgdir"/usr/share/applications/jetbrains-idea.desktop
  install -D -m644 "$srcdir"/idea-IU-$_buildver/bin/idea.png "$pkgdir"/usr/share/pixmaps/"$pkgname".png

  # workaround FS#40934
  sed -i 's|lcd|on|'  "$pkgdir"/usr/share/"$pkgname"/bin/*.vmoptions
}

# vim:set ts=2 sw=2 et:
