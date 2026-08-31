# Maintainer: Malte Linke <me@parzival.space>
# Contributor: Vladislav <your@email.com>

pkgname=fluorine-manager-bin
pkgdesc='A native Linux mod manager for Bethesda and other games, built on MO2'
pkgver=0.3.3 # renovate: datasource=github-tags depName=SulfurNitride/Fluorine-Manager versioning=semver
pkgrel=1
arch=('x86_64')
url='https://github.com/SulfurNitride/Fluorine-Manager'
license=('GPL-3.0-or-later')
provides=('fluorine-manager')
conflicts=('fluorine-manager')
depends=('mesa' 'gcc-libs' 'hicolor-icon-theme')
optdepends=('steam: allows the usage of Proton')
options=(!strip)

_releaseArchive="fluorine-manager-$pkgver.tar.gz"
source=("${_releaseArchive}::https://github.com/SulfurNitride/Fluorine-Manager/releases/download/v${pkgver}/${_releaseArchive}"
        "LICENSE::https://raw.githubusercontent.com/SulfurNitride/Fluorine-Manager/refs/tags/v${pkgver}/LICENSE.txt")
sha256sums=('8a04af17e2a0c84b4589ed8acf18dae440d3b0177e50276ffb0af7c24a6a4497'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

build() {
  # patch the original launch wrapper script to disable the sync dance stuff.
  # the sed command below will:
  # - overwrite the install target to ensure the sync process will always be skipped
  # - overwrite the desktop icon install target, so it will never be installed by fluorine-manager
  # - hard code the desktop file check to false, so fluorine-manager never creates a separate installation in the user home
  sed -i \
    -e 's|^BIN_DST="${FLUORINE_DATA}/bin"|BIN_DST="/opt/fluorine-manager"|' \
    -e 's|^ICON_DST="${HOME}/.local/share/icons/hicolor/256x256/apps/com.fluorine.manager.png"|ICON_DST="${ICON_SRC}"|' \
    -e 's|^if \[ -f "${DESKTOP_SRC}" \]; then|if false; then|' \
    ${srcdir}/fluorine-manager/fluorine-manager

  # fluorine-manager ships its own fontconfig library and requires a patched configuration for it.
  # this will patch the fontconfig fix in the wrapper script to be compatible with this package.
  sed -i \
    -e 's|mkdir -p "${RUN}/etc/fonts"|mkdir -p "${FLUORINE_DATA}/bin/etc/fonts"|' \
    -e 's|cat > "${RUN}/etc/fonts/fonts.conf" <<EOF|cat > "${FLUORINE_DATA}/bin/etc/fonts/fonts.conf" <<EOF|' \
    -e 's|export FONTCONFIG_FILE="${RUN}/etc/fonts/fonts.conf"|export FONTCONFIG_FILE="${FLUORINE_DATA}/bin/etc/fonts/fonts.conf"|' \
    -e 's|export FONTCONFIG_PATH="${RUN}/etc/fonts"|export FONTCONFIG_PATH="${FLUORINE_DATA}/bin/etc/fonts"|' \
    ${srcdir}/fluorine-manager/fluorine-manager
}

package() {
  # install archive files
  install -dm755 "${pkgdir}/opt/fluorine-manager"
  cp -a "${srcdir}/fluorine-manager/." "${pkgdir}/opt/fluorine-manager"

  # link to bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/fluorine-manager/fluorine-manager" "${pkgdir}/usr/bin/fluorine-manager"

  # install desktop icon
  install -Dm644 "${srcdir}/fluorine-manager/icons/com.fluorine.manager.desktop" "${pkgdir}/usr/share/applications/com.fluorine.manager.desktop"
  install -Dm644 "${srcdir}/fluorine-manager/icons/com.fluorine.manager.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.fluorine.manager.png"

  # install license file
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
