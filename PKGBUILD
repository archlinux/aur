# Maintainer: Urs Wolfer <uwolfer @ fwo.ch>

pkgbase=intellij-idea-ultimate-edition
pkgname=(intellij-idea-ultimate-edition intellij-idea-ultimate-edition-jre)
pkgver=2017.2.1
_buildver=172.3544.35
pkgrel=1
arch=('any')
pkgdesc="An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity."
url="https://www.jetbrains.com/idea/"
license=('Commercial')
depends=('java-environment' 'giflib' 'libxtst')
options=(!strip)
source=(https://download.jetbrains.com/idea/ideaIU-$pkgver.tar.gz \
        intellijidea.sh \
        jetbrains-idea.desktop
)
sha256sums=('136674855d26fb7f07a914eecc7236b177ef8349c23aa7811b9670da43d62ae2'
            'ed7883b33b6fa9f2e303e5549bd238ceb552ec11ca116730271a58aca685229a'
            '83af2ba8f9f14275a6684e79d6d4bd9b48cd852c047dacfc81324588fa2ff92b')
package_intellij-idea-ultimate-edition() {
  backup=("usr/share/${pkgname}/bin/idea.vmoptions" "usr/share/${pkgname}/bin/idea64.vmoptions" "usr/share/${pkgname}/bin/idea.properties")
  cd "$srcdir"

  install -d -m755 "${pkgdir}"/usr/{bin,share}
  rsync -rtl "idea-IU-${_buildver}/" "${pkgdir}/usr/share/${pkgbase}" --exclude=/jre64

  # make sure that all files are owned by root
  chown -R root:root "${pkgdir}/usr/share"

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

package_intellij-idea-ultimate-edition-jre() {
  arch=('x86_64')
  install -d -m 755 "${pkgdir}/usr/share/${pkgbase}"
  rsync -rtl "${srcdir}/idea-IU-${_buildver}/jre64" "${pkgdir}/usr/share/${pkgbase}"
}

# vim:set ts=2 sw=2 et:
