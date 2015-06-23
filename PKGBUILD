# Maintainer: Nicolas Glassey <weby@we-bb.com>
pkgname=intellij-idea-15-ultimate-eap
pkgver=15.0.0
_buildver=142.2491.4
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
sha256sums=('e18df5aa71809836108d960ceca7236b04ae42026efb08a7fc5020a3484ed596'
            '7a5870094d47b7e34d9ecb24ab9fcf3103e7a9678479d376685582e6d3b960da'
            '1190729e96c0fd3bbdc8264f683c3fbf610cb993b312e9b4dfa74211913859bb'
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
