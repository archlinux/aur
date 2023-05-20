# Maintainer: Jeancarlo Hidalgo <jeancahu at gmail dot com>
# Contributor: hydrasho <first name [at] last name [dot] net>
# Contributor: GoliathLabs <first name [at] last name [dot] net>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=albion-online-launcher-bin
pkgver=1.0.34.447
pkgrel=1
epoch=1
pkgdesc="The first true cross-platform Sandbox MMO -- launcher client"
url="https://albiononline.com/"
arch=('x86_64')
license=('custom')
groups=('albion')
depends=(
  'libgl'
  'alsa-lib'
  'libxcb'
  'libxkbcommon'
  'sdl2'
  'qt5-webengine'
  'xdelta3'
  'zenity'
)
makedepends=(chrpath)
#checkdepends=()
#optdepends=()
source=($pkgname-$pkgver::"https://live.albiononline.com/clients/20230517102844/albion-online-setup"
  "albion-online-launcher.desktop" "albion-online" "Albion-Online.patch")
install=albion-online-launcher-bin.install
options=(!strip docs libtool emptydirs !zipman staticlibs)
sha256sums=('189c8cd53d2fcd91e91f76cbc9e56a6c9516322f9bc30e1527a2e62969243b08'
            '8522ec18f3eba72aefc88c945263bad1b66b8c59d0e0c70c52bc737cff129853'
            'dc8abe731ac9a189a1265fccc13f40f80efd467559dcc03c0dcff8e4ae2bac60'
            '997b87a699a831c37a335f06384cc189787deefd1ee5245381c7c99fbadfc510')

prepare() {
  chrpath -d "${srcdir}/data/launcher/Albion-Online"

  pushd "${srcdir}/data/launcher"
  rm libQt5* qt.conf xdelta3 QtWebEngineProcess libicu* \
     libSDL2-2.0.so.0 libSDL2-2.0.so \
     libcrypto.so libssl.so libxkbcommon* libxcb*

  rm -r resources plugins translations
  chmod 775 ./*
  chmod 664 version.txt
  popd

  pushd "${srcdir}/data"
  patch Albion-Online < "${srcdir}/Albion-Online.patch"
  popd
}

package() {
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/data" "${pkgdir}/opt/${pkgname}"
  chmod 755 "$pkgdir/opt/${pkgname}"

  mkdir -p "${pkgdir}/opt/${pkgname}/game_x64"
  chmod 2775 "${pkgdir}/opt/${pkgname}/game_x64"

  ## Give albion group permission to update the launcher
  chmod 2775 "${pkgdir}/opt/${pkgname}/launcher"

  # Link launcher to usr/system binaries directory
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 -D "${srcdir}/albion-online" "${pkgdir}/usr/bin"

  # Install .desktop file
  install -m755 -D "${srcdir}/albion-online-launcher.desktop" -t "${pkgdir}/usr/share/applications"

  # Move EULA to /usr/share licenses path
  install -Dm644 "${srcdir}/data/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
