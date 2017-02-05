# Maintainer: Reto Kaiser <reto@retokaiser.com>

pkgname=intellij-idea-ue-bundled-jre
pkgver=2016.3.4
_buildver=163.12024.16
pkgrel=2
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
	'sysctl.conf'
)
sha256sums=('c34ee674836b56969c455aa268461f73149a5c9ca88d9359dad8435b5b9690c5'
            'fe26083eb313a977112f6571fb97ff369d48bbfabfde18c1339168662c666ca3'
	    '9351eb68fabd41788a0d517b32d517e1821afde2a35727ff322c450bab1697c9'
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

  # sysctl - see https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
  install -D -m644 "${srcdir}/sysctl.conf" "${pkgdir}/etc/sysctl.d/${pkgname}.conf"

  # workaround FS#40934
  sed -i 's|lcd|on|'  "$pkgdir"/usr/share/"$pkgname"/bin/*.vmoptions
}
