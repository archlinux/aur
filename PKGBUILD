# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgname=phpstorm
_pkgname=PhpStorm
_pkgbuild=141.1912
pkgver=9.0
pkgrel=1
pkgdesc="Lightweight and Smart PHP IDE"
arch=('i686' 'x86_64')
options=(!strip)
url="http://www.jetbrains.com/phpstorm/"
license=('custom')
depends=('bash'
         'java-environment>=6' )
install='phpstorm.install'
source=("http://download.jetbrains.com/webide/PhpStorm-${pkgver}.tar.gz"
        "phpstorm.desktop"
        "phpstorm.sh"
        "phpstorm.install")
sha256sums=('f70ad7066327b8a4761ba7ecaa5cb6ba8624d4bb1514019c373a5bb06347d7d8'
            'e84e01936b4d1a3d909ca5f17122ccfdb071ad98cd908fd67714f784ddd05471'
            '76fb549efe568de294a1f403f0fbc292c9e3f1201e150e491a6e31c97ab9323e'
            '3dd0738870932c8bfafc6a47a4b2a65be5bebbaa07ce88708c750b3e51b97cb5')

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
