# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>
# Unofficial package of GapGPT desktop (with the bundled GapCode agent)
# GapGPT all rights reserved ©

pkgname=gapgpt-desktop-bin
pkgver=1.3.26
pkgrel=1
pkgdesc="GapGPT desktop AI workspace with a local GapCode agent server (unofficial package)"
arch=('x86_64' 'aarch64')
url="https://gapgpt.app"
# The app is proprietary (metainfo: LicenseRef-proprietary); Electron is MIT.
license=('LicenseRef-gapgpt' 'MIT')
# Direct ELF dependencies of the Electron binary and the bundled node, plus
# bubblewrap (GapCode sandboxes the commands it runs) and libsecret
# (Electron safeStorage).
depends=(
  'alsa-lib' 'at-spi2-core' 'bubblewrap' 'cairo' 'dbus' 'expat' 'glib2' 'glibc'
  'gtk3' 'libcups' 'libgcc' 'libsecret' 'libstdc++' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
  'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs'
)
optdepends=(
  'python-gobject: computer use (desktop accessibility via AT-SPI)'
  'xdotool: computer use on X11'
  'libappindicator-gtk3: tray icon'
  'xdg-utils: open links in the default browser'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
# Prebuilt Electron app: nothing to strip, no debug info.
options=('!strip' '!debug')
# https://gapgpt.app/releases/gapgpt-desktop.deb always points at the latest
# build, so use the versioned files listed in the updater feeds instead:
#   curl -s https://gapgpt.ir/releases/app/desktop/latest-linux.yml
#   curl -s https://gapgpt.ir/releases/app/desktop/latest-linux-arm64.yml
# Those feeds publish sha512 (base64); convert with: base64 -d | xxd -p -c64
_base=https://gapgpt.ir/releases/app/desktop
# The arm64 feed lags behind: keep aarch64 on the newest build it lists.
_pkgver_aarch64=1.3.25
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_base}/linux/${pkgver}/GapGPT_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${_pkgver_aarch64}-aarch64.deb::${_base}/linux-arm64/${_pkgver_aarch64}/GapGPT_${_pkgver_aarch64}_arm64.deb")
sha512sums_x86_64=('80ee1982ae9033565fdfac7443c6cb88ee75cfa94dec4dd82547259721db4af379e48b81da602770b042ee75b8ebe395f2d14915aff8a42f34e846e5fc4b030c')
sha512sums_aarch64=('430a1b0094253b671e1a5db11a9bffb6898ffca36e740fb19529e136e9500da2cb1cef55cc3c6f3fdc39c81c15b1a578cf1726ef0e21aa70c7e1cd25b67a1515')
noextract=("${pkgname}-${pkgver}-x86_64.deb" "${pkgname}-${_pkgver_aarch64}-aarch64.deb")

package() {
  local _deb="${pkgname}-${pkgver}-x86_64.deb"
  [[ $CARCH == aarch64 ]] && _deb="${pkgname}-${_pkgver_aarch64}-aarch64.deb"
  bsdtar -xOf "$_deb" data.tar.gz | bsdtar -xpf - -C "$pkgdir"

  local _app=/opt/GapGPT _res=/opt/GapGPT/resources

  # The .deb ships group-writable dirs and a world-writable chrome-sandbox.
  find "$pkgdir" -type d -exec chmod 755 {} +
  chmod -R go-w "$pkgdir"
  # The vendor's postinst makes chrome-sandbox setuid root. Arch kernels allow
  # unprivileged user namespaces, which Chromium's sandbox uses instead.
  chmod 755 "$pkgdir$_app/chrome-sandbox"

  # "deb" makes electron-updater try to install updates with dpkg/apt. Without
  # it, the native updater stays off; update through pacman instead.
  rm -f "$pkgdir$_res/package-type"

  # Debian-only changelog.
  rm -rf "$pkgdir/usr/share/doc"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "$_app/gapgpt" "$pkgdir/usr/bin/gapgpt"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$_app/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  ln -s "$_app/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
