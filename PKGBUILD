# Maintainer: duanluan <duanluan@outlook.com>

pkgname=uuway-bin
pkgver=1.5.6
pkgrel=1
pkgdesc='UU Remote Linux host (prebuilt binary)'
arch=('x86_64')
url='https://github.com/GaryOAO/UUWay'
license=('AGPL-3.0-only')
# Upstream is open source but this package repacks its official prebuilt Arch
# release, so the name carries the -bin suffix per the AUR packaging rules.
depends=(
  'alsa-lib'
  'at-spi2-core'
  'ca-certificates'
  'curl'
  'desktop-file-utils'
  'ffmpeg'
  'fontconfig'
  'freetype2'
  'gettext'
  'gnutls'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk-update-icon-cache'
  'gtk3'
  'json-c'
  'libarchive'
  'libpcap'
  'libpulse'
  'libunwind'
  'libva'
  'libx11'
  'libxcursor'
  'libxext'
  'libxfixes'
  'libxi'
  'libxinerama'
  'libxkbcommon'
  'libxrandr'
  'libxrender'
  'pipewire'
  'procps-ng'
  'python'
  'python-dbus'
  'python-gobject'
  'systemd'
  'vulkan-icd-loader'
  'wayland'
  'xclip'
  'xorg-server-xvfb'
  'xorg-xauth'
)
provides=('uuway')
conflicts=('uuway' 'uuway-git')
options=('!strip' '!debug')
install=uuway-bin.install
source_x86_64=("uuway-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/GaryOAO/UUWay/releases/download/v${pkgver}/uuway-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('d706f5588aab96c46a4d095c50c2b7221acb4f1a82ad4efc3095d828fe5b4e3a')

package() {
  # Repack upstream's own Arch package as-is.
  bsdtar -xf "${srcdir}/uuway-${pkgver}-1-x86_64.pkg.tar.zst" -C "${pkgdir}"
  rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.INSTALL" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"

  # The built-in self-updater detects the installed version via `pacman -Q uuway`
  # and installs uuway-*.pkg.tar.zst, which can never work under package name
  # uuway-bin. Flip upstream's own opt-in flag so the console stops offering
  # updates; users update through their AUR helper instead.
  sed -i 's/"ota": true/"ota": false/' "${pkgdir}/usr/lib/uuway/package-info.json"

  install -Dm644 "${pkgdir}/usr/share/doc/uuway/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
