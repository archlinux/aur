# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgbase=rubymine-eap
pkgname=(rubymine-eap rubymine-eap-jre)
pkgver=261.22158.124
_pkgname=RubyMine
_pkgver=2026.1
pkgrel=1
pkgdesc="Ruby and Rails IDE with the full stack of essential developer tools (EAP)."
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/ruby/"
license=('custom')
depends=('desktop-file-utils' 'gtk-update-icon-cache')
optdepends=('ruby: Ruby run/debug support')
install=rubymine.install
source=(https://download.jetbrains.com/ruby/${_pkgname}-${pkgver}.tar.gz
        rubymine-eap.desktop
        rubymine.install)
sha512sums=('9c73b2db60b288d742fb9e1ff6bf77d86b66998dc8dead8ab0690ba6ad7c6c181242f11aa3fc35dbad203f86e728a0a8a889c1803ea868ba65869b25f2ac21c9'
            'e568e1aeb7541dc23fa7506f175df57ee1963de59bd64d0016de73ac1e2bb77c2a80542638d09ac972db7e034388c88cf850b3bfb09c759fce4844761f939c64'
            '38fb6b24a7d0e44deb8ae473bbbb4fa4a6c18544f12063dd6ff186be68a500ad50a6ce89c3765bc7d82da3f9735c17648b17c233911df696bc71a34b5ef40f8f')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  rm Install-Linux-tar.txt
  rm help/ReferenceCardForMac.pdf
}

package_rubymine-eap() {
  optdepends=('rubymine-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if rubymine-eap-jre is not installed')

  cd "${srcdir}"
  [ $CARCH == "x86_64" ] && SUFFIX=64

  install -d ${pkgdir}/{opt,usr/share}

  # Pre-packaged program files
  cp --recursive "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  # Desktop file
  install -Dm644 "${pkgdir}/opt/${pkgname}/bin/rubymine.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 "rubymine-eap.desktop" "${pkgdir}/usr/share/applications/rubymine-eap.desktop"
  install -d -m 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/rubymine" "${pkgdir}/usr/bin/${pkgname}"

  # License
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  find "$srcdir/$_pkgname-$pkgver/license/" -type f -exec \
    install -Dm644 '{}' "$pkgdir/usr/share/licenses/$pkgname/" \;

  # Java config
  sed -i 's/lcd/on/' "${pkgdir}/opt/$pkgname/bin/rubymine${SUFFIX}.vmoptions"
  echo "-Dswing.aatext=true" >> "${pkgdir}/opt/$pkgname/bin/rubymine${SUFFIX}.vmoptions"
}

package_rubymine-eap-jre() {
  pkgdesc="JBR (JetBrains Runtime) for RubyMine EAP - a patched JRE"
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}/${_pkgname}-${pkgver}/jbr" "${pkgdir}/opt/${pkgbase}"
}
