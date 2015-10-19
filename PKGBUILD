# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgname=phpstorm
_pkgname=PhpStorm
_pkgbuild=141.2462
pkgver=9.0.2
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
sha256sums=('75156763c11f90fcaaf9783e611b2995464495e16c8d4ce5f2d23c8664b479bb'
            'e51aa2558d8d92fff2b211cc6b1cc11bf10377d5b716e56f8497e2beef6b4a8b'
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
