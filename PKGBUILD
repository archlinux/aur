# Maintainer: Nicolas Glassey <weby@we-bb.com>
pkgname=intellij-idea-15-ultimate-eap
pkgver=15.0.1
_buildver=142.3553.1
pkgrel=1
pkgdesc='An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity.'
arch=('i686' 'x86_64') # not 'any' because of fsnotifier
url="http://www.jetbrains.com/idea/"
backup=("usr/share/${pkgname}/bin/idea.vmoptions" "usr/share/${pkgname}/bin/idea64.vmoptions")
license=('Commercial')
depends=('java-environment' 'giflib')
options=(!strip)
source=("http://download.jetbrains.com/idea/ideaIU-${_buildver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "LICENSE.txt")
sha256sums=('b72f37ce4b3058bf2fb470db2921970313246cae07716bd7e9801eb00c86f5bf'
            '7b43aa8ff84d13e226167ccf462050d2e8cc2b038cd80737e431987fda3b4782'
            '975df5b4b635a9c6fa06c4bca6d6a99383bec898321559e690d15d3b080c4706'
            '1e7c6a508b99d65cc8e3e1cb314bda0140ec124cb9ec187b597604e4d87fe042')

package() {
  cd "${srcdir}"

  install -d -m755 $pkgdir/usr/{bin,share}
  cp -a "idea-IU-${_buildver}" "${pkgdir}/usr/share/${pkgname}"
  chown -R root:root "${pkgdir}/usr/share"

  find $pkgdir/usr/share/$pkgname -type d -exec chmod 0755 {} ';'
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 0644 {} ';'

  # never wait on user input when starting idea; copied from -ce PKGBUILD
  sed -i '/.*read IGNORE.*/ d' "${pkgdir}"/usr/share/$pkgname/bin/idea.sh

  chmod +x $pkgdir/usr/share/$pkgname/bin/idea.sh
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier64

  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "$srcdir/idea-IU-$_buildver/bin/idea.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/license/$pkgname/LICENSE.txt"

  # workaround FS#40934
  sed -i 's|lcd|on|'  "$pkgdir"/usr/share/$pkgname/bin/*.vmoptions
}

# vim:set ts=2 sw=2 et:
