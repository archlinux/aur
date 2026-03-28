# Maintainer: zmr233

pkgname=adspower-global-bin
pkgver=7.12.29
pkgrel=1
pkgdesc="AdsPower Global antidetect browser repackaged from the official upstream .deb"
arch=('x86_64')
url="https://www.adspower.com/"
license=('custom')
makedepends=('binutils')
provides=('adspower-global')
conflicts=('adspower-global')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: tray icon support'
)
options=('!strip')
source=(
  "AdsPower-Global-${pkgver}-x64.deb::https://version.adspower.net/software/linux-x64-global/${pkgver}/AdsPower-Global-${pkgver}-x64.deb"
)
noextract=("AdsPower-Global-${pkgver}-x64.deb")
sha256sums=('6e8dcd0f746549817b60460197103cd0af98d92d122f6e17a48af8a12be27595')

package() {
  local deb="${srcdir}/AdsPower-Global-${pkgver}-x64.deb"
  local extractdir="${srcdir}/deb-extract"

  rm -rf "${extractdir}"
  install -d "${extractdir}"

  cd "${extractdir}"
  ar x "${deb}"
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/adspower-global" <<'EOF'
#!/bin/sh
exec "/opt/AdsPower Global/adspower_global" "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/adspower-global"

  if [[ -f "${pkgdir}/usr/share/applications/adspower_global.desktop" ]]; then
    sed -i 's|Exec="/opt/AdsPower Global/adspower_global" %U|Exec=adspower-global %U|' \
      "${pkgdir}/usr/share/applications/adspower_global.desktop"
  fi

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sf "/opt/AdsPower Global/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
}
