# Maintainer: Johannes Graën <johannes SPIRALGALAXY selfnet FULLSTOP de>

pkgname=jabref-latest
pkgver=20200319
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java; latest master version from git"
arch=('x86_64')
url="https://www.jabref.org/"
license=('MIT')
provides=('jabref')
conflicts=('jabref')
depends=('glibc'
         'freetype2'
	 'libxtst'
	 'libnet'
	 'libxrender'
	 'alsa-lib'
         'python3')
optdepends=('gsettings-desktop-schemas: For web search support')
source=(Jabref-${pkgver}.tgz::https://builds.jabref.org/master/JabRef-5.1-portable_linux.tar.gz
        https://raw.githubusercontent.com/JabRef/jabref/master/LICENSE.md
        jabref.sh
        JabRef.desktop
        JabRef.svg)
sha256sums=('SKIP'
            '057113b2e1e3eaeffdbbfbc57febca6e02c53cb63b14ffc9e1fbacf6ddc17638'
            '9311fb9ed26f65be4040b6add5f195ffff22c857d5f85bd471375633e44bfe04'
            '183a112c959a3a1b8c1db3522aa52cd20487c7849985318cff1dc1b502718f26'
            '84408ddc8c6e41e4367f3b6cd171909fb1cf7ac808495f3a8033b64a2ff4c40b')


pkgver() {
  curl --silent --head https://builds.jabref.org/master/JabRef-5.1-portable_linux.tar.gz \
    | grep -i "last-modified" | cut -d' ' -f2- | date -f - +%Y%m%d
}

package() {
  cd ${srcdir}
  find JabRef/ -name 'org.jabref.jabref.json' -exec sed -i 's@/opt/jabref/lib/@/opt/JabRef/lib/@' {} \;
  install -Dm755 JabRef/bin/JabRef ${pkgdir}/opt/JabRef/bin/JabRef
  find JabRef/lib -type f -exec install -Dm644 "{}" "${pkgdir}/opt/{}" \;
  chmod +x ${pkgdir}/opt/JabRef/lib/runtime/bin/*
  chmod +x ${pkgdir}/opt/JabRef/lib/runtime/lib/jexec
  chmod +x ${pkgdir}/opt/JabRef/lib/runtime/lib/jspawnhelper
  chmod +x ${pkgdir}/opt/JabRef/lib/jabrefHost.py
  install -Dm755 jabref.sh ${pkgdir}/usr/bin/jabref
  install -Dm755 JabRef.svg ${pkgdir}/usr/share/pixmaps/JabRef.svg
  install -Dm644 JabRef.desktop ${pkgdir}/usr/share/applications/JabRef.desktop
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}

