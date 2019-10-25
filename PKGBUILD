# Maintainer: Marcel Huber <marcelhuberfoo@gmail.com>
# Maintainer: Felix Morgner <felix.morgner@gmail.com>
# Maintainer: Hansruedi Patzen <hp@revy.ch>

pkgname=cevelop
pkgver=1.13.0
_srctimestamp=201910070714
pkgrel=1
pkgdesc="The C++ IDE for professional developers"
license=('custom')
arch=('x86_64')
url='https://www.cevelop.com'
makedepends=(gendesk libarchive)
depends=('java-environment>=8' unzip "glibc>2.14" python)
optdepends=(hicolor-icon-theme boost)
provides=('cevelop')
install=${pkgname}.install
source=(cevelop.sh
        LICENSE
        https://github.com/Cevelop/cevelop.github.io/raw/master/img/logo-square-{16,32,48,256}.png
        https://github.com/Cevelop/cevelop.github.io/raw/master/img/logo-square.svg)
source_x86_64=(https://www.cevelop.com/cevelop/downloads/cevelop-${pkgver}-${_srctimestamp}-linux.gtk.x86_64.tar.gz)
sha256sums=('65b469797c38ca09bc16bcb940138091def2d30079fa09028b8756c1040c5c85'
            '578aea66235898a6f6d25420f5251b4df0e2a08be4302d9ab2a9e7e54359cb1b'
            'e88728544af4f6924784cb2885f3d86d4bd5cceb918f8fc552126b3f93288830'
            '7c31396b3facdf0a5ff57e2ee8a5ea0ff741955048e34116d4296ffa35e74218'
            '98ab055ecde507b6603743ab40db3dfdb6d6b3b24cb5fff244982ae641d865a0'
            'd99f2f3b58aef682fcab7d1cedf20fc4fc44152c6b964af49212a9e7f4d35def'
            'ebd2b54d0487de845093cabda98d5e0977f436fc10d40f15d2cb1598084222e4')
sha256sums_x86_64=('8f28f67cf7e91fac76ce3ae50bd621378bec1455a0a6b0ff84ee6f06a6333c7b')

prepare() {
  gendesk -n --pkgname "$pkgname" \
    --pkgdesc "Cevelop C++ IDE" --categories "Application;Development;IDE"
}

package() {
  cd $srcdir
  install -m755 -d $pkgdir/usr/{bin,share/applications,share/licences/,lib/$pkgname}
  install -m755 -d $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,256x256,scalable}/apps
  bsdtar cf - --cd $pkgname-$pkgver \
    --exclude ./icon.xpm \
    --exclude ./cevelop.desktop \
    --exclude ./cevelop.sh . | bsdtar xf - --cd $pkgdir/usr/lib/$pkgname/
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname-$pkgver/icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  # OpenJDK 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
  sed -i '/MaxPermSize/ d' "$pkgdir/usr/lib/$pkgname/cevelop.ini"
  for _i in 16 32 48 256; do
    install -Dm644 $srcdir/logo-square-${_i}.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/${pkgname}.png"
  done
  install -Dm644 $srcdir/logo-square.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ft=sh syn=sh ts=2 sw=2 et:
