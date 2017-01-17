# Maintainer: Reto Kaiser <reto@retokaiser.com>

pkgname=intellij-idea-ue-bundled-jre
pkgver=2016.3.3
_buildver=163.11103.6
pkgrel=1
pkgdesc="Jetbrains IDE for Java and other programming languages. This packages contains a bundled JRE."
arch=('i686' 'x86_64')
url="https://www.jetbrains.com/idea/"
backup=("usr/share/${pkgname}/bin/idea.vmoptions" "usr/share/${pkgname}/bin/idea64.vmoptions" "usr/share/${pkgname}/bin/idea.properties")
license=('Commercial')
depends=('giflib' 'libxtst')
conflicts=('intellij-idea-ultimate-edition')
options=(!strip)
source=("https://download.jetbrains.com/idea/ideaIU-$pkgver.tar.gz"
        'jetbrains-idea.desktop'
)
sha256sums=('95871c9a8aed1bd8992ff493fbc5fc31674b18ef3cd509eb8f2e5650b3419eaf'
            'fe26083eb313a977112f6571fb97ff369d48bbfabfde18c1339168662c666ca3'
)
package() {
  cd "$srcdir"

  install -d -m755 "$pkgdir"/usr/{bin,share}
  cp -a "idea-IU-$_buildver" "$pkgdir"/usr/share/"$pkgname"

  # make sure that all files are owned by root
  chown -R root:root "$pkgdir"/usr/share

  # create binary and desktop entry
  ln -s /usr/share/"$pkgname"/bin/idea.sh "$pkgdir"/usr/bin/"$pkgname"
  install -D -m644 "$srcdir"/jetbrains-idea.desktop "$pkgdir"/usr/share/applications/jetbrains-idea.desktop
  install -D -m644 "$srcdir"/idea-IU-$_buildver/bin/idea.png "$pkgdir"/usr/share/pixmaps/"$pkgname".png

  # workaround FS#40934
  sed -i 's|lcd|on|'  "$pkgdir"/usr/share/"$pkgname"/bin/*.vmoptions
}
