# Maintainer:  Michael Lass <bevan@bi-co.net>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: David Manouchehri <david@davidmanouchehri.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=eagle
pkgver=9.6.2
pkgrel=2
pkgdesc="Powerful suite for schematic capture and printed circuit board design (aka eaglecad)"
arch=('x86_64')
url="http://www.autodesk.com/products/eagle"
license=('custom')
depends=('desktop-file-utils' 'shared-mime-info' 'krb5' 'libxcb' 'libx11' 'e2fsprogs' 'libglvnd' 'libxext' 'fontconfig' 'libxi' 'freetype2' 'pcre' 'libcups' 'dbus')
options=(!emptydirs !strip)
source=(# Official source according to website:
        # "http://trial2.autodesk.com/NET17SWDLD/2017/EGLPRM/ESD/Autodesk_EAGLE_${pkgver}_English_Linux_64bit.tar.gz"
        # Currently, versions are only distributed via circuits.io:
        # https://eagle-updates.circuits.io/downloads/latest.html
        "https://eagle-updates.circuits.io/downloads/${pkgver//./_}/Autodesk_EAGLE_${pkgver}_English_Linux_64bit.tar.gz"
        lsa19.html::"http://download.autodesk.com/us/FY19/Suites/LSA/en-US/lsa.html"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname.xml")
sha256sums=('0086b3fddcd9eaeead0f30f814b868a9e0ef75fbdf6185ec3448d0a9edf35ea3'
            'd8f8adf45c8c136030f877975aed22ec97c6e26f6aa2218905c7b14b51bc1334'
            '3ad7f6657842a7733289f46cafa877e069913a2deb63b268162def97aa3a4079'
            '40e5a40cea787c0e823946271031744fdd9c755363da97d6dd4bea1eee7ee6b6'
            '293ef717030e171903ba555a5c698e581f056d2a33884868018ab2af96a94a06')

package() {
  cd "$srcdir"

  # copy files to /opt
  install -dm755 "$pkgdir"/{opt,usr/bin}
  cp -r $pkgname-$pkgver "$pkgdir/opt/$pkgname"

  # install launch script
  install -Dm 755 "$pkgname.sh" \
          "$pkgdir/usr/bin/$pkgname"

  # provide desktop integration
  install -Dm644 "$pkgname.desktop" \
          "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.xml" \
          "$pkgdir/usr/share/mime/packages/$pkgname.xml"
  install -Dm644 "$pkgdir/opt/$pkgname/bin/eagle-logo.png" \
          "$pkgdir/usr/share/pixmaps/eagle.png"

  # install license
  install -Dm644 "$srcdir/lsa19.html" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # copy man page
  install -Dm644 "$pkgdir"/opt/$pkgname/doc/$pkgname.1 \
                 "$pkgdir/usr/share/man/man1/$pkgname.1"

  # Remove provided X libraries. They cause issues with current mesa and the system libraries seem to work fine.
  rm "$pkgdir"/opt/$pkgname/lib/libx*
  rm "$pkgdir"/opt/$pkgname/lib/libX*

  # Remove libglapi which seems to cause segfaults on some systems.
  rm "$pkgdir"/opt/$pkgname/lib/libglapi*

  # Remove remaining libraries that are provided by Arch packages and not Qt-related.
  rm "$pkgdir"/opt/$pkgname/lib/libEGL*
  rm "$pkgdir"/opt/$pkgname/lib/libavahi*
  rm "$pkgdir"/opt/$pkgname/lib/libdbus*
  rm "$pkgdir"/opt/$pkgname/lib/libfreebl*
  rm "$pkgdir"/opt/$pkgname/lib/libgbm*
  rm "$pkgdir"/opt/$pkgname/lib/libgmodule*
  rm "$pkgdir"/opt/$pkgname/lib/libgthread*
  rm "$pkgdir"/opt/$pkgname/lib/libkrb5*
  rm "$pkgdir"/opt/$pkgname/lib/libpcre*
  rm "$pkgdir"/opt/$pkgname/lib/libpl*
  rm "$pkgdir"/opt/$pkgname/lib/libsmime*

  # We cannot use Arch's Qt5 due to the following errors:
  #  QXcbIntegration: Cannot create platform OpenGL context, neither GLX nor EGL are enabled
  #  /opt/eagle/eagle: symbol lookup error: /opt/eagle/plugins/bearer/libqconnmanbearer.so: undefined symbol: _ZdlPvm, version Qt_5
  # rm "$pkgdir"/opt/$pkgname/lib/libQt*

  # Fix file permissions
  find "$pkgdir" -perm 750 -exec chmod 755 {} \;
  find "$pkgdir" -perm 700 -exec chmod 755 {} \;
  find "$pkgdir" -perm 640 -exec chmod 644 {} \;
  find "$pkgdir" -perm 600 -exec chmod 644 {} \;
  chmod 755 "$pkgdir"/opt/eagle/lib/libSuits.so

}
