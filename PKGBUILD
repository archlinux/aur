# Maintainer: Takase <takase1121 at proton dot me>
# Contributor: Koolaid <hasoy678 at gmail dot com>
# Based on metrolist-desktop-bin (https://aur.archlinux.org/packages/metrolist-desktop-bin)


pkgname=metrolist-desktop-nightly-bin
pkgver=20261125.r1076.gfc27b78
pkgrel=1
pkgdesc="YouTube Music client for desktop (Nightly)"
arch=('x86_64')
url="https://github.com/MetrolistGroup/Metrolist"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'bash'
  'freetype2'
  'glibc'
  'hicolor-icon-theme'
  'libx11'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'zlib-ng-compat'
)
optdepends=(
  'gtk3: YouTube login'
  'webkit2gtk-4.1: YouTube login'
)
options=('!strip' '!debug')
_appimage="${pkgname}-${pkgver}.AppImage"
noextract=("${_appimage}")
source=(
  "${_appimage}::${url}/releases/download/nightly/metrolist-desktop-linux-x64.AppImage"
  'metrolist-nightly'
  'LICENSE'
)
sha256sums=('f03c0b920281d0e63e50bb04717933023e394e162135f85d130f1542fe5e7827'
            'e2f611b2a3ea170c12d38e42016e2abb0d2212e62c3946615a50aad6c97643bd'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')


prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract

  sed -i \
    -e 's/^Name=.*/Name=Metrolist (nightly)/' \
    -e 's/^Exec=.*/Exec=metrolist-nightly %u/' \
    -e 's/^Icon=.*/Icon=metrolist-nightly/' \
    squashfs-root/Metrolist.desktop

  chmod -R u+rwX,go+rX squashfs-root
  rm -f squashfs-root/{AppRun,.DirIcon,resources}
}

package() {
  install -dm755 "$pkgdir/opt/${pkgname}"
  cp -a squashfs-root/bin squashfs-root/lib "$pkgdir/opt/${pkgname}/"
  install -Dm755 "$srcdir/metrolist-nightly" \
    "$pkgdir/usr/bin/metrolist-nightly"
  install -Dm644 squashfs-root/Metrolist.desktop \
    "$pkgdir/usr/share/applications/metrolist-nightly.desktop"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 squashfs-root/Metrolist.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/metrolist-nightly.png"
}
