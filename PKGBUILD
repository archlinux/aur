# Maintainer: Ash <xash at riseup d0t net>
pkgname=springro-launcher
pkgver=2.1
pkgrel=1
pkgdesc='SpringRO launcher for Ragnarok Online'
arch=('x86_64')
url='https://springro.com/'
license=('unknown')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsecret'
  'libsoup3'
  'webkit2gtk-4.1'
)
optdepends=('wine: run the Windows game client (alternatively, use Proton)')
provides=('springro')
conflicts=('springro')
source=(
  "springro-launcher-${pkgver}.deb::https://patches.springro.com/launcher/SpringRO_Linux_Launcher${pkgver}.deb"
  'springro.desktop'
)
noextract=("springro-launcher-${pkgver}.deb")
sha256sums=('14262865aaf5f4ec1c67d01345e09618db5249e4150ecfd4cabda468b5a8abe2'
            '08bc78a8138f54dfac48dd3ea0fc9850481b29d6069250244bb6e601692bc274')

prepare() {
  bsdtar -xf "${srcdir}/springro-launcher-${pkgver}.deb" -C "${srcdir}" data.tar.gz
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}"
}

package() {
  install -Dm755 "${srcdir}/usr/bin/launcher" "${pkgdir}/usr/lib/springro/launcher"
  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/springro/launcher "${pkgdir}/usr/bin/springro"

  install -Dm644 "${srcdir}/springro.desktop" \
    "${pkgdir}/usr/share/applications/springro.desktop"
  local size
  for size in 32x32 128x128 256x256@2; do
    install -Dm644 \
      "${srcdir}/usr/share/icons/hicolor/${size}/apps/launcher.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/springro.png"
  done
}
