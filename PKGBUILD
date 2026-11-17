# Maintainer: czyt <czytcn@gmail.com>

pkgname=openwren-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Privacy-first mail app for Gmail and any IMAP account: mail stays in an encrypted database on your own computer, trackers are stripped and suspicious messages are flagged"
arch=('x86_64')
url="https://openwren.app"
license=('Apache-2.0')
# The renderer is WebKitGTK, so the mail window is a GTK 3 window driven by
# webkit2gtk-4.1; dbus is linked directly for the desktop integration.
depends=('glibc' 'libgcc' 'dbus' 'gtk3' 'libsoup3' 'webkit2gtk-4.1')
optdepends=(
  'libayatana-appindicator: tray icon and its menu'
)
provides=('openwren')
conflicts=('openwren' 'openwren-git')
# Upstream's binary keeps its symbols, and a debug package would duplicate its
# 43 MB a second time.
options=('!strip' '!debug')

_deb_x86_64="openwren_${pkgver}_amd64.deb"
source_x86_64=("${_deb_x86_64}::https://github.com/VinceGHER/openwren/releases/download/v${pkgver}/${_deb_x86_64}")
noextract=("${_deb_x86_64}")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '9f38e9d63ddcf1482f7d9572efa439babff742f012940ef60eb3929589102c5c')
sha256sums_x86_64=('ffa7a8e455027140daa516f8be249cf3b45630875e78804555cf745126f21f9a')
# The .deb carries no licence text, so take it from the release tag itself.
source=("openwren-LICENSE::https://raw.githubusercontent.com/VinceGHER/openwren/v${pkgver}/LICENSE"
        "openwren-NOTICE::https://raw.githubusercontent.com/VinceGHER/openwren/v${pkgver}/NOTICE")

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"
  local data_archive

  # Their deb builds have used different data.tar compressions, so look the
  # member up instead of assuming one.
  data_archive="$(bsdtar -tf "${srcdir}/${deb}" | sed -n '/^data\.tar/{p;q;}')"
  if [[ -z "${data_archive}" ]]; then
    echo "Could not find data.tar.* in ${deb}" >&2
    return 1
  fi

  # The .deb already lays out the binary, the desktop entry and the hicolor
  # icons the way Arch wants them, so it can be unpacked as it is.
  bsdtar -xOf "${srcdir}/${deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  install -Dm644 "${srcdir}/openwren-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/openwren-NOTICE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
