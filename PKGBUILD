# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Ianis Vasilev <ianis@ivasilev.net>

_pkgbase=droidcam
pkgname=$_pkgbase-dkms-git
_pkgver_base=2.1.2
_pkgver=v$_pkgver_base
pkgver=v2.1.2.r149.add5733
pkgrel=2
pkgdesc="A tool for using your android device as a wireless/usb webcam (DKMS)"
arch=('x86_64')
url="https://www.dev47apps.com/$_pkgbase/linux/"
license=('GPL2')
depends=('dkms' 'libappindicator-gtk3')
makedepends=('git')
conflicts=("${_pkgbase}" "${_pkgbase}-dkms")
source=("${pkgname}"::"git+https://github.com/dev47apps/$_pkgbase"
        "$_pkgbase-$pkgver.zip"::"https://files.dev47apps.net/linux/${_pkgbase}_${_pkgver_base}.zip"
        'dkms.conf'
        "$_pkgbase.desktop"
        'Makefile.dkms')
md5sums=('SKIP'
         'afe8fec08814d5212fddcbd7bb75bc9a'
         '3be4282edbff37ee6649c7c06c276003'
         '22b9912d96bc7691dfb6b7f82ec0306d'
         'c4417957cf66d4e647c7d140fbaa13cd')
sha512sums=('SKIP'
            '609098721aa97864417610aa5b92659ea5209a47c502a7feb8a39e70881d9f07c958d6f26a0b5dd951356602cf3d30f20db76067ba510fcdedb30bb1fe87b866'
            'd1af1b94193fa65f42ca7fdc3b81180d8f141e72ead6b80e13a103e817cbcaf1470cbb9f97e8eb6c2f3012f1f2c3d3bbc9887a10f3def8fb80f1c12c7e9184de'
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

  sed --in-place s/strlcpy/strscpy/g "$srcdir/$pkgname/v4l2loopback/v4l2loopback-dc.c"

  # Copy sources (including Makefile)
  install -Dm644 "$srcdir/Makefile.dkms" "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile
  install -Dm644 "$srcdir/${pkgname}/v4l2loopback/v4l2loopback-dc.c" "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/v4l2loopback-dc.c

  # Install droidcam program files
  install -Dm755 "$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"
  install -Dm755 "$_pkgbase-cli" "$pkgdir/usr/bin/$_pkgbase-cli"
  install -Dm644 "$srcdir/icon2.png" "$pkgdir/usr/share/pixmaps/$_pkgbase.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -Dm644 "$srcdir/$_pkgbase.desktop" "$pkgdir/usr/share/applications/$_pkgbase.desktop"
  # Set version on the desktop file
  sed -e "s/@PKGVER@/${pkgver}/" -i "$pkgdir/usr/share/applications/$_pkgbase.desktop"
}
