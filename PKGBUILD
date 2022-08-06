# Maintainer: Johannes Graën <johannes SPIRALGALAXY selfnet FULLSTOP de>

pkgname=jabref-latest
pkgver=20220805
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java; latest main (master) version from git"
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
source=(Jabref-${pkgver}.tgz::https://builds.jabref.org/main/JabRef-5.8-portable_linux.tar.gz
        https://raw.githubusercontent.com/JabRef/jabref/main/LICENSE.md
        jabref.sh
        JabRef.desktop
        JabRef.svg)
sha256sums=('SKIP'
            '4cee727d46de1fe49a7e89e18584e87c031826517582923a1c4d93ae1e5138f6'
            '857807c9240181f5d7e783898e94e523beaba8b6b55617931141cbffba41c70d'
            '81a9ce53092525d1ba964435a0558654441a85e818581453a50df1045017c131'
            '84408ddc8c6e41e4367f3b6cd171909fb1cf7ac808495f3a8033b64a2ff4c40b')


pkgver() {
  curl --silent --head https://builds.jabref.org/main/JabRef-5.8-portable_linux.tar.gz \
    | grep -i "last-modified" | cut -d' ' -f2- | date -f - +%Y%m%d
}

package() {
  cd ${srcdir}
  mv JabRef jabref
  #find JabRef/ -name 'org.jabref.jabref.json' -exec sed -i 's@/opt/jabref/lib/@/opt/JabRef/lib/@' {} \;
  #install -Dm755 JabRef/bin/JabRef ${pkgdir}/opt/JabRef/bin/JabRef
  #find JabRef/lib -type f -exec install -Dm644 "{}" "${pkgdir}/opt/{}" \;
  #chmod +x ${pkgdir}/opt/JabRef/lib/runtime/bin/*
  #chmod +x ${pkgdir}/opt/JabRef/lib/runtime/lib/jexec
  #chmod +x ${pkgdir}/opt/JabRef/lib/runtime/lib/jspawnhelper
  #chmod +x ${pkgdir}/opt/JabRef/lib/jabrefHost.py
  install -Dm755 jabref/bin/JabRef ${pkgdir}/opt/jabref/bin/JabRef
  find jabref/lib -type f -exec install -Dm644 "{}" "${pkgdir}/opt/{}" \;
  chmod +x ${pkgdir}/opt/jabref/lib/runtime/bin/*
  chmod +x ${pkgdir}/opt/jabref/lib/runtime/lib/jexec
  chmod +x ${pkgdir}/opt/jabref/lib/runtime/lib/jspawnhelper
  chmod +x ${pkgdir}/opt/jabref/lib/jabrefHost.py
  #mv ${pkgdir}/JabRef ${pkgdir}/jabref
  install -Dm755 jabref.sh ${pkgdir}/usr/bin/jabref
  install -Dm755 JabRef.svg ${pkgdir}/usr/share/pixmaps/JabRef.svg
  install -Dm644 JabRef.desktop ${pkgdir}/usr/share/applications/JabRef.desktop
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}

