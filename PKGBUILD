# Maintainer: fuero <fuerob@gmail.com>
_pkgname=munder-difflin
pkgname=${_pkgname}-bin
# renovate: datasource=github-releases depName=chaitanyagiri/munder-difflin
pkgver=0.5.2
pkgrel=2
pkgdesc='Agent harness to run an office of your clones'
arch=('x86_64')
license=(MIT 'LicenseRef-LICENSE-ASSETS')
url='https://munderdiffl.in'
_appimage="Munder-Difflin-${pkgver}-linux-x86_64.AppImage"
options=(!strip !debug !lto)
noextract=("${_appimage}")
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
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
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nodejs'
  'nspr'
  'nss'
  'pango'
  'python'
)

source=(
  "https://github.com/chaitanyagiri/munder-difflin/releases/download/v${pkgver}/${_appimage}"
  https://raw.githubusercontent.com/chaitanyagiri/munder-difflin/refs/heads/main/LICENSE
  https://raw.githubusercontent.com/chaitanyagiri/munder-difflin/refs/heads/main/LICENSE-ASSETS
)
sha256sums=('e8637b7a98d7e8b417a25ed78f4e61beec6a42813f0890848caaac8953c7130a'
            '3fe5c1c9c922a77cd084e7671223589606b1f926c15e2751fc602b8dc6fc0181'
            '76eef4bfaccdd63371f43b729e102f3557e0c2bf67a2b86210f2a2a20981d277')

prepare() {
  chmod u+x ${_appimage}
  ./${_appimage} --appimage-extract
}

package() {
  local instdir="/usr/lib/${pkgname}"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/bin"
  sed -e '/Exec=/d' -e "\$a Exec=/usr/bin/${_pkgname}" squashfs-root/${_pkgname}.desktop \
	  > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cat > ${pkgdir}/usr/bin/${_pkgname} << EOF
#/!bin/bash
set -euo pipefail
exec ${instdir}/${_pkgname} "$@"
EOF
  chmod 0755 ${pkgdir}/usr/bin/${_pkgname}

  rm -rf squashfs-root/usr/lib
  rm -f squashfs-root/${_pkgname}.desktop
  install -d "${pkgdir}/usr/share"
  mv squashfs-root/usr/share/* ${pkgdir}/usr/share/
  rm -rf squashfs-root/usr

  # Full app tree (bundles its own Electron — no system electron dep needed).
  # chrome-sandbox is left non-setuid: Electron uses the unprivileged
  # user-namespace sandbox on Arch (kernel.unprivileged_userns_clone=1).
  install -dm755 "${pkgdir}$instdir"
  cp -r squashfs-root/. "${pkgdir}$instdir/"
  chmod -R u=rwX,go=rX "${pkgdir}$instdir" "${pkgdir}/usr/share/"
  chmod 0755 ${pkgdir}${instdir}/${_pkgname}
  ln -snf "/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" \
	  "${pkgdir}${instdir}/${_pkgname}.png"
  ln -snf "/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" \
	  "${pkgdir}${instdir}/.DirIcon"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-ASSETS -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
