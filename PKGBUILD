# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=tenzen-studio-bin
_pkgname=tenzen
pkgver=0.1.27
pkgrel=1
pkgdesc="Record and edit product demos: cut pauses, add zooms and captions (upstream Flatpak bundle)"
arch=('x86_64')
url="https://tenzen.studio"
license=('LicenseRef-proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'ffmpeg' 'python-xlib')
optdepends=('libpulse: record system audio')
makedepends=('ostree' 'asar')
provides=('tenzen-studio')
conflicts=('tenzen-studio')
options=('!strip' '!debug')
_bundle="Tenzen-${pkgver}-linux-x64.flatpak"
source=("${_bundle}::https://downloads.tenzen.studio/desktop/stable/linux/${pkgver}/${_bundle}")
noextract=("${_bundle}")
sha256sums=('18aefb168074b8d47fc1b85ff53be59f4680fe7f013f0dd5cc946750172ed5d9')

prepare() {
  # A Flatpak bundle is an OSTree static delta carrying a single commit:
  # apply it to a throwaway repository and check that commit out.
  rm -rf repo flatpak
  ostree init --repo=repo --mode=bare-user-only
  ostree static-delta apply-offline --repo=repo "${_bundle}"

  local _commit
  _commit="$(find repo/objects -name '*.commit')"
  _commit="$(basename "$(dirname "${_commit}")")$(basename "${_commit}" .commit)"
  ostree checkout --repo=repo --user-mode "${_commit}" flatpak

  # the bundle exports no icon - the app's own is only inside app.asar
  asar extract-file flatpak/files/lib/com.tenzen.desktop/resources/app.asar \
    dist/assets/brand/icon.png
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/flatpak/files/lib/com.tenzen.desktop/." "${pkgdir}/opt/${pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # named after the app's desktopName, so windows are matched to the entry
  install -Dm644 "${srcdir}/flatpak/files/share/applications/com.tenzen.desktop.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i \
    -e "s|^Exec=.*|Exec=${_pkgname} %U|" \
    -e "s|^Icon=.*|Icon=${_pkgname}|" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # 1024x1024, which the hicolor theme has no directory for
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  # A custom licence has to ship its terms. Upstream publishes none as a file,
  # so what goes in is the reference to the terms it is used under, next to
  # the notices for everything bundled with it, which the app dir does carry.
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Tenzen Studio is proprietary software, distributed by Tenzen Studio.

It is not covered by a free-software licence: use is governed by the terms
of service the vendor publishes, and redistribution of the build this
package installs is not granted by them.

Terms of service: https://tenzen.studio/legal/terms-of-service/
EOF

  ln -s "/opt/${pkgname}/resources/THIRD_PARTY_NOTICES.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.txt"
  ln -s "/opt/${pkgname}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s "/opt/${pkgname}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
