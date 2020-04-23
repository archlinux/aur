# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org

_pkgbase=droidcam
pkgname=droidcam-dkms-git
_pkgver=6.7.6
pkgver=6.7.6.r36.fee087c
pkgrel=1
pkgdesc="A tool for using your android device as a wireless/usb webcam (DKMS)"
arch=('x86_64')
url="https://www.dev47apps.com/$_pkgbase/linuxx"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}" "${_pkgbase}-dkms")
#install=${pkgname}.install
source=("${pkgname}"::"git+https://github.com/aramg/droidcam"
        "$_pkgbase-$pkgver.zip"::"https://www.dev47apps.com/files/linux/droidcam_latest.zip"
        'dkms.conf'
        "https://github.com/aramg/$_pkgbase/raw/master/linux/icon2.png"
        "$_pkgbase.desktop"
        "Makefile.dkms")
md5sums=('SKIP'
         '7775e36b5325dc1f32d485eb3cc72fd1'
         '3be4282edbff37ee6649c7c06c276003'
         '0f0e1d04146dd5be70d5028f144bd0a2'
         '22b9912d96bc7691dfb6b7f82ec0306d'
         'c4417957cf66d4e647c7d140fbaa13cd')
sha512sums=('SKIP'
            '824c14542d368a262cf8eb011f52a0fd205f2ad5eaadc226307a322b6725e6fd1544ad9e473b136719fd55980afce28d584328a635b104c8b08c3c2cfca3f6b8'
            'd1af1b94193fa65f42ca7fdc3b81180d8f141e72ead6b80e13a103e817cbcaf1470cbb9f97e8eb6c2f3012f1f2c3d3bbc9887a10f3def8fb80f1c12c7e9184de'
            '4cedbc823498a1ff70f6df1d312f29fa609c1316d15bbc8a23c5aa5055b87cb2d156e6da12aefa0195e1adbe65b94e6a79ae799083f9da4a959c21796280c491'
            '38e7e987e71696a209dde7cafe03e0910606d0dfd45aa1829910cbc40a336464bc8299c4fef0a32f0f74914537704f242331f8dae55cdf1884291866ea8a1e4c'
            '0113f278628aeb1688618a172c9e3494ac360701aaf685ab428da7f04e034150f99f6b8307e8f9c12aa0425ad4a2c9714ccff7cea80dd0155a1deaaf1c2e412a')

pkgver() {
  cd "$pkgname"
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  install -Dm644 "$srcdir/Makefile.dkms" "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile
  install -Dm644 "$srcdir/${pkgname}/linux/v4l2loopback/v4l2loopback-dc.c" "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/v4l2loopback-dc.c

  # Install droidcam program files
  install -Dm755 "$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"
  install -Dm755 "$_pkgbase-cli" "$pkgdir/usr/bin/$_pkgbase-cli"
  install -Dm644 "$srcdir/icon2.png" "$pkgdir/usr/share/pixmaps/$_pkgbase.png"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -Dm644 "$srcdir/$_pkgbase.desktop" "$pkgdir/usr/share/applications/$_pkgbase.desktop"
  # Set version on the desktop file
  sed -e "s/@PKGVER@/${pkgver}/" -i "$pkgdir/usr/share/applications/$_pkgbase.desktop"
}
