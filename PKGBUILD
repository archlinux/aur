# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=iptvnator
pkgver=0.15.1
pkgrel=4
pkgdesc='Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more'
arch=('x86_64')
url='https://github.com/4gray/iptvnator'
license=('MIT')
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
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxcrypt-compat'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
)
makedepends=('npm')
optdepends=('ffmpeg: audio and video libraries'
            'mpv: media player'
            'vlc: media player')
provides=('iptvnator')
conflicts=('iptvnator')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6059a3a1691244f360b093ea4055bbcfbe7dbec69d3a9e85d3a160b35debd799')

build() {
  cd "${pkgname}-${pkgver}"
  # Fix for '.git can't be found' error
  touch .git
  # Install all dependencies
  npm i --cache "${srcdir}/npm-cache"
  # Build
  npm run build -- -c production
  npm exec electron-builder -- -l pacman
  # Unpack compressed pacman file
  mkdir -p release/pacman
  bsdtar -xf release/${pkgname}-${pkgver}.pacman -C release/pacman
}

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/opt/IPTVnator" "${pkgdir}/usr/share" "${pkgdir}/usr/bin"
  # Install application
  cp -a --no-preserve='ownership' release/pacman/opt/IPTVnator "${pkgdir}/opt"
  ln -sf "/opt/IPTVnator/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # Install icons
  cp -a --no-preserve='ownership' release/pacman/usr/share/icons "${pkgdir}/usr/share"
  # Install desktop file
  install -Dm644 "release/pacman/usr/share/applications/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Install license
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Remove references to $pkgdir
  find "${pkgdir}" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"
}

# vim:set sw=2 sts=-1 et:
