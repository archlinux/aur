# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org

_pkgbase=droidcam
pkgname=droidcam-dkms
pkgver=6.7.5
pkgrel=1
pkgdesc="A tool for using your android device as a wireless/usb webcam (DKMS)"
arch=('x86_64')
url="https://www.dev47apps.com/$_pkgbase/linuxx"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
#install=${pkgname}.install
source=("$_pkgbase-$pkgver.tar.bz2"::"https://www.dev47apps.com/files/600/$_pkgbase-64bit.tar.bz2"
        'dkms.conf'
        "https://github.com/aramg/$_pkgbase/raw/master/linux/icon2.png"
        "$_pkgbase.desktop")
md5sums=('9507c0b738f427c5f1dde7b2a364fdfb'
         '1f89c9d503c57409ddb09b2cc2684916'
         '0f0e1d04146dd5be70d5028f144bd0a2'
         '22b9912d96bc7691dfb6b7f82ec0306d')
sha512sums=('db565963116be84b23d48810d6aa44e4d4216ea19c2607b14786a4e5b3c3a100e6a00bf313a137a078d85d1dc7944efbbdb30e1af04b8d8f6dda8bb0ecec25f7'
            '02fbbb5d5e17c28f84adaf00e24686b2fc293f732df30dc166ae916ec5906353a28104d8f5ed52253a9d76f1504520618cc2d47721eaf284dd84353edd077dad'
            '4cedbc823498a1ff70f6df1d312f29fa609c1316d15bbc8a23c5aa5055b87cb2d156e6da12aefa0195e1adbe65b94e6a79ae799083f9da4a959c21796280c491'
            '38e7e987e71696a209dde7cafe03e0910606d0dfd45aa1829910cbc40a336464bc8299c4fef0a32f0f74914537704f242331f8dae55cdf1884291866ea8a1e4c')

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}-64bit/v4l2loopback/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  cd ${_pkgbase}-64bit
  # Install droidcam program files
  install -Dm755 "$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"
  install -Dm755 "$_pkgbase-cli" "$pkgdir/usr/bin/$_pkgbase-cli"
  install -Dm644 "$srcdir/icon2.png" "$pkgdir/usr/share/pixmaps/$_pkgbase.png"
  install -Dm644 README "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -Dm644 "$srcdir/$_pkgbase.desktop" "$pkgdir/usr/share/applications/$_pkgbase.desktop"
  # Set version on the desktop file
  sed -e "s/@PKGVER@/${pkgver}/" -i "$pkgdir/usr/share/applications/$_pkgbase.desktop"
}
