pkgname=kimi-desktop-bin
pkgver=1.0.0
pkgrel=3
pkgdesc='Kimi AI assistant desktop client'
arch=('x86_64')
url='https://kimi.moonshot.cn/'
license=('LicenseRef-proprietary')
depends=(
  'cairo'
  'curl'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libayatana-appindicator'
  'libsoup'
  'openssl'
  'pango'
  'webkit2gtk'
  'wget'
)
provides=('kimi-desktop')
conflicts=('kimi-desktop')
source=('Kimi_x86_64.deb::https://kimi-moonshot.github.io/download/Kimi_x86_64.deb')
noextract=('Kimi_x86_64.deb')
sha256sums=('822abf05bd669201c9984e828b2624e67e0923ac3cb5a6bcc72f91bc61324e7c')

pkgver() {
  local control_archive version

  control_archive="$(
    bsdtar -tf "${srcdir}/Kimi_x86_64.deb" |
      awk '/^control\.tar(\..+)?$/ { print; exit }'
  )"
  version="$(
    bsdtar -xOf "${srcdir}/Kimi_x86_64.deb" "${control_archive}" |
      bsdtar -xOf - control |
      sed -n 's/^Version: //p'
  )"

  printf '%s\n' "${version//-/.}"
}

package() {
  local data_archive

  data_archive="$(
    bsdtar -tf "${srcdir}/Kimi_x86_64.deb" |
      awk '/^data\.tar(\..+)?$/ { print; exit }'
  )"
  bsdtar -xOf "${srcdir}/Kimi_x86_64.deb" "${data_archive}" |
    bsdtar -xf - --no-same-owner -C "${pkgdir}"

  # Upstream also ships a stale launcher for a nonexistent executable.
  rm -f "${pkgdir}/usr/share/applications/com-pake-kimi.desktop"

  # The upstream 400x400 directory is not part of the hicolor theme index.
  # Install the icon in the unthemed fallback so launchers can find it.
  install -d "${pkgdir}/usr/share/pixmaps"
  mv "${pkgdir}/usr/share/icons/hicolor/400x400/apps/kimi.png" \
    "${pkgdir}/usr/share/pixmaps/kimi.png"
  rmdir \
    "${pkgdir}/usr/share/icons/hicolor/400x400/apps" \
    "${pkgdir}/usr/share/icons/hicolor/400x400" \
    "${pkgdir}/usr/share/icons/hicolor" \
    "${pkgdir}/usr/share/icons"

  # Avoid conflicting with the /usr/bin/kimi executable provided by kimi-code.
  mv "${pkgdir}/usr/bin/kimi" "${pkgdir}/usr/bin/kimi-desktop"
  sed -i 's/^Exec=kimi\([[:space:]]\|$\)/Exec=kimi-desktop\1/' \
    "${pkgdir}/usr/share/applications/kimi.desktop"
}
