# Maintainer: RiverOnVenus <aur@zhui.dev>
# Contributor: Wensheng Tang <sp3478@gmail.com>
# Upstream has no Linux download page. This is the endpoint that
# https://uuyc.163.com/install.sh uses: it redirects to a versioned .deb behind
# rotating signed parameters, so the URL carries no version and the checksum
# pins each release.

pkgname=uuyc-bin
pkgver=4.48.7.27441
pkgrel=1
pkgdesc='网易UU远程官方 Linux 客户端 (NetEase UU Remote)'
arch=('x86_64')
url='https://uuyc.163.com/'
license=('LicenseRef-proprietary')
provides=('uuyc')
conflicts=('uuyc')
depends=(
  'ca-certificates'
  'cairo'
  'dbus'
  'fontconfig'
  'freetype2'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'libatomic'
  'libdrm'
  'libglvnd'
  'libpulse'
  'libx11'
  'libxcb'
  'libxext'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'libxrender'
  'libxres'
  'libxtst'
  'systemd-libs'
  'vulkan-icd-loader'
  'webkit2gtk-4.1'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'xkeyboard-config'
  'zstd'
)
makedepends=('icoutils')
optdepends=(
  'alsa-lib: ALSA audio backend fallback'
  'apparmor: load the bundled WebView profile when unprivileged user namespaces are restricted'
  'ibus: input method support while ibus runs'
  'intel-media-driver: VA-API hardware video acceleration on Intel GPUs (Broadwell+)'
  'libva: VA-API hardware video decoding'
  'libva-mesa-driver: VA-API hardware video acceleration on AMD GPUs'
  'nvidia-utils: NVENC/NVDEC hardware video encoding and decoding'
  'qt5-translations: Qt UI strings in non-English locales'
  'xdg-desktop-portal: native file dialogs for the xdgdesktopportal Qt platform theme'
)
install="${pkgname}.install"
# The payload is already stripped upstream, so a debug package would be empty.
options=('!debug')

source=("${pkgname}-${pkgver}.deb::https://api.nrd.nie.163.com/api/v1/release/dl/8?channel=gwqd"
        'uuyc.tmpfiles')
sha256sums=('7be456e8012bfcca8d0dad0863265a3bd2756d6c4c0ca7ba13cc65c1ef64cd00'
            'adfd1827cd771b0153d973870c38b1a17dad59362c7eeb7fc19d6b43f4c43449')

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -O data.tar.zst |
    bsdtar -xf - -C "${pkgdir}"

  # Debian keeps system units under /lib, which is a symlink to /usr/lib on Arch.
  install -dm755 "${pkgdir}/usr/lib/systemd/system"
  mv "${pkgdir}/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system/"
  rm -rf "${pkgdir}/lib"

  # Upstream ships a Windows .ico inside hicolor/256x256/apps and hardcodes its
  # path in uuyc.desktop; extract standard PNG sizes for freedesktop launchers.
  local _icodir="${srcdir}/icons" _size
  rm -rf "${_icodir}"
  mkdir -p "${_icodir}"
  icotool -x -o "${_icodir}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/uuyc.ico"
  for _size in 16 24 32 48 64 72 128 256; do
    install -Dm644 "${_icodir}"/uuyc_*_${_size}x${_size}x32.png \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/uuyc.png"
  done
  rm -f "${pkgdir}/usr/share/icons/hicolor/256x256/apps/uuyc.ico"
  sed -i 's|^Icon=.*|Icon=uuyc|' "${pkgdir}/usr/share/applications/uuyc.desktop"

  install -Dm644 "${srcdir}/uuyc.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/uuyc.conf"

  install -Dm644 "${pkgdir}/opt/uuyc/bin/licenses.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/licenses.txt"
  install -Dm644 "${pkgdir}/opt/uuyc/bin/QtLGPL3License.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/QtLGPL3License.txt"
  install -Dm644 "${pkgdir}/opt/uuyc/bin/terminal-launcher/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.terminal-launcher"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/tmux"
  cp -a "${pkgdir}/opt/uuyc/share/tmux/licenses/." \
    "${pkgdir}/usr/share/licenses/${pkgname}/tmux/"
}
