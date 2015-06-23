# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
pkgname=intellij-idea-14-ultimate
pkgver=14.1.4
_buildver=141.1532.4
pkgrel=1
pkgdesc='An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity.'
arch=('i686' 'x86_64') # not 'any' because of fsnotifier
url="http://www.jetbrains.com/idea/"
backup=("usr/share/${pkgname}/bin/idea.vmoptions" "usr/share/${pkgname}/bin/idea64.vmoptions")
license=('Commercial')
depends=('java-environment' 'giflib')
options=(!strip)
source=("http://download.jetbrains.com/idea/ideaIU-${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('5c6dfb5ba9f2c3294ee125e96e96e50287a460784287181a8e83e4326005bac3'
            'c6016019b11a2101ced4d8d0c557fff93d8f6d925219cb40d9d56af1d16968fb'
            'f93bc88bfde1a1488b6f906362cb3835a02bde735b7aa24940f8ca12086badf8')

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
  install -D -m644 "$srcdir/idea-IU-$_buildver/license/IDEA_license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  # workaround FS#40934
  sed -i 's|lcd|on|'  "$pkgdir"/usr/share/$pkgname/bin/*.vmoptions
}

# vim:set ts=2 sw=2 et:
