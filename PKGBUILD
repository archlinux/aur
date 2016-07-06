# Maintainer: Marcel Huber <marcelhuberfoo@gmail.com>

pkgname=cevelop
pkgver=1.5.0
_srctimestamp=201607061232
pkgrel=1
pkgdesc="The C++ IDE for professional developers"
license=('custom')
arch=('i686' 'x86_64')
url='https://www.cevelop.com'
makedepends=(gendesk libarchive)
depends=(java-environment webkitgtk2 unzip "glibc>2.14" python)
optdepends=(hicolor-icon-theme boost)
provides=('cevelop')
install=${pkgname}.install
source=(cevelop.sh
        LICENSE
        https://github.com/Cevelop/cevelop.github.io/raw/master/img/logo-square-{16,32,48,256}.png
        https://github.com/Cevelop/cevelop.github.io/raw/master/img/logo-square.svg)
source_i686=(https://www.cevelop.com/cevelop/downloads/cevelop-${pkgver}-${_srctimestamp}-linux.gtk.x86.tar.gz)
source_x86_64=(https://www.cevelop.com/cevelop/downloads/cevelop-${pkgver}-${_srctimestamp}-linux.gtk.x86_64.tar.gz)
sha256sums=('cedcc248a90de4b96277ffc788371db2f2090d9a6c285db3b14e3d6a27f5cb30'
            '578aea66235898a6f6d25420f5251b4df0e2a08be4302d9ab2a9e7e54359cb1b'
            'e88728544af4f6924784cb2885f3d86d4bd5cceb918f8fc552126b3f93288830'
            '7c31396b3facdf0a5ff57e2ee8a5ea0ff741955048e34116d4296ffa35e74218'
            '98ab055ecde507b6603743ab40db3dfdb6d6b3b24cb5fff244982ae641d865a0'
            'd99f2f3b58aef682fcab7d1cedf20fc4fc44152c6b964af49212a9e7f4d35def'
            'ebd2b54d0487de845093cabda98d5e0977f436fc10d40f15d2cb1598084222e4')
sha256sums_i686=('afae5510377d00c916dea0a32a1faf0549d615142a583cf8c9f41159cc5a10ac')
sha256sums_x86_64=('bcc57bc59988d6b159b43fee25559dbb484cb0ac04aa15fd8faa0f9e4feade6c')

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
  for _i in 16 32 48 256; do
    install -Dm644 $srcdir/logo-square-${_i}.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/${pkgname}.png"
  done
  install -Dm644 $srcdir/logo-square.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ft=sh syn=sh ts=2 sw=2 et:
