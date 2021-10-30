# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=charge-guru
pkgver=r8.38563a9
pkgrel=1
pkgdesc="Application to control SkyRC B6* chargers"
arch=('x86_64')
url="https://github.com/maciek134/charge-guru"
license=('GPL3')
depends=('qt5-base' 'qt5-charts')
makedepends=('git' 'cmake' 'libb6' 'gendesk')
optdepends=('adwaita-icon-theme: battery icon')
source=("git+https://github.com/maciek134/charge-guru.git#commit=38563a9" "CMakeLists.patch")
sha256sums=('SKIP'
            '54f8609c7d6a187845e83f85edf8dc4e38f8bb832cba2402ddb65580d0e3ac1b')

prepare () {

  cd "$srcdir/$pkgname"
  patch -i "${srcdir}/CMakeLists.patch"

}

pkgver() {

  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

 cd "$srcdir/$pkgname"
 cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release
 make

}

package() {
  
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/$pkgname/ChargeGuru" "$pkgdir/usr/bin/$pkgname"

  mkdir -p "$pkgdir/usr/lib/udev/rules.d"
  echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0000", ATTRS{idProduct}=="0001", MODE:="666"' > "$pkgdir/usr/lib/udev/rules.d/65-$pkgname.rules"
  echo 'KERNEL=="hidraw*", ATTRS{idVendor}=="0000", ATTRS{idProduct}=="0001", MODE="0666"' >> "$pkgdir/usr/lib/udev/rules.d/65-$pkgname.rules"

  gendesk -n -f \
          --pkgname="${pkgname}" \
          --pkgdesc="${pkgdesc}" \
          --name="ChargeGuru" \
          --categories="Utility" \
          --startupnotify=true \
          --icon=battery \
          --comment="$pkgdesc"

  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
}
