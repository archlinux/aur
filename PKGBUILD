# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=grappling_hook
pkgver=1.08
pkgrel=1
pkgdesc="first-person action/puzzle game"
arch=('i686' 'x86_64')
url="http://ghook.speedrungames.com/"
license=('freeware')
# this package *requires* jre8 (will not work with anything else)
depends=('jre8' 'openal' 'libxrandr' 'libxcursor')
source=("https://grapplinghook.de/download/GrapplingHook-1.0.8-linux.tar.gz"
	"grappling_hook.desktop"
        "icon.png")
md5sums=('72a9a4661cbe0ae83defbc3bef6ee337'
         'e2d162f2a7ddfe67ca4235fefca69860'
         '38915cdcf3fa0a188e4d02d13263789c')
options=(!strip)

package() {
  mkdir -p "${pkgdir}/usr/share/java/Grappling Hook" "${pkgdir}/usr/bin"
  cd "${srcdir}/Grappling Hook"
  tar cf - --exclude=.PKGINFO * | ( cd "${pkgdir}/usr/share/java/Grappling Hook"; tar xfp -)
  find "${pkgdir}/usr/share/java/Grappling Hook" -type f ! -name GrapplingHook.sh -exec chmod 644 '{}' \;
  find "${pkgdir}/usr/share/java/Grappling Hook" -type d -exec chmod 755 '{}' \;
  chmod 755 "${pkgdir}/usr/share/java/Grappling Hook/GrapplingHook.sh"
  sed -i 's%^java %/usr/lib/jvm/java-8-jre/jre/bin/java %' "${pkgdir}/usr/share/java/Grappling Hook/GrapplingHook.sh"
  install -Dm644 "${srcdir}/grappling_hook.desktop" $pkgdir/usr/share/applications/grappling_hook.desktop
  install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/grappling-hook.png"
  (echo "#!/bin/bash
  cd \"/usr/share/java/Grappling Hook\"
  ./GrapplingHook.sh \"\$@\"") > $pkgdir/usr/bin/grappling-hook
  chmod 755 "${pkgdir}/usr/bin/grappling-hook"
}
