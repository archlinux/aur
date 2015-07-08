# Maintainer: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgname=phpstorm
_pkgname=PhpStorm # Directory name in the tar file
_pkgbuild=139.1348
pkgver=8.0.3
pkgrel=1
pkgdesc="Lightweight and Smart PHP IDE."
arch=('i686' 'x86_64')
options=(!strip)
url="http://www.jetbrains.com/phpstorm/"
license=('custom')
depends=('java-environment>=6' 'bash')
install='phpstorm.install'
source=("http://download.jetbrains.com/webide/PhpStorm-${pkgver}.tar.gz"
        "phpstorm.desktop"
        "phpstorm.sh"
        "phpstorm.install")
sha256sums=('2b11ffe1a14a07d2616df0f84fce333bdcdd05b8b9417f3a1be92a3bb2b3c7f4'
            'e84e01936b4d1a3d909ca5f17122ccfdb071ad98cd908fd67714f784ddd05471'
            '76fb549efe568de294a1f403f0fbc292c9e3f1201e150e491a6e31c97ab9323e'
            'ea3b8898b7ee604b3dc9c83aefb47b35c129a0e5f7d1246569889dc7429d87a4')

package() {
  install -d -m 755 "${pkgdir}/usr/share"
  install -d -m 755 "${pkgdir}/usr/lib"
  cp -a "${srcdir}/${_pkgname}-${_pkgbuild}" "$pkgdir/usr/share/${pkgname}"

  [ $CARCH == "x86_64" ] && SUFFIX=64
  install -m 644 "${pkgdir}/usr/share/${pkgname}/bin/libyjpagent-linux${SUFFIX}.so" "${pkgdir}/usr/lib"

  # fixing FS#40934 here too
  sed -i 's/lcd/on/' "${pkgdir}/usr/share/phpstorm/bin/phpstorm${SUFFIX}.vmoptions"
  echo "-Dswing.aatext=true" >> "${pkgdir}/usr/share/phpstorm/bin/phpstorm${SUFFIX}.vmoptions"

  [ $CARCH == "x86_64" ] && SUFFIX="_64"
  install -m 644 "${pkgdir}/usr/share/${pkgname}/lib/libpty/linux/x86${SUFFIX}/libpty.so" "${pkgdir}/usr/lib"

  [ $CARCH == "i686" ] && SUFFIX=64 || SUFFIX=""
  rm "${pkgdir}/usr/share/${pkgname}/bin/"{fsnotifier${SUFFIX},phpstorm${SUFFIX}.vmoptions}

  rm -rf "${pkgdir}/usr/share/${pkgname}/bin/libyjpagent-linux*"
  rm -rf "${pkgdir}/usr/share/${pkgname}/plugins/terminal/lib/{linux,macosx,win}"

  sed -i 's/^M/\n/g' "${srcdir}/${_pkgname}-${_pkgbuild}/license/${_pkgname}_license.txt"
  echo >> "${srcdir}/${_pkgname}-${_pkgbuild}/license/${_pkgname}_license.txt"

  install -D -m 755 "${srcdir}/phpstorm.sh" "${pkgdir}/usr/bin/phpstorm.sh"
  install -D -m 644 "${srcdir}/phpstorm.desktop" "${pkgdir}/usr/share/applications/phpstorm.desktop"
  install -D -m 644 "${pkgdir}/usr/share/${pkgname}/bin/webide.png" "${pkgdir}/usr/share/pixmaps/phpstorm.png"
  install -D -m 644 "${srcdir}/${_pkgname}-${_pkgbuild}/license/${_pkgname}_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
