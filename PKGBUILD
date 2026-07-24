# Maintainer: Theo <teoulas@duck.com>

pkgname=ecosia-browser-bin
pkgver=150.1.7871.10
pkgrel=1
pkgdesc='Ecosia Browser (prebuilt binary)'
arch=('x86_64')
url='https://www.ecosia.org/browser'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libgcc'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'shared-mime-info'
  'systemd-libs'
  'ttf-font'
  'xdg-utils'
)
optdepends=(
  'gtk4: GTK 4 integration'
  'kdialog: native file dialogs under Plasma'
  'org.freedesktop.secrets: secure password storage'
  'pipewire: WebRTC desktop sharing under Wayland'
  'qt5-base: Qt 5 integration'
  'qt6-base: Qt 6 integration'
  'upower: Battery Status API support'
)
makedepends=('squashfs-tools')
provides=("ecosia-browser=${pkgver}")
conflicts=('ecosia-browser')
options=('!strip' '!debug')

_snap_id='2MakkUunZD1vJLykl5QmmVDQAZdE84wY'
_snap_revision=3
source_x86_64=(
  "${pkgname}-${pkgver}-${_snap_revision}.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snap_id}_${_snap_revision}.snap"
)
source=('ecosiabrowser.sh')
noextract=("${pkgname}-${pkgver}-${_snap_revision}.snap")
sha256sums=('43dd05c17af7504ed0267b8909e44e3aa1a03b1819415ab1559c143fc8a36efb')
sha256sums_x86_64=('81385d48b89fb869e9ebb0ad8d46a76c6860395a73e60804611cd20b748c4b75')

prepare() {
  rm -rf snap-root
  unsquashfs -q -d snap-root \
    "${pkgname}-${pkgver}-${_snap_revision}.snap" \
    opt/ecosia \
    usr/share/applications/org.ecosia.Browser.desktop \
    app/share/icons/hicolor/scalable/apps/org.ecosia.Browser.svg \
    app/share/metainfo/org.ecosia.Browser.metainfo.xml

  # The Snap desktop file points at the icon's path inside its confinement.
  sed -i 's|^Icon=/app/share/icons/hicolor/scalable/apps/org\.ecosia\.Browser\.svg$|Icon=org.ecosia.Browser|' \
    snap-root/usr/share/applications/org.ecosia.Browser.desktop
}

package() {
  install -d "${pkgdir}/opt"
  cp -a snap-root/opt/ecosia "${pkgdir}/opt/ecosia"

  install -Dm755 ecosiabrowser.sh "${pkgdir}/usr/bin/ecosiabrowser"
  install -Dm644 snap-root/usr/share/applications/org.ecosia.Browser.desktop \
    "${pkgdir}/usr/share/applications/org.ecosia.Browser.desktop"
  install -Dm644 snap-root/app/share/icons/hicolor/scalable/apps/org.ecosia.Browser.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.ecosia.Browser.svg"
  install -Dm644 snap-root/app/share/metainfo/org.ecosia.Browser.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/org.ecosia.Browser.metainfo.xml"
}
