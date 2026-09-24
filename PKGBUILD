_pkgname=munder-difflin
pkgname=${_pkgname}-bin
# renovate: datasource=github-releases pkgName=chaitanyagiri/munder-difflin
pkgver=0.5.2
pkgrel=1
pkgdesc="Agent harness to run an office of your clones"
arch=("x86_64")
license=("proprietary")
url="https://munderdiffl.in"
_appimage=Munder-Difflin-${pkgver}-linux-x86_64.AppImage
options=(!strip)
noextract=("${_appimage}")
sha256sums=('e8637b7a98d7e8b417a25ed78f4e61beec6a42813f0890848caaac8953c7130a')

source=(
  #"https://app.harnessmd.com/releases/${_appimage}"
  "https://github.com/chaitanyagiri/munder-difflin/releases/download/v${pkgver}/${_appimage}"
)

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
}
