# Maintainer: duanluan <duanluan@outlook.com>

pkgname=uu-remote-linux-bin
pkgver=0.2.56
pkgrel=1
pkgdesc='Unofficial Linux host and viewer for NetEase UU Remote (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/VallierDev/uu-remote-linux'
license=('GPL-3.0-or-later')
# Upstream is open source but this package ships its official prebuilt release
# artifacts, so the name carries the -bin suffix per the AUR packaging rules.
depends=(
  'cairo'
  'ffmpeg'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'libx11'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxtst'
  'pango'
  'sdl2'
  'wayland'
)
optdepends=(
  'libei: GNOME/KDE Wayland portal backend'
  'libpipewire: GNOME/KDE Wayland portal backend'
  'wl-clipboard: clipboard sync on Wayland'
  'nvidia-utils: NVENC hardware encoding'
  'intel-media-driver: VAAPI hardware encoding on Intel GPUs'
  'libva-mesa-driver: VAAPI hardware encoding on AMD GPUs'
  'xorg-server-xvfb: virtual desktop for monitorless servers'
  'xfce4: default session for the virtual desktop'
)
provides=('uu-remote')
conflicts=('uu-remote' 'uu-remote-bin' 'uu-remote-linux')
options=('!strip' '!debug')
install=uu-remote-linux-bin.install
source=(
  'uuremote-native.service'
  '60-uu-remote-linux-uinput.rules'
)
source_x86_64=("uu-remote-linux-v${pkgver}-x86_64-linux.tar.gz::https://github.com/VallierDev/uu-remote-linux/releases/download/v${pkgver}/uu-remote-linux-v${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("uu-remote-linux-v${pkgver}-aarch64-linux.tar.gz::https://github.com/VallierDev/uu-remote-linux/releases/download/v${pkgver}/uu-remote-linux-v${pkgver}-aarch64-linux.tar.gz")
sha256sums=(
  '1bba2b6ada40e980c23c4a78188d694e8c8bc39c3d39e9ffb8a41947501da48e'
  'df21d14e39e6912261e9ecdc2422d242612053beb2cbc3a8755938020abf3e6f'
)
sha256sums_x86_64=('c5aca69fc00c5c1cb3884be7d3304d49304d210545a7f6aec6db348a58bae879')
sha256sums_aarch64=('72e8b02505f48723444e9a165bb72a820a7a24fe96b3b76fd3384159e252059b')

package() {
  local _dir="uu-remote-linux-v${pkgver}-${CARCH}-linux"

  cd "${srcdir}/${_dir}"

  install -Dm755 uuremote-server "${pkgdir}/usr/bin/uuremote-server"
  install -Dm755 uuremote-viewer "${pkgdir}/usr/bin/uuremote-viewer"

  # Capture/input plugins, dlopened by uuremote-server per session type.
  install -Dm644 libuu-wayland.so "${pkgdir}/usr/lib/uu-remote-linux/libuu-wayland.so"
  install -Dm644 libuu-portal.so "${pkgdir}/usr/lib/uu-remote-linux/libuu-portal.so"

  install -Dm644 contrib/desktop/uu-remote-linux.desktop "${pkgdir}/usr/share/applications/uu-remote-linux.desktop"
  install -Dm644 contrib/desktop/uu-remote-linux-viewer.desktop "${pkgdir}/usr/share/applications/uu-remote-linux-viewer.desktop"
  install -Dm644 contrib/desktop/uu-remote-linux.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/uu-remote-linux.svg"

  # The unit name must stay uuremote-native.service: uuremote-server show and
  # the desktop entry manage exactly this unit.
  install -Dm644 "${srcdir}/uuremote-native.service" "${pkgdir}/usr/lib/systemd/user/uuremote-native.service"
  install -Dm644 "${srcdir}/60-uu-remote-linux-uinput.rules" "${pkgdir}/usr/lib/udev/rules.d/60-uu-remote-linux-uinput.rules"

  install -Dm755 contrib/virtual-desktop/uu-virtual-desktop "${pkgdir}/usr/bin/uu-virtual-desktop"
  install -Dm644 contrib/virtual-desktop/uu-virtual-desktop.service "${pkgdir}/usr/lib/systemd/user/uu-virtual-desktop.service"
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/uu-virtual-desktop|' \
    "${pkgdir}/usr/lib/systemd/user/uu-virtual-desktop.service"
  install -Dm644 contrib/virtual-desktop/virtual-display.conf \
    "${pkgdir}/usr/share/doc/${pkgname}/virtual-display.conf.example"

  install -Dm644 config.example.json "${pkgdir}/usr/share/doc/${pkgname}/config.example.json"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
