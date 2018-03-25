# Maintainer:  Michael Lass <bevan@bi-co.net>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: David Manouchehri <david@davidmanouchehri.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=eagle
pkgver=8.7.1
pkgrel=1
pkgdesc="Powerful suite for schematic capture and printed circuit board design (aka eaglecad)"
arch=('x86_64')
url="http://www.autodesk.com/products/eagle"
license=('custom')
depends=('desktop-file-utils' 'shared-mime-info')
options=(!emptydirs !strip)
source=(# Official source from website
        # "http://trial2.autodesk.com/NET17SWDLD/2017/EGLPRM/ESD/Autodesk_EAGLE_${pkgver}_English_Linux_64bit.tar.gz"
        # Minor updates seem to be only distributed via circuits.io
        "https://eagle-updates.circuits.io/downloads/${pkgver//./_}/Autodesk_EAGLE_${pkgver}_English_Linux_64bit.tar.gz"
        "http://download.autodesk.com/us/FY17/Suites/LSA/en-US/lsa.html"
        "$pkgname.desktop"
        "$pkgname.xml")
sha256sums=('32616dcfa915f06818a9c3c98c7c28c663773a7748cb6c2598c35fe6f6c013ee'
            'eed1b33943b366f58480e7d57673e4278db215e9d3bdfcece937f3f74ea72cf9'
            '40e5a40cea787c0e823946271031744fdd9c755363da97d6dd4bea1eee7ee6b6'
            '293ef717030e171903ba555a5c698e581f056d2a33884868018ab2af96a94a06')

package() {
  cd "$srcdir"

  # copy files to /opt
  install -dm755 "$pkgdir"/{opt,usr/{bin,share/man/man1}}
  cp -a $pkgname-$pkgver "$pkgdir/opt/$pkgname"
  ln -sf "/opt/$pkgname/eagle" "$pkgdir/usr/bin/eagle"

  # provide desktop integration
  install -Dm644 "$pkgname.desktop" \
          "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.xml" \
          "$pkgdir/usr/share/mime/packages/$pkgname.xml"
  install -Dm644 "$pkgdir/opt/$pkgname/bin/eagle-logo.png" \
          "$pkgdir/usr/share/pixmaps/eagle.png"

  # install license
  install -Dm644 "$srcdir/lsa.html" \
     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # move man page
  mv "$pkgdir"/opt/$pkgname/doc/$pkgname.1 \
     "$pkgdir/usr/share/man/man1/$pkgname.1"

  # Fix permissions (necessary since 8.5.2)
  find "$pkgdir" -perm 750 -exec chmod 755 {} \;
  find "$pkgdir" -perm 700 -exec chmod 755 {} \;
  find "$pkgdir" -perm 640 -exec chmod 644 {} \;
  find "$pkgdir" -perm 600 -exec chmod 644 {} \;
}
