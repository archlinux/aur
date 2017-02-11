# Maintainer:  Michael Lass <bevan@bi-co.net>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: David Manouchehri <david@davidmanouchehri.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=eagle
pkgver=8.0.1
pkgrel=1
pkgdesc="Powerful suite for schematic capture and printed circuit board design (aka eaglecad)"
arch=('x86_64')
url="http://www.autodesk.com/products/eagle"
license=('custom')
depends=(
  'alsa-lib'
  'desktop-file-utils'
  'libselinux'
  'libxcomposite'
  'libxcursor'
  'libxrandr'
  'libxslt'
  'libxtst'
  'nss'
  'qt5-location'
  'qt5-webchannel'
  'shared-mime-info'
)
options=(!emptydirs !strip)
source=("http://trial2.autodesk.com/NET17SWDLD/2017/EGLPRM/ESD/Autodesk_EAGLE_8.0.1_English_Linux_64bit.tar.gz"
        "http://download.autodesk.com/us/FY17/Suites/LSA/en-US/lsa.html"
        "$pkgname.desktop"
        "$pkgname.xml")
sha256sums=('6527be010407a803ae799af5dfa19e9c0d12719260179e03679648569a448eb5'
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
  install -Dm644 "$pkgdir/opt/$pkgname/bin/eagleicon50.png" \
          "$pkgdir/usr/share/pixmaps/eagle.png"

  # install license
  install -Dm644 "$srcdir/lsa.html" \
     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # move man page
  mv "$pkgdir"/opt/$pkgname/doc/$pkgname.1 \
     "$pkgdir/usr/share/man/man1/$pkgname.1"

  # allow libQt5Network.so.5 to find the provided libssl.so
  ln -sf "/opt/$pkgname/lib/libssl.so.10" "$pkgdir/opt/$pkgname/lib/libssl.so"
}
