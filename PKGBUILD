# Maintainer: RiverOnVenus <aur@zhui.dev>
# Upstream has no Linux download page. This is the endpoint that
# https://uuyc.163.com/install.sh uses: it redirects to a versioned .deb behind
# rotating signed parameters, so the URL carries no version and the checksum
# pins each release.

pkgname=uuyc-bin
pkgver=4.48.6.41668
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
optdepends=(
  'apparmor: load the bundled WebView profile when unprivileged user namespaces are restricted'
  'ibus: input method support while ibus runs'
  'libva: hardware video decoding'
  'nvidia-utils: NVENC hardware encoding'
  'qt5-translations: Qt UI strings in non-English locales'
  'xdg-desktop-portal: native file dialogs for the xdgdesktopportal Qt platform theme'
)
install="${pkgname}.install"
# The payload is already stripped upstream, so a debug package would be empty.
options=('!debug')

source=("${pkgname}-${pkgver}.deb::https://api.nrd.nie.163.com/api/v1/release/dl/8?channel=gwqd"
        'uuyc.tmpfiles')
sha256sums=('ceec564f9e80c891d1e3b586e7e1520a98e6c3e98997400c8e5fb63f145bf07a'
            'adfd1827cd771b0153d973870c38b1a17dad59362c7eeb7fc19d6b43f4c43449')

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -O data.tar.zst |
    bsdtar -xf - -C "${pkgdir}"

  # Debian keeps system units under /lib, which is a symlink to /usr/lib on Arch.
  install -dm755 "${pkgdir}/usr/lib/systemd/system"
  mv "${pkgdir}/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system/"
  rm -rf "${pkgdir}/lib"

  install -Dm644 "${srcdir}/uuyc.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/uuyc.conf"

  install -Dm644 "${pkgdir}/opt/uuyc/bin/licenses.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/licenses.txt"
  install -Dm644 "${pkgdir}/opt/uuyc/bin/QtLGPL3License.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/QtLGPL3License.txt"
}
