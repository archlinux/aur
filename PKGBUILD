# Maintainer: Silas Ribeiro <santorsilas@gmail.com>

pkgname=remote-pi-cockpit-bin
_pkgname=remote-pi-cockpit
epoch=1
pkgver=1.14.11
pkgrel=1
pkgdesc="Desktop client for Remote Pi, a multi-pane GUI for the Pi coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/jacobaraujo7/remote_pi"
license=('LicenseRef-proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'libepoxy'
  'mpv'
  'pango'
  'zlib'
)
provides=("remote-pi-cockpit=${pkgver}")
conflicts=('remote-pi-cockpit')
options=('!strip' '!debug')

source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64.deb::https://github.com/jacobaraujo7/remote_pi/releases/download/cockpit-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
source_aarch64=(
  "${_pkgname}-${pkgver}-aarch64.deb::https://github.com/jacobaraujo7/remote_pi/releases/download/cockpit-v${pkgver}/${_pkgname}_${pkgver}_arm64.deb"
)
sha256sums_x86_64=('d11fcb522cf4a027ebb3ac139fa6600b3cb407b004f80f2d0a8eabd5204a3d82')
sha256sums_aarch64=('0f58ada9c53e00760a0409173143f9f9aeb98158b4b3bc0f07b142d9324eb92d')
noextract=(
  "${_pkgname}-${pkgver}-x86_64.deb"
  "${_pkgname}-${pkgver}-aarch64.deb"
)

package() {
  local deb="${srcdir}/${_pkgname}-${pkgver}-${CARCH}.deb"

  # Extract only the application payload. Debian maintainer scripts must not
  # run while creating an Arch package.
  bsdtar -xOf "${deb}" data.tar.zst |
    bsdtar --no-same-owner -xf - -C "${pkgdir}" ./opt/cockpit

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/cockpit/cockpit "${pkgdir}/usr/bin/cockpit"

  install -Dm644 \
    "${pkgdir}/opt/cockpit/share/applications/work.jacobmoura.cockpit.desktop" \
    "${pkgdir}/usr/share/applications/work.jacobmoura.cockpit.desktop"
  install -Dm644 \
    "${pkgdir}/opt/cockpit/share/metainfo/work.jacobmoura.cockpit.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/work.jacobmoura.cockpit.metainfo.xml"

  local size
  for size in 64 128 256 512 1024; do
    install -Dm644 \
      "${pkgdir}/opt/cockpit/share/icons/hicolor/${size}x${size}/apps/work.jacobmoura.cockpit.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/work.jacobmoura.cockpit.png"
  done

  rm -rf "${pkgdir}/opt/cockpit/share"
}
