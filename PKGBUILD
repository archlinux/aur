# Maintainer: ensky0 <ensky0 at gmail dot com>
pkgname=tildaz-bin
_pkgname=tildaz
pkgver=0.10.10
pkgrel=1
pkgdesc='Quake-style drop-down terminal for Wayland, built on libghostty-vt'
arch=('x86_64' 'aarch64')
url='https://github.com/ensky0/tildaz'
license=('AGPL-3.0-or-later')
depends=('glibc' 'libxkbcommon' 'freetype2' 'fontconfig')
optdepends=('harfbuzz: ligature rendering'
            'dbus: KDE Plasma global hotkey (KGlobalAccel)'
            'glib2: GNOME / Cinnamon Shell extension settings'
            'libglvnd: GPU rendering (EGL / GLES)'
            'mesa: GPU rendering (GBM buffers)')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('a89a1d84060e9cd69ec2126ad9b4242c7dc5a5fb526113b203656d1c9e00e5c5')
sha256sums_aarch64=('aaae362edf22a084161c508698e616bfc47517a753b90f7453894519b4b80823')

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}-linux-${CARCH}"

  install -Dm755 tildaz "${pkgdir}/usr/bin/tildaz"

  # The tarball ships a template; fill it the same way the official packages do.
  sed -e 's|__TILDAZ_EXE__|/usr/bin/tildaz|g' \
      -e 's|__TILDAZ_NAME__|TildaZ|g' \
      -e 's|__TILDAZ_ICON__|tildaz|g' \
      -e 's|__TILDAZ_WMCLASS__|tildaz|g' \
      tildaz.desktop > tildaz.desktop.out
  install -Dm644 tildaz.desktop.out "${pkgdir}/usr/share/applications/tildaz.desktop"
  install -Dm644 tildaz.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tildaz.svg"

  install -d "${pkgdir}/usr/share/tildaz"
  cp -R gnome-extension cinnamon-extension "${pkgdir}/usr/share/tildaz/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 THIRD-PARTY-NOTICES.md "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.md"
}
