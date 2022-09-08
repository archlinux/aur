# Maintainer: Björn Bidar <AUR+me@thaodan.de>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Ivelin Velkov <ivelin dot velkov at gmail dot com>

_pkgname=teams-for-linux
pkgname=${_pkgname}-wbundled-electron
pkgver=1.0.33
pkgrel=1
pkgdesc="Unofficial Microsoft Teams client for Linux using Electron."
arch=("any")
url="https://github.com/IsmaelMartinez/${_pkgname}"
license=("GPL3")
depends=("electron")
makedepends=("node-gyp" "yarn" "asar")
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/IsmaelMartinez/${_pkgname}/archive/v${pkgver}.tar.gz"
  "${_pkgname}.desktop.in"
)
sha256sums=('b775ab9d763565e491ab2a91fc1162fd04691ee6f8a4295f498652c507bdf5a3'
            '9ebf37120c1968e8c4656f7e97b6fa23b8906be4b1bc1059645fd71c1ae2d941')
prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed -i '/"electron": /d' ./package.json

  yarn upgrade "electron@$_ver" \
       --cache-folder "${srcdir}/yarn-cache"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  yarn \
       run electron-builder --linux --"${!CARCH}" --dir \
       -c.electronDist=/usr/lib/electron \
       -c.electronVersion="$_ver"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local file filename
  local pkgsharedir="/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}${pkgsharedir}"  "${pkgdir}/usr/bin"
  cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}${pkgsharedir}"

  sed -e "s/@VERSION@/$pkgver-$pkgrel/" "${srcdir}/${_pkgname}.desktop".in \
      > "${srcdir}/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  for file in "${srcdir}/${_pkgname}-${pkgver}/build/icons/"*.png
  do
    filename="$(basename ${file})"
    install -Dm644 "${file}" "${pkgdir}/usr/share/icons/hicolor/${filename%.png}/apps/${_pkgname}.png"
  done
  cat > "${pkgdir}/usr/bin/$_pkgname" <<EOF
#!/bin/sh

exec electron "${pkgsharedir}"/app.asar  \"\$@\"
EOF
  chmod 755 "${pkgdir}/usr/bin/$_pkgname"
}
